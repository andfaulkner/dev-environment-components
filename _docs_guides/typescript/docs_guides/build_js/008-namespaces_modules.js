/// <reference path="../../typings/lodash/lodash.d.ts" />
"use strict";
console.log('----------------------------------------------------------------------------------');
//################################
//#          NAMESPACES          #
//################################
console.log('***************** NAMESPACES *****************');
console.log(" ----- Basically a way to group types & vars together & separate them from -----");
console.log(" ----- unrelated types & vars in other parts of an app. Same as other langs. -----");
console.log(" ----- Namespaces are simple named JS objects in the global namespace. -----");
console.log('----------------------------------------------------------------------------------');
//#############################
//#          MODULES          #
//#############################
console.log('***************** MODULES *****************');
console.log(" ----- Like namespaces, modules contain code & declarations -----");
console.log(" ----- Unlike namespaces, modules 'declare' their dependencies -----");
console.log(" ----- Don't refer to module files with <reference ... /> syntax -----");
// modules are executed in their own scope, not the global scope, so anything declared in a module
// is inaccessible from outside unless explicitly exported.
// Anything can be exported: vars, functions, classes, type alises, interfaces
console.log('----------------------------------------------------------------------------------');
//##########################################
//#          IMPORT A DECLARATION          #
//##########################################
console.log('***************** IMPORT A DECLARATION *****************');
console.log(" ----- Import a single value from a module -----");
console.log(" ----- Import a single value from a module, but assign it a different name -----");
var test_module_1_1 = require('./testmodules/test-module-1');
test_module_1_1.testExportFunction('hey!');
console.log('----------------------------------------------------------------------------------');
//##########################################
//#          AMBIENT DECLARATIONS          #
//##########################################
console.log('***************** AMBIENT DECLARATIONS *****************');
console.log(" -- Compiler must know what modules & vars come from outside TS. Concept of ambient");
console.log("    ambient declaration allows this. Ambient declarations are special declarations");
console.log("    that provides type info abt APIs existing “ambiently” in the app's execution env");
console.log(" -- created by prefixing normal declarations with the 'declare' keyword");
console.log(" -- Rarely req for popular libs: they're usually available via tsd thru the");
console.log("    DefinitelyTyped project, & are grabbable via tsd install somelib --save");
console.log(" ----- REFERENCE TYPE -----");
console.log(" -- Reference types (/// comments) provide access to ambient declarations.");
console.log("      E.g.: /// <reference path=\"../../typings/lodash/lodash.d.ts\" /> on 1st line");
console.log(" -- However, libs this covers must still be explicitly imported, to use them. e.g.:");
var _ = require('lodash');
console.log((_ && _.startsWith) ? 'lodash successfully imported!' : "Unable to import lodash :(");
// . E.g.
//##     /// <reference path="../../typings/lodash/lodash.d.ts" />
