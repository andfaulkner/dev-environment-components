/***************************************************************************************************
*
*			GENERATORS EXAMPLE USING KOA
*
*/
var app = koa();

app.use(function *(next) {
	console.log('1: start of gen fn');			//1: when a request occurs, runs 1st
	// on yield (in koa), fn suspends,
	// passes control to next middleware
	yield next;
	console.log('1: end of gen fn');				//7: runs 7th
});

app.use(function *(next) {
	console.log('2: start of gen fn');			//2: runs 2nd
	yield next;
	console.log('2: end of gen fn');				//6: runs 6th
});

app.use(function *(next) {
	console.log('3: start of gen fn');			//3: runs 3rd
	yield next;
	console.log('3: end of gen fn');				//5: runs 5th
});


app.use(function *() {
	console.log('4: emitting hello world');	//4: runs 4th
	this.body = 'Hello World';
});


app.listen(3000);