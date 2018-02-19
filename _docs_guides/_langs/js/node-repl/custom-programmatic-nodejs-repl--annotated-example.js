/**************************************************************************************************
*
*    Open a NodeJS REPL at any point in any running app's control flow.
*
*    Manually provide it with any environment and/or local variables
*    you wish to examine and tinker with at the 'pause' point
*/

// NodeJS core module for creation and handling of a Node REPL environment.
const repl = require('repl');

// Latest Node LTS (v6.9.3 [as of 2017/01]) API docs for repl module:
//     https://nodejs.org/dist/latest-v6.x/docs/api/repl.html#repl_design_and_features

// These variables will not automatically be available in a repl instance launched
// in the script, even following this point. Only variables attached to the repl context
// are available
const msg = 'my message here';
const funFunc = (name) => console.log(`Hello ${name}`);

// 
// Launch the repl. The control flow continues after this point - the repl starts running
// as soon as this point is reached, but the script concurrently continues executing.
// 
// 1st arg passed to start define the "prompt" string (akin to the Unix shell's $)
// 
const replProcess = repl.start('> ')

// Note: repl.start creates an instance of repl.REPLServer.

// Add variables to REPL environment. They can then be called normally.
Object.assign(replProcess.context, {
    funFunc,
    myMessage: 'my globally accessible message',
    gtfo: () => process.exit(),
});

// After this point, typing each of the following into the repl has the following effects:
//   > myMessage
//   'my globally accessible message'
//   > funFunc
//   [Function: funFunc]
//   > funFunc()
//   'Hello undefined'
//   > funFunc('meeka')
//   'Hello meeka'
//   > msg
//   ReferenceError: msg is not defined
//        // Note: fails because msg wasn't explicitly attached to replProcess.context
//   > gtfo
//   $  <<== process exited, now we're back in the regular shell

//
// Event runs when the user exits the REPL using CTRL-C, CTRL-D, or .exit.
// Does not run when the REPL is exitted via process.exit() or a function that calls it.
//
replProcess.on('exit', () => {
    console.log('Received "exit" event from repl!');
    console.log(`Goodbye`);
    process.exit();
});


/*********************************** DEFINING NEW REPL COMMANDS ***********************************/
//
// Define a new standalone "dot-prefixed" repl command, akin to the built-in .exit or .help
// Can be run in the repl both on their own (.greet) or with arguments (.greet meeka)
// 
replProcess.defineCommand('greet', {

  // help output for the command. Appears in .help menu as:
  //    .greet   Say hello
  help: 'Say hello',

  // function to run when the command is triggered
  action: function(name) {
    this.lineParser.reset();
    this.bufferedCommand = '';
    console.log(`Hello, ${name}!`);
    // The prompt string ("> ") won't reappear before each line without this.displayPrompt()
    this.displayPrompt();
  }
});

// defineCommand using function rather than {help: string, action: function}
// 
// The command .yodawg defined below creates a repl inside the repl. However, the
// parent repl still receives all input that goes to the child repl. Thus, all input
// chars display twice (e.g. .exit displays as ..eexxiitt), and all commands are run
// in both the parent and child repl (the displayed ..eexxiitt actually runs .exit in
// both parent and child).
//
// For this to have any value, something must be done to block input to the parent
// repl while the child repl is running, then restore input to the parent repl when
// the child repl is stopped. Interesting, but not that useful anyway.
replProcess.defineCommand('yodawg', function() {
    const replProcessNested = repl.start('[yodawg]> ');
    const self = this;
    Object.assign(replProcessNested.context, { self });
});
