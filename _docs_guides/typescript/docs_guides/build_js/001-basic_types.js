/// <reference path="../../typings/lodash/lodash.d.ts" />
"use strict";
let data = [
    { title: 'Boolean: ', item: 'asdf' }
];
let i = 1;
console.log('----------------------------------------------------------------------------------');
//##################################
//#          "PRIMITIVES"          #
//##################################
console.log('***************** "PRIMITIVES" *****************');
let bool1 = false;
console.log('boolean: ', bool1);
let decimal = 6;
console.log('decimal number: ', decimal);
let hex = 0xf00d;
console.log('hexadecimal number: ', hex);
let str = 'HELLO!';
console.log('string: ', str);
let templateStr = `
  string from template, with earlier string embedded: ${str}
  This can be multiline in the code!`;
console.log('string from a template: ', templateStr);
let num_arr = [1, 2, 3, 4];
console.log('number array: ', num_arr);
let num_arr_generic = [1, 2, 3, 4, 5];
console.log('number array from a generic: ', num_arr_generic);
console.log(' ----- TUPLES ----- ');
let string_number_tuple = ['Secret to life, the universe, & everything: ', 42];
console.log('tuple first value: ', string_number_tuple[0]);
console.log('tuple second value: ', string_number_tuple[1]);
console.log('----------------------------------------------------------------------------------');
//###########################
//#          ENUMS          #
//###########################
console.log('***************** ENUMS *****************');
// enums number members starting at 1
var Color;
(function (Color) {
    Color[Color["Red"] = 0] = "Red";
    Color[Color["Green"] = 1] = "Green";
    Color[Color["Blue"] = 2] = "Blue";
})(Color || (Color = {}));
;
let c = Color.Green;
console.log('ENUM: ', Color);
console.log('ENUM value: ', c);
// enums can have arbitrary numbers assigned to them (but not e.g. strings, etc.)
var Shape;
(function (Shape) {
    Shape[Shape["Circle"] = 1] = "Circle";
    Shape[Shape["Triangle"] = 3] = "Triangle";
    Shape[Shape["Square"] = 4] = "Square";
    Shape[Shape["Rectangle"] = 4] = "Rectangle";
})(Shape || (Shape = {}));
;
let square1 = Shape.Square;
let rectangle1 = Shape.Rectangle;
console.log('Shape: ', Shape);
console.log('square one: ', square1);
console.log('rectangle one: ', rectangle1);
//
// ANY
//
let notSureWhatType = 6;
console.log('Var of type any: ', notSureWhatType);
notSureWhatType = 'hello!';
console.log('Same var of type any w/ value of diff type assigned: ', notSureWhatType);
//
// VOID
//
let useless = undefined;
console.log('Useless var: it is type void, so it can only be undefined or null: ', useless);
//
// RETURN TYPES
//
console.log(" ----- function with return type of void -----");
function outputWarning() {
    console.log('oh no!!! I have a return type of void!!!!!!!!!!');
}
outputWarning();
//
// TYPE ASSERTIONS
//
console.log('----------------------------------------------------------------------------------');
//#####################################
//#          TYPE ASSERTIONS          #
//#####################################
console.log('***************** TYPE ASSERTIONS *****************');
// A way to tell the compiler that you know what a return value will be
let someValue = "this is a string";
let strLength = someValue.length;
console.log('We know finding string length gives a #, & can assert this. Eg output: ', strLength);
console.log('----------------------------------------------------------------------------------');
//#################################
//#          UNION TYPES          #
//#################################
console.log('***************** UNION TYPES *****************');
console.log(" ----- Union types allow assigned values to be one of several defined types -----");
console.log(" ----- E.g. Union types provide multiple options for what type a val can be. -----");
console.log('E.g. the "greetings" function words both for strings & for arrays of strings.');
function greetings(greetings) {
    console.log(greetings.toString().split(',').join(' ').replace(/\s\s/g, ' '));
}
greetings(['hello', 'aloha', 'yepyep']);
greetings('hello, aloha, yepyep');
function prettyPrint(value) {
    // console.log(Object.keys(value).);
    if (Object.keys(value).indexOf('length')) {
        console.log('has a length');
    }
    console.log('the given value is: ', value.toString().split(',').join('').toString());
}
prettyPrint(false);
