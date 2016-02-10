// imports are used to import functions, objects or primitives that have been exported 
// from an external module, another script, etc.

// import a module for side effects only
import './export_side_effects.js'

console.log('msg: successful import maybe')
// hiImASideEffect();

// import all exported functions in module to variable mathOps
import * as mathOps from './export-on-fn-def';
// => { addTwoNums: [Function: addTwoNums], multiplyTwoNums: [Function: multiplyTwoNums] }

// import specific named exports (members of the module) from module
import { exampleExportedFn, hello } from './export_fns_in_export_block';

// import default function from module, placing the function in var myDefault
import myDefault from "./export_default_fn";

console.log('import myDefault from "export_default_fn": myDefault result');
console.log(myDefault()); //=> runs the unnamed default function defined within module

console.log(mathOps);
// => { addTwoNums: [Function: addTwoNums], multiplyTwoNums: [Function: multiplyTwoNums] }

exampleExportedFn('This msg is being given to exampleExportedFn');

console.log(mathOps.addTwoNums(1, 8)); // addTwoNums was in export-on-fn-def module