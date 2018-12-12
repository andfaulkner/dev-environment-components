import repl from 'repl';

repl.start({
  prompt: `Node.js via stdin> `,
  input: process.stdin,
  output: process.stdout
});
