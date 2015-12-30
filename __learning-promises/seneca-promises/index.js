(function(){
	Error.stackTraceLimit = Infinity;
	require('trace');
	require('clarify')
});

var _ = require('lodash');
var Promise = require('bluebird');
var seneca = require('seneca')();
var request = require('request');

var simpleAPI = require('./plugin_examples/simple_api_1');


//Standard get quote
// request('http://ron-swanson-quotes.herokuapp.com/quotes', function(error, response, body) {
// 	quote = body;
// 	console.log(quote);
// });

function getQuote() {
	return new Promise(function(resolve, reject){
		request('http://ron-swanson-quotes.herokuapp.com/quotes', function(err, response, body) {
			if (err) reject(err);
			else resolve(body);
		});
	});
}

getQuote().then(function(response) {
	console.log(response);
});


seneca.use('plugin_examples/simple_api_1');
console.log(seneca.list());

var senecaActAsync = function senecaActAsync(pattern){
	return new Promise(function(resolve, reject) {
		seneca.act(pattern, function(err, args) {
			if (err) return reject(err);
			else return resolve(args);
		});
	});
};


senecaActAsync({cmd: 'provideOranges', role: 'simple_restapi1'})
	.then(function(args){
		return args;
	})
	.catch(function(err){
		console.log(err);
		throw err;
	})
	//Yay propagation!
	.then(function(args){
		console.log(args);
	})

// ready().then(function(){
// 	console.log('in!');
// }).catch(function(error){
// 	console.trace('here');
// 	console.log(error);
// });