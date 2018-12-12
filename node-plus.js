"use strict";
exports.__esModule = true;
var repl = require("repl");
repl.start({
    prompt: "Node.js via stdin> ",
    input: process.stdin,
    output: process.stdout
});
