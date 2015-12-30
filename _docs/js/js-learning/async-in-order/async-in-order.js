var async = require('async');
var lodash = require('lodash');
var fs = require('fs');

async.series([
		logga,
		moreLogga,
		reader,
		logga
	], function andWeAreDone(){
		console.log('WE ARE DONE!')
	}
);

function logga(done) {
	console.log('logga done!')
	done(null);
}

function moreLogga(done) {
	console.log('moreLogga done!');
	done(null);
}

function reader(done) {
	fs.readFile('./test-files/test-file-1.txt', {flag: 'r'}, function(err, data) {
		console.log('\ntest-file-1 contents:');
		console.log(data.toString());
		done();
	});	
}