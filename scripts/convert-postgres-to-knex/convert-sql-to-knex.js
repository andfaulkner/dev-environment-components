
var path = require('path');
var fs = require('fs');
var util = require('util');
var childProcess = require('child_process');
var events = require("events");
require('colors');

var _ = require('./utils/lodash-with-mixins.js');
var async = require('async');

var Bluebird = require('bluebird');
// Bluebird.promisify(require("fs").readFile)
var readFile = Bluebird.promisify(fs.readFile);

var sqlFile = './sqlScripts/latest.sql';

var compileData = {
	primaryKeys: {}
};

//Regexes to match components of .sql file
var matchers = {
	createTable: /CREATE\sTABLE\s([^\s]+)[^\(]+\(([^\)]+)\);/g,
	basicDropTable: /\n\s*DROP\sTABLE\s([^\n]+(?=;))/g,
	dropTableIfExists: /\n\s*DROP\sTABLE\sIF\sEXISTS\s([^\n]+(?=;))/g,
	setSqlVar: /\n\s?\s?\s?\s?SET\s([^\n])+;/g,
	multipleLineBreaks: /\n\n\n\n?\n?\n?\n?/g,
	sqlCommentLine: /\n--/g,
	sqlCommentPastLineStart: /\n\s+--/g,
	findAllTablesPrimaryKeys: 
			/ALTER\sTABLE[^\n]+\n[^\n]+ADD\sCONSTRAINT[^\n]+pk_([^\s]+)\sPRIMARY\sKEY\s\(([^\)]+)\);/g
}

/***
*		Wraps error text to add extra info, & to stand out more in the terminal output
*		@param  {String} str - string to accentuate
*		@return {String} accentuated error text
*/
var showErrText = function showErrText(str) {
	return '\n\n' + (__filename + ': ' + str).red.bold.bgBlack + '\n';
};

/***
*		Text wrappers to make generating Knex text easier
*		Each function generates properly formed Knex code
*/
var knexCmdWrap = {
	RAW: function RAW(query){
		return '\nknex.schema.raw(\"' + query + '\");'
	},
	dropTableIfExists: function droptableIfExists(tableName){
		return '\nknex.schema.dropTableIfExists(\'' + tableName + '\');';
	},
	dropTable: function dropTable(tableName){
		return '\nknex.schema.dropTable(\'' + tableName + '\');';
	},
	createTable: function createTable(tableName, tableData){
		return ['knex.schema.createTable(\'' + tableName + '\', function (table) {\n']
			.concat(tableData)
			.concat('});')
			.join('');
	},
	addBoolCol: function addBoolCol(columnName) {
		return '    table.boolean(\'' + columnName + '\')';
	},
	addIntegerCol: function addIntegerCol(columnName) {
		return '    table.integer(\'' + columnName + '\')';
	},
	addVarCharCol: function addVarCharCol(columnName) {
		return '    table.string(\'' + columnName + '\')';
	},
	addTimestampCol: function addTimestampCol(columnName) {
		return '    table.timestamp(\'' + columnName + '\')';
	},
	addJSONCol: function addJSONCol(columnName) {
		return '    table.json(\'' + columnName + '\')';
	}
}
	
/***
*		Used to determine what type a data column is. See getColType function, which consumes this.
*		
*		Comparison is done between the value array for all defined types in the object and the 
*		values of a sql column definition split into an array of words. Comparison iterates 
*		in sync between the 2: i.e. the 1st word of the sqlColWordsArr is compared against the 
*		1st word in the match rule array, the 2nd in sqlColWordsArr gets compared to the 2nd 
*		in the match rules, etc..
*		OR clause means 'it's the type in the key if EITHER value is a match; otherwise 
*		it's an 'AND' clause. Note that the entire OR clause counts as a single array item
*		for comparison (i.e. a single index).
*/
var matchRules = {
	isCharVar: ['character', 'varying'],
	isJson: [{ 
		OR: ['json', 'json[]']
	}],
	isBool: ['boolean'],
	isInteger: ['integer'],
	isTimestamp: ['timestamp', 'with', 'time', 'zone']
};

var getColType = function getColType(sqlColWordsArr){
	return _.findKey(matchRules, function(matchers, matchKey){
		return _.every(matchers, function(matcher, i) {
			return (_.isString(matcher))
				? _.isEqual(sqlColWordsArr[i], matcher)
				: _.includes(matcher.OR, sqlColWordsArr[i]);
			});
	});
}

/***
*		Convert SQL column definition to Knex syntax
*
*		@param sqlColWordsArr {Array} Single column definition expression broken into
*						an array of individual words. Includes column name, data type, etc.
*		@return {Array} knex-friendly syntax for definition of the column,
*						split into array form
*/
var addColumnSqlToKnex = function(sqlColWordsArr, tableName){
	var columnName = _.pullAt(sqlColWordsArr, 0).toString();
	var colType = getColType(sqlColWordsArr);
	var knexColDefArr = [];

	//Convert column to knex equivalent based on sql data type
	switch(colType){
		case 'isCharVar':
			_.pullAt(sqlColWordsArr, 0, 1);
			knexColDefArr.push(knexCmdWrap.addVarCharCol(columnName));
			break;
		case 'isJson':
			_.pullAt(sqlColWordsArr, 0);
			knexColDefArr.push(knexCmdWrap.addJSONCol(columnName));
			break;
		case 'isBool':
			_.pullAt(sqlColWordsArr, 0);
			knexColDefArr.push(knexCmdWrap.addBoolCol(columnName));
			break;
		case 'isInteger':
			_.pullAt(sqlColWordsArr, 0);
			knexColDefArr.push(knexCmdWrap.addIntegerCol(columnName));
			break;
		case 'isTimestamp':
			_.pullAt(sqlColWordsArr, 0, 1, 2, 3);
			knexColDefArr.push(knexCmdWrap.addTimestampCol(columnName));
			break;
		default:
			console.error('\n' + (columnName + ': ' + 
				colType + ': ' + 'unknown type').bgMagenta.bold + '\n');
			break;
	};

	//CONVERT NOT NULL ARGUMENT if present - TODO clean this one up
	if (_.isEqual(_.takeRight(sqlColWordsArr, 2), ['NOT', 'NULL'])) {
		if (knexColDefArr.length > 0) {
			knexColDefArr[knexColDefArr.length - 1] = _.last(knexColDefArr) + '.notNullable()';
			sqlColWordsArr.pop();
			sqlColWordsArr.pop();
		}
	}

	//Add primary key definition
	if (_.isEqual(compileData.primaryKeys[tableName + '_id'], columnName)){
		knexColDefArr[knexColDefArr.length - 1] = _.last(knexColDefArr) + '.primary()';
	}

	//Add end line statement: semicolon and line break
	if (sqlColWordsArr.length === 0) {
		knexColDefArr[_.size(knexColDefArr) - 1] = _.last(knexColDefArr) + ';\n';
	} else {
		console.log('\n\n::::: sqlColWordsArr ::::\n-- items remaining: \n');
		console.log(sqlColWordsArr);
		console.log('::::::::::::::::::::::::::::::::::\n');
	}
	return knexColDefArr;
};
	
/***
*		TODO document this better
*		
*		Takes a CREATE TABLE( ...cols etc here... ) sql block and converts it to Knex syntax
*/
var createTableSQLToKnex = function(tableNameMatch, createColsSqlBlockStr, fullMatch) {
	var tableName = _.trim(tableNameMatch, '\n');

	//---------------- Creates knex code for creating the individual column ----------------//
	var sqlAddColDefsArray = _.chain(createColsSqlBlockStr)
		.split(',')
		.cleanAllStringsInArray() //Convert SQL block to array for processing columns 1 at a time

		//Process each individual column definition string
		.reduce(function(sqlCreateTableBlockArray, columnDefSqlStr){
			// sqlCreateTableBlockArray = sqlCreateTableBlockArray || [];
			return _.chain(columnDefSqlStr)
				.split(' ') //Convert column SQL string to array of words
				.thru(_.partialRight(addColumnSqlToKnex, tableName))
				.revConcat(sqlCreateTableBlockArray)
				.value();
		}, []).value();

	//Wrap function definition around the formatted table
	return knexCmdWrap.createTable(tableName, sqlAddColDefsArray);
};
	//-------------------------------------------------------------------------------------//

/***
*		Main SQL --> KNEX schema conversion function.
*
*		@param  {Error} err - thrown if sql file can't be read in
* 	@param  {String} data - text contents of .sql file read in
* 	@return {String} sql file text converted to Knex syntax
*/
function handleSqlTextBasicClean(data){
	return _.chain(data)
		//Swap SQL comments for JS comments
		.replace(matchers.sqlCommentLine, '\n\/\/')
		.replace(matchers.sqlCommentPastLineStart, '\n\t\/\/')
		//Remore excess spacing
		.replace(matchers.multipleLineBreaks, '\n\n')
		//Convert env var statements from SQL to Knex
		.replace(matchers.setSqlVar, function(fullMatch){
			return knexCmdWrap.RAW(_.chain(fullMatch)
				.cleanAllStringsInArray()
				.trimRight(';')
				.value());
		})
		//Remove explicit character varying lengths
		.replace(/\(255\)/g, '')
		.value();
}

/***
* 	Convert syntax for creating and dropping tables from sql to knex
* 	@param  {String} data - .sql file in string form
* 	@return {String} modified sql file text, in string form
*/
function sqlTableDefToKnex(data) {
	return _.chain(data)
		//Convert DROP TABLE statements & their contents to knex form
		.replace(matchers.dropTableIfExists, function(fullMatch, tableName){
			return knexCmdWrap.dropTableIfExists(tableName);
		})
		.replace(matchers.basicDropTable, function(fullMatch, tableName){
			return knexCmdWrap.dropTable(tableName);
		})
		//Convert CREATE TABLE statements and their contents to knex form
		.replace(matchers.createTable, _.rearg(createTableSQLToKnex, [1, 2, 0]))
		.value();
}

/***
*		Extract an object pairing each table name with its primary key column.
*		Pulls info from 'alteration' commands in sql file.
*/
function gatherPrimaryKeys(data){
	console.log('in!');
	var primaryKeys = {};
  return _.chain(data)
		.replace(matchers.findAllTablesPrimaryKeys, function(fullMatch, tableName, colName){
			primaryKeys[tableName] = colName;
			return '';
		})
		.tap(function(data){
			compileData.primaryKeys = _.merge(compileData.primaryKeys, primaryKeys);
		})
		.value();
}


//
//  LAUNCHES FROM HERE
//
readFile(sqlFile)
	.catch(function handleSQLFileLoadErr(err){
		console.trace(showErrText('readFile failed, with error:'), err);
		throw err;
	})

	.then(gatherPrimaryKeys)
	.catch(function gatherPrimaryKeysFailed(err){
		console.trace(showErrText('gatherPrimaryKeys operation failed with error: ' + err));
	})

	//Handle basic text cleanup in returned sql file
	.then(handleSqlTextBasicClean)
	.catch(function handleSQLTextBasicCleanErr(err){
		console.trace(showErrText('handleSqlTextBasicClean: SQL text cleanup failed with error:'), err);
		throw err;
	})

	//Convert drop and create table syntax to knex
	.then(sqlTableDefToKnex)
	.catch(function sqlTableDefToKnexErr(err){
		console.trace(showErrText('sqlTableDefToKnex: ' +
			'failed SQL-->Knex table syntax conversion. Error:'), err);
		throw err;
	})

	//Final callback - data conversion complete
	.then(function(data){
		console.log(data);
	});
