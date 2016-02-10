// export a single function
function exampleExportedFn(msg) {
	console.log('inside exampleExportedFn!');
	console.log(msg + ' was given to exampleExportedFn');
	console.log('exiting exampleExportedFn');
}

function hello(msg) {
	console.log('hello ' + msg);
}

export { exampleExportedFn, hello };
