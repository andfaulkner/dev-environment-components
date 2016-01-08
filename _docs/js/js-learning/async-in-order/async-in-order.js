var async = require('async');
var lodash = require('lodash');
var fs = require('fs');

async.series([
		loadServer,
		createUser,
		createCases,
		createTodos,
		createNotes
	], function andWeAreDone(){
		console.log('case generation successful!');
	}
);

function loadServer(done) {
	console.log('loadServer done!')
	done(null);
}

function createUser(done) {
	console.log('createUser done!');
	done(null);
}

function createCases(done) {
	fs.readFile('./test-files/test-file-1.txt', {flag: 'r'}, function(err, data) {
		console.log('\ntest-file-1 contents:');
		console.log(data.toString());
		done();
	});	
}

function createTodos(done) {
	console.log('let\'s create some todos!');
	done(null);
}

function createNotes(done) {
	console.log('note creation time!');
}