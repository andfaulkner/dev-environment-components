/// <reference path="../../typings/lodash/lodash.d.ts" />
"use strict";
console.log('----------------------------------------------------------------------------------');
//################################
//#          NAMESPACES          #
//################################
console.log('***************** NAMESPACES *****************');
console.log(' ----- Basically a way to group types & vars together & separate them from -----');
console.log(' ----- unrelated types & vars in other parts of an app. Same as other langs. -----');
console.log(' ----- Namespaces are simple named JS objects in the global namespace. -----');
console.log('----------------------------------------------------------------------------------');
//#############################
//#          MODULES          #
//#############################
console.log('***************** MODULES *****************');
console.log(' ----- Like namespaces, modules contain code & declarations -----');
console.log(" ----- Unlike namespaces, modules 'declare' their dependencies -----");
console.log(" ----- Don't refer to module files with <reference ... /> syntax -----");
console.log(' ----- Any file containing a top-level import or export is considered a module -----');
// modules are executed in their own scope, not the global scope, so anything declared in a module
// is inaccessible from outside unless explicitly exported.
// Anything can be exported: vars, functions, classes, type alises, interfaces

console.log('----------------------------------------------------------------------------------');
//#########################################
//#          EXPORT DECLARATIONS          #
//#########################################
console.log('***************** EXPORT DECLARATIONS *****************');
console.log(" ----- See ./testmodules/test-module-1.ts -----");


console.log('----------------------------------------------------------------------------------');
//#############################
//#          IMPORTS          #
//#############################
console.log('***************** IMPORTS *****************');
import {Parcel} from './testmodules/test-module-1.ts';

console.log(Parcel);

// var Geometry;
// (function (Geometry) {
//     function hypotenuse(a, b) {
//         if (typeof a !== typeof b) {
//             return new Error('type a and type b');
//         }
//         console.log('hypotenuse:: type of a: ', typeof a);
//         console.log('hypotenuse:: type of b: ', typeof b);
//         return 3;
//         // return Math.abs(a^2) + Math.abs(b);
//     }
//     Geometry.hypotenuse = hypotenuse;
//     // TODO complete this after doing interfaces, we're missing details
//     // function GetFirstName(name: string): string;
//     // function GetFirstName(id: number): string;
//     // function GetFirstName(stringOrId: string | number): string {
//     //   return 'bleh';
//     // }
//     // function olTest(name: string): string;
//     // function olTest(id: number): boolean;
//     // function olTest
//     // function rTriangleHypotenuseLen(edgePoint1: Point, cornerPoint: Point, edgePoint2: Point): number;
//     // function rTriangleHypotenuseLen(rAngleLine1Len: number, lAngleLine2Len: number): number;
//     // function rTriangleHypotenuseLen(rAngleLine1Len: number, lAngleLine2Len: number): number {
//     //   return Math.sqrt(Math.abs(rAngleLine1Len^2) + Math.abs(lAngleLine2Len));
//     // }
//     // function rTriangleHypotenuseLen(edgePoint1: Point, cornerPoint: Point, edgePoint2: Point): number {
//     //   return Math.sqrt(Math.abs(rAngleLine1Len^2) + Math.abs(lAngleLine2Len));
//     // }
//     // const rightTriangleHypotenuse = (a: number | b: number | Point) =>
//     class Square {
//         constructor(sideLength = 0) {
//             this.sideLength = sideLength;
//             this.area = () => Math.pow(this.sideLength, 2);
//         }
//     }
//     Geometry.Square = Square;
// })(Geometry || (Geometry = {}));
// console.log(Geometry.hypotenuse(3, 4));
// let pt1 = { x: 3, y: 2 };
// console.log(Geometry.hypotenuse(pt1, { x: 6, y: 9 }));
// // console.log(Geometry.hypotenuse({x: 4, y: 2}: Point, {x: 4, y: 2}: Point));
// let mySquare = new Geometry.Square(4);
// console.log(mySquare); // => Square { sideLength: 4, area: [Function] }
// // console.log(mySquare.area()); // => 16
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// TODO MUST MUST MUST FIX MODULES SECTION (after finishing with interfaces)
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
console.log('----------------------------------------------------------------------------------');
//##########################################
//#          IMPORT A DECLARATION          #
//##########################################
console.log('***************** IMPORT A DECLARATION *****************');
console.log(' ----- Import a single value from a module -----');
console.log(' ----- Import a single value from a module, but assign it a different name -----');
const test_module_1_1 = require('./testmodules/test-module-1');
test_module_1_1.testExportFunction('hey!');
console.log('----------------------------------------------------------------------------------');
//##########################################
//#          AMBIENT DECLARATIONS          #
//##########################################
console.log('***************** AMBIENT DECLARATIONS *****************');
console.log(' -- Compiler must know what modules & vars come from outside TS. Concept of ambient');
console.log('    declaration allows this. Ambient declarations are special declarations that');
console.log("    provide type info abt APIs existing “ambiently” in the app's execution env.");
console.log(" -- created by prefixing normal declarations with the 'declare' keyword.");
console.log(" -- Rarely req for popular libs: they're usually available via tsd thru the");
console.log('    DefinitelyTyped project, & are grabbable via tsd install somelib --save');
console.log(' ----- REFERENCE TYPE -----');
console.log(' -- Reference types (/// comments) provide access to ambient declarations.');
console.log(`      E.g.: /// <reference path="../../typings/lodash/lodash.d.ts" /> on 1st line`);
console.log(' -- However, libs this covers must still be explicitly imported, to use them. e.g.:');
const _ = require('lodash');
console.log((_ && _.startsWith) ? 'lodash successfully imported!' : 'Unable to import lodash :(');
console.log('----------------------------------------------------------------------------------');
//############################################
//#          DYNAMIC MODULE LOADING          #
//############################################
console.log('***************** DYNAMIC MODULE LOADING *****************');
//# sourceMappingURL=008-namespaces_modules.js.map