/// <reference path="../../typings/globals/lodash/index.d.ts" />
/// <reference path="../../typings/globals/node/index.d.ts" />
/// <reference path="./testmodules/sideEffectsTestModuleSideEffects.d.ts"/>

import * as _ from 'lodash';

console.log('----------------------------------------------------------------------------------');
//#########################################
//#          EXPORT DECLARATIONS          #
//#########################################
console.log('***************** EXPORT DECLARATIONS *****************');
console.log(" ----- See ./testmodules/test-module-1.ts -----");

console.log('----------------------------------------------------------------------------------');

console.log('----------------------------------------------------------------------------------');


//#############################
//#          IMPORTS          #
//#############################
console.log('##################################***************** IMPORTS *****************##################################');

console.log(" ----- Import a re-export from another package -----");
import {Package} from './testmodules/test-module-1';

console.log('\n(back in original file): view imported re-export:');
console.log(Package.toString());

console.log(" ----- Import item exported with a specific name -----");
import { MyCup } from './testmodules/test-module-1';

console.log(" ----- Import item & immediately rename it locally -----");
console.log(" ----- (note that this allows multiple import of same item) -----");
import { MyCup as AnotherCup } from './testmodules/test-module-1';

console.log(" ----- Import all exports from a module into a single variable -----");
import * as SetOfExports from './testmodules/test-module-1';

console.log(" ----- Access arbitrary item from import of all items in module into 1 variable -----");
console.log('numberRegexp from testmodules/test-module-1:', SetOfExports.numberRegexp);

console.log(" ----- Import for side effects -----");
import * as testModuleSideEffects from "testModuleSideEffects";
import './testmodules/test-module-sideeffects';

console.log(" ----- View side effects produced -----");
console.log(testModuleSideEffects.hello);
console.log(testModuleSideEffects.uhoh);
console.log(testModuleSideEffects.erm);

console.log(" ----- Note: importing type declarations for 'side effects' produced by -----");
console.log(" ----- testModuleSideEffects obj prevented Typescript compiler errs above -----");

// both of below work, but TS complains
// console.log('Val of process obj was changed by import, key "sideEffect" added: ', process.sideEffect);
// console.log('Val of console obj was changed by import, key "uhoh" added: ', console.uhoh);
console.log(" -- don't do this, it pisses typescript off");


console.log('----------------------------------------------------------------------------------');
//#####################################
//#          DEFAULT EXPORTS          #
//#####################################
console.log('***************** DEFAULT EXPORTS *****************');
console.log(" ----- See ./testmodules/test-module-default-exports -----");

import SomeOutput from './testmodules/test-module-default-exports';

console.log(" ----- Can name import from default export whatever your want -----");
import GotFromSomeOutput from './testmodules/test-module-default-exports';

console.log(SomeOutput);


console.log('----------------------------------------------------------------------------------');
//#####################################################
//#          EXPORT = and IMPORT = require()          #
//#####################################################
console.log('***************** EXPORT = and IMPORT = require() *****************');

console.log(" ----- To see export =, go to testmodules/test-export-equals -----");

console.log(" ----- import from export = -----");
import theExport = require('./testmodules/test-export-equals');
console.log('theExport, imported for something that exported w "export =" syntax::  ', theExport);


console.log('----------------------------------------------------------------------------------');
//#################################################
//#          CODE GENERATION FOR MODULES          #
//#################################################
console.log('***************** CODE GENERATION FOR MODULES *****************');
console.log(" ----- We don't need to worry about this. It takes care of it based on our config -----");


console.log('----------------------------------------------------------------------------------');
//#############################################
//#          OPTIONAL MODULE LOADING          #
//#############################################
console.log('***************** OPTIONAL MODULE LOADING *****************');
console.log(" ----- In some cases we only want to load a module in certain conditions -----");

console.log(" ----- Use the following pattern to do this, to prevent wasteful loading: -----");
declare function require(moduleName: string): any;

import { benWaBead as bead } from './testmodules/test-dynamic-module-importing';

let conditionToLoad = true;

if (conditionToLoad) {
  let benWaBead: typeof bead = require('./testmodules/test-dynamic-module-importing');
  console.log(benWaBead); // no log here or in test-dynamic-module-importing, if conditionToLoad falsy
}


console.log('----------------------------------------------------------------------------------');
//########################################################
//#          WORKING WITH EXISTING JS LIBRARIES          #
//########################################################
console.log('***************** WORKING WITH EXISTING JS LIBRARIES *****************');
console.log(" ----- To load and use untyped standard JS modules:: ------");
console.log(" ----- 1) Declare ambient modules in a .d.ts file w top-level export declarations -----");
console.log(" ----- 2) import the file using /// <reference path='./place/to/go/for/refs.d.ts' /> -----");
console.log(" ----- 3) load modules in with import * as NameOfModule from 'name_of_module' -----");

// Below works, but it's a mess, and I eliminated
//
// import * as path from "path";
// import url = require("url");

// console.log(path);
// console.log(url);


console.log('----------------------------------------------------------------------------------');
//#############################################################################
//#          USE "NAMESPACE IMPORT PATTERN" IF IMPORTING MANY THINGS          #
//#############################################################################
console.log('***************** USE "NAMESPACE IMPORT PATTERN" IF IMPORTING MANY THINGS *****************');
import * as testModuleBundle from "./testmodules/test-module-1";

let doggie = new testModuleBundle.Someone(12345323, 'meeka', 'bobeeka');
console.log('doggie (new Someone class from mega-import w "Namespace import pattern"):', doggie);


console.log('----------------------------------------------------------------------------------');
//##################################
//#          EXPORT RULES          #
//##################################
console.log('***************** EXPORT RULES *****************');
console.log(" ----- 1) Use export default if only exporting 1 class or fn from a file -----");
console.log(" ----- 2) Don't nest namespaces in modules -----");
console.log(" ----- 3) If you’re exporting multiple objects, put them all at top-level -----");
console.log(" ----- 4) Explicitly list exported names when importing...e.g. ");

import { myNewFn, ZipCodeValidator } from "./testmodules/test-module-1";
let zipCodeValidator = new ZipCodeValidator();
let someFn = myNewFn();

console.log('----------------------------------------------------------------------------------');
//#########################################
//#          RE-EXPORT TO EXTEND          #
//#########################################
console.log('***************** RE-EXPORT TO EXTEND *****************');




console.log('#################----------------------------------------------------------------------------------#################');
//################################
//#          NAMESPACES          #
//################################
console.log('***************** NAMESPACES *****************');
console.log(' ----- Basically a way to group types & vars together & separate them from -----');
console.log(' ----- unrelated types & vars in other parts of an app. Same as other langs. -----');
console.log(' ----- Namespaces are simple named JS objects in the global namespace. -----');

// console.log(' ----- Like namespaces, modules contain code & declarations -----');
// console.log(" ----- Unlike namespaces, modules 'declare' their dependencies -----");
// console.log(" ----- Don't refer to module files with <reference ... /> syntax -----");
// console.log(' ----- Any file containing a top-level import or export is considered a module -----');

// modules are executed in their own scope, not the global scope, so anything declared in a module
// is inaccessible from outside unless explicitly exported.
// Anything can be exported: vars, functions, classes, type alises, interfaces

console.log(' ----- Create a namespace with several exports -----');
namespace Geometry {

  export interface Point {
    x: number;
    y: number;
  }

  interface Pythagorean {

  }

  export function hypotenuse(a: number | Point, b: number | Point): number | Error {
    if (typeof a !== typeof b) {
      return new Error('type a and type b');
    }
    console.log('hypotenuse:: type of a: ', typeof a);
    console.log('hypotenuse:: type of b: ', typeof b);
    return 3;
    // return Math.abs(a^2) + Math.abs(b);
  }
}


// console.log('----------------------------------------------------------------------------------');
// //##########################################
// //#          IMPORT A DECLARATION          #
// //##########################################
// console.log('***************** IMPORT A DECLARATION *****************');

// console.log(' ----- Import a single value from a module -----');
// import { testExportString } from './testmodules/test-module-1';

// console.log(' ----- Import a single value from a module, but assign it a different name -----');
// import { testExportFunction as testOutFn } from './testmodules/test-module-1';

// testOutFn('hey!');


// console.log('----------------------------------------------------------------------------------');
// //##########################################
// //#          AMBIENT DECLARATIONS          #
// //##########################################
// console.log('***************** AMBIENT DECLARATIONS *****************');
// console.log(' -- Compiler must know what modules & vars come from outside TS. Concept of ambient');
// console.log('    declaration allows this. Ambient declarations are special declarations that');
// console.log("    provide type info abt APIs existing “ambiently” in the app's execution env.");
// console.log(" -- created by prefixing normal declarations with the 'declare' keyword.");

// console.log(" -- Rarely req for popular libs: they're usually available via tsd thru the");
// console.log('    DefinitelyTyped project, & are grabbable via tsd install somelib --save');

// console.log(' ----- REFERENCE TYPE -----');
// console.log(' -- Reference types (/// comments) provide access to ambient declarations.');
// console.log(`      E.g.: /// <reference path="../../typings/lodash/lodash.d.ts" /> on 1st line`);
// console.log(' -- However, libs this covers must still be explicitly imported, to use them. e.g.:');
// console.log((_ && _.startsWith) ? 'lodash successfully imported!' : 'Unable to import lodash :(');


// console.log('----------------------------------------------------------------------------------');
// //############################################
// //#          DYNAMIC MODULE LOADING          #
// //############################################
// console.log('***************** DYNAMIC MODULE LOADING *****************');
