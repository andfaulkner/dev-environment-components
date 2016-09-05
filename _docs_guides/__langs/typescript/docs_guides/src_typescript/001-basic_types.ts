/// <reference path="../../typings/lodash/lodash.d.ts" />

import * as _ from "lodash";

let data: Array<Object> = [
  { title: 'Boolean: ', item: 'asdf'}
];

let i = 1;

console.log('----------------------------------------------------------------------------------');
//##################################
//#          "PRIMITIVES"          #
//##################################
console.log('***************** "PRIMITIVES" *****************');


let bool1: boolean = false;
console.log('boolean: ', bool1);

let decimal: number = 6;
console.log('decimal number: ', decimal);

let hex: number = 0xf00d;
console.log('hexadecimal number: ', hex);

let str: string = 'HELLO!';
console.log('string: ', str);

let templateStr: string = `
  string from template, with earlier string embedded: ${str}
  This can be multiline in the code!`;
console.log('string from a template: ', templateStr);

let num_arr: number[] = [1, 2, 3, 4];
console.log('number array: ', num_arr);

let num_arr_generic: Array<number> = [1, 2, 3, 4, 5];
console.log('number array from a generic: ', num_arr_generic);

console.log(' ----- TUPLES ----- ');
let string_number_tuple: [string, number] = ['Secret to life, the universe, & everything: ', 42];
console.log('tuple first value: ', string_number_tuple[0]);
console.log('tuple second value: ', string_number_tuple[1]);

console.log('----------------------------------------------------------------------------------');
//###########################
//#          ENUMS          #
//###########################
console.log('***************** ENUMS *****************');

// enums number members starting at 1
enum Color {Red, Green, Blue};
let c: Color = Color.Green;

console.log('ENUM: ', Color);
console.log('ENUM value: ', c);

// enums can have arbitrary numbers assigned to them (but not e.g. strings, etc.)
enum Shape {Circle = 1, Triangle = 3, Square = 4, Rectangle = 4};
let square1: Shape = Shape.Square;
let rectangle1: Shape = Shape.Rectangle;

console.log('Shape: ', Shape);
console.log('square one: ', square1);
console.log('rectangle one: ', rectangle1);

//
// ANY
//

let notSureWhatType: any = 6;
console.log('Var of type any: ', notSureWhatType);
notSureWhatType = 'hello!';
console.log('Same var of type any w/ value of diff type assigned: ', notSureWhatType);

//
// VOID
//

let useless: void = undefined;
console.log('Useless var: it is type void, so it can only be undefined or null: ', useless);

//
// RETURN TYPES
//

console.log(" ----- function with return type of void -----");
function outputWarning(): void {
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

let someValue: any = "this is a string";
let strLength: number = (<string>someValue).length;

console.log('We know finding string length gives a #, & can assert this. Eg output: ', strLength);


console.log('----------------------------------------------------------------------------------');
//#################################
//#          UNION TYPES          #
//#################################
console.log('***************** UNION TYPES *****************');
console.log(" ----- Union types allow assigned values to be one of several defined types -----");
console.log(" ----- E.g. Union types provide multiple options for what type a val can be. -----");

console.log('E.g. the "greetings" function words both for strings & for arrays of strings.');
function greetings(greetings: string | string[]) {
  console.log(greetings.toString().split(',').join(' ').replace(/\s\s/g, ' '));
}

greetings(['hello', 'aloha', 'yepyep']);
greetings('hello, aloha, yepyep');

function prettyPrint(value: string | string[] | number | number[] | boolean) {
  // console.log(Object.keys(value).);
  if (Object.keys(value).indexOf('length')) {
    console.log('has a length');
  }
  console.log('the given value is: ', value.toString().split(',').join('').toString());
}

prettyPrint(false);