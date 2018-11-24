// **************** SUMMARY:: ALL FORMS OF IMPORT ****************
//    // IMPORT ALL
//    import name from "module-name";
//    import "module-name";   // import for side effects
//
//    // NAMED IMPORTS
//    import { member } from "module-name";
//    import { member as alias } from "module-name";
//    import { member1, member2 } from "module-name";
//    import { member1, member2 as alias2, [..] } from "module-name";
//
//    // DEFAULT IMPORTS
//    import aDefaultMember, { member [, [..] ] } from "module-name";
//    import aDefaultMember, * as name from "module-name";  // import specific item, and all others
//    import aDefaultMember from "module-name";
//****************************************************************

// RANDOM NOTE: IMPORTS ARE HOISTED

// **************** SUMMARY:: ALl FORMS OF EXPORT ****************
//    ** NAMED EXPORTS **
//    export { name1, name2, .., nameN };
//    export { var1 as name1, var2 as name2, .., nameN };
//    export let name1, name2, .., nameN;                            // also var
//    export let name1 = someName, name2 = someOtherName, .. nameN;  // also var, const OK

//    ** EXPORT FROM ANOTHER FILE: GREAT FOR ARCHITECTURE **
//    export * from './another/file.js';
//    export { name1, name2, .., nameN } from './another/file.js';
//    export { import1 as name1, import2 as name2, .., nameN } from './another/file.js';

//    ** DEFAULT EXPORTS: SLIGHTLY EVIL **
//    export default expression;
//    export default function (..) { .. }       // also class, function. NO ; HERE!
//    export default function name1(..) { .. }  // also class, function. NO ; HERE!
//    export { name1 as default, .. };

//****************************************************************

// **** EXPORT:: NAMED EXPORTS ****
//      export { myFunction };         // where myFunction is defined earlier
//      export { myFunction, myVar };  // both myFunction & myVar defined earlier


// imports are used to import functions, objects or primitives that have been exported 
// from an external module, another script, etc.

// import a module for side effects only
import './export_side_effects.js';

console.log('msg: successful import maybe');
// hiImASideEffect();

// import all exported functions in module to variable mathOps
import mathOps from './export-on-fn-def';
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

