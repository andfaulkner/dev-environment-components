// ******************************** BOOT ********************************
var app = koa();

// namespace to extend for data useful through all of app lifetime is app.context
app.context.dbName = 'postgres';

// ******************************** ERROR HANDLING ********************************
// 
// default: send errors to stderr
// custom error-handling logic can be defined, to which errors are directed rather than stdout:
app.on('error', function(err){
  log.error('server error', err);
});

// Context instance is passed to error if client can't
app.on('error', function(err, ctx){
  log.error('server error', err, ctx);
});

// ***********************************************************************************************
// ******************************************* CONTEXT *******************************************
// ***********************************************************************************************

// ******** app.context ********
//
// encapsulates node's request and response objects into a single object
// provides many helpful methods
// 
// A Context is created per each request
// Referenced in middleware as 'this', with the Koa receiver & Koa response objects as properties
app.use(function *(){
  this; // is the Context
  this.request; // is a koa Request
  this.response; // is a koa Response
});

// **************** context.req and context.res ****************
//
// the Node request and response objects

// **************** context.state ****************
// recommended namespace for passing info thru middleware --> frontend.  e.g.
this.state.user = yield User.find(id);

// **************** ctx.throw([msg], [status], [properties]) ****************
//
// Throw an error that Koa can properly respond to. Has a .status property defaulting to 500
// Allowed combinations of properties:
this.throw(403);
this.throw('name required', 400);
this.throw(400, 'name required');
this.throw('something exploded');
// These are sugar - e.g. this.throw('name req', 400); is equivalent to:
var err = new Error('name required');
err.status = 400;
throw err;
// properties: an object literal that gets merged into the error as-is. 
// Lets you e.g. decorate the err to be more human-friendly. e.g. use:
this.throw(401, 'access_denied', { user: user });

// **************** ctx.assert(value, [msg], [status], [properties]) ****************
//
// example:
this.assert(this.state.user, 401, 'User not found. Please login!');


// ***********************************************************************************************
// ******************************************* REQUEST *******************************************
// ***********************************************************************************************
// Contains user request info

// **************** request.href ****************
// - full request URL e.g.
this.request.href
// => http://example.com/foo/bar?q=1

// **************** request.query **************** 
// get parsed query string (i.e. string after ?)
// e.g. if query is ?color=blue&size=small...
this.request.query
// => { color: 'blue', size: 'small' }

// **************** request.protocol **************** 
// Return request protocol, "https" or "http
// e.g. if https://localhost
this.request.protocol;	//=> https

// **************** request.ip **************** 
// Return remote ip. e.g.
this.request.ip;	//=> 123.943.12.321

// **************** request.subdomains **************** 
// Return dot separated parts of host before main app domain e.g. for www.asdf.heroku.com
this.request.subdomains;	//=> ['asdf', 'www']

// **************** request.is(types...) ****************
// check if incoming request has Content-Type header field, & if it contains any of given
// mime types. If request has no body, returns undefined. If no content type, or match
// fails, returns false. Otherwise returns matching content type. Allows wildcards.
//
// e.g. With Content-Type: text/html; charset=utf-8
this.request.is('html'); //=> 'html'
this.request.is('text/html'); //=> 'text/html'
this.request.is('text/*', 'text/html'); //=> 'text/html'
//
// e.g. With Content-Type application/json
this.is('json', 'urlencoded'); // => 'json'
this.is('application/json'); // => 'application/json'
this.is('html', 'application/*'); // => 'application/json'
this.is('html'); // => false
//
// e.g. to ensure a given route only gets images
if (this.is('image/*')) {
  // ...process image///
} else {
  this.throw(415, 'images only!');
}

// **************** request.socket ****************
// returns request socket. e.g.
this.request.socket // => 8080

// **************** request.get(field) ****************
// returns request header


// ***********************************************************************************************
// ****************************************** RESPONSE *******************************************
// ***********************************************************************************************

// response.body
// get response body. e.g.
this.response.body // => 'crazy shit in here

// response.body=
// set response body. examples:
this.response.body = 'some string';
this.response.body = { 'key': 'value', 'key2': 'value2' }; // <<<< this is a json object

// response.type=
// set response type. e.g.
this.type = 'text/plain; charset=utf-8';
this.type = 'image/png';
this.type = '.png';
this.type = 'png';
this.type = 'html'; // sets charset to utf-8

// response.is(types...)
// near-identical to request.is. Checks if response type is of the given type. e.g.
var minify = require('html-minifier');

app.use(function *minifyHTML(next){
  yield next;
  if (!this.response.is('html')) return;
  var body = this.body;
  if (!body || body.pipe) return;
  if (Buffer.isBuffer(body)) body = body.toString();
  this.body = minify(body);
});
