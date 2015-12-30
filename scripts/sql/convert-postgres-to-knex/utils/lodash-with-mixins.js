var path = require('path');
var fs = require('fs');
var util = require('util');
var childProcess = require('child_process');
var events = require('events');

var _ = require('lodash');
var async = require('async');

// var logger = require('lib/core/log.js').file('sql_to_knex/utils/lodash-with-mixins.js');


/***
*			Lodash mixins
*/
_.mixin({

	/***
	*		Trim each string within an array.
	*		Defaults to regular trim if it receives a string.
	*		@param arr {Array<String>} Each string in this array gets trimmed
	*		@param charsToTrim {String} chars to rm from both ends of each string in arr
	*		@return {Array} Array of trimmed strings
	*/
	trimAll: function(arr, charsToTrim) {
		if (!_.isArray(arr) && !_.isString(arr)) {
			console.trace(__filename + ': _.trimAll mixin');
			throw new TypeError('1st _.trimAll param must be an array. ', arr);
			return false;
		}
		if (_.isString(arr)){
			return _.trim(arr, charsToTrim);
		}
		return _.reduce(arr, function(trimmedStrsArr, strFromArr) {
			trimmedStrsArr = trimmedStrsArr || [];
			trimmedStrsArr.push(_.trim(strFromArr, charsToTrim || ' '));
			return trimmedStrsArr;
		}, []);
	},

	/***
	*		Uses try-catch to handle potential JSON.parse errors
	*		@param str {String} stringified JSON, to attempt to parse into a JS object
	*		@return {Object||Error} parsed JSON if successful, generated error if not
	*/
	parseJSON: function parseJSON(str) {
		try {
			return JSON.parse(str);
		}
		catch (e) {
			console.error(e);
			console.trace(__filename + ': unable to parse JSON: in _.parseJSON');
			return e;
		}
	},

	/***
	*		Checks if any items match between the arrays (any # of arrays)
	*		@param ...arrays {Arrays} Arrays to compare to one another. Can accept any number.
	*		@return {Boolean} true if any items match; otherwise false
	*/
	hasIntersection: function hasIntersection( /*...arrays*/ ) {
		var collections = _.rest(arguments);
		return _.some(_.first(arguments), function(item) {
			return _(collections).chain()
				.map(_.ary(_.partial(_.includes, item), 1))
				.compact()
				.size()
				.isEqual(collections.length)
				.value();
		});
	},

	/***
	*		Uppercase 1st char, all others lowercase, with appropriate spaces between words.
	*		Converts hyphens & underscores to spaces; finds camelCase word boundaries based
	*		on capital letters & performs appropriate conversion (e.g. myWords -> my Words)
	*
	*		@param {String} str - string to convert to 'properCase'
	*		@returns {String} str param in proper case form
	*/
	sentenceCase: function sentenceCase(str) {
		return _(str)
			.startCase()
			.toLowerCase()
			.trimLeft(' ')
			.replace(/^\w/g,
				function(firstCharOfWord) {
					return firstCharOfWord.toUpperCase();
				})
	},

	/***
	*		camelCase, but with 1st char in uppercase
	*		@example _.pascalCase('my string here'); //--> 'MyStringHere'
	*/
	pascalCase: function pascalCase(str){
		return _.camelCase(str).replace(/^[a-z]/, function(firstCharOfStr){
			return firstCharOfStr.toUpperCase();
		});
	},

	//Alias because I always forget which they call it
	titleCase: _.startCase,

	/***
	*		High-speed function to return only the unique items from an array.
	*		For use with extremely large arrays (e.g. translations).
	*		Ugly but highly optimized.
	*/
	uniqueFast: function uniqueFast(arr) {
    var o = {}, i, l = arr.length, r = [];
    for(i=0; i<l;i+=1) o[arr[i]] = arr[i];
    for(i in o) r.push(o[i]);
    return r;
	},

	cleanAllStringsInArray: function cleanAllArrayStrings(arr){
		return _.chain(arr)
			.trimAll('\n')
			.trimAll(' ')
			.value();
	},

	revConcat: function revConcat(arr, newVal){
		return _.chain(arr)
			.reverse()
			.concat(newVal)
			.reverse()
			.value()
	}

});

module.exports = _;