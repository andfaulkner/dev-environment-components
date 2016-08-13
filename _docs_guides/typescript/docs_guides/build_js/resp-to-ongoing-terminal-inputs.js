// var stdin = process.openStdin();
// stdin.addListener("data", function(d) {
//     // note:  d is an object, and when converted to a string it will
//     // end with a linefeed.  so we (rather crudely) account for that
//     // with toString() and then trim()
//     console.log("you entered: [" +
//         d.toString().trim() + "]");
// });
// var stdin = process.openStdin();
// require('tty').setRawMode(true);
// stdin.on('keypress', function (chunk, key) {
//   process.stdout.write('Get Chunk: ' + chunk + '\n');
//   if (key && key.ctrl && key.name == 'c') process.exit();
// });
var keypress = require('keypress');
// make `process.stdin` begin emitting "keypress" events
keypress(process.stdin);
// listen for the "keypress" event
process.stdin.on('keypress', function (ch, key) {
    console.log('got "keypress"', key);
    if (key && key.ctrl && key.name == 'c') {
        process.stdin.pause();
    }
});
process.stdin.setRawMode(true);
process.stdin.resume();
