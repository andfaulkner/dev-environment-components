/// <reference path="../../typings/lodash/lodash.d.ts" />

import * as _ from "lodash";

console.log('----------------------------------------------------------------------------------');
//#############################
//#          SYMBOLS          #
//#############################
console.log('***************** SYMBOLS *****************');

// #Basic info
// *  immutable and unique
// *  usable as keys for object props

console.log(" ----- Symbols are created with the Symbol() constructor -----");
let sym1 = Symbol();

console.log(" ----- Can assign str key to symbols to aid debugging (id symbol in stack etc) -----");
let sym2 = Symbol('sym2');

console.log(" ----- Symbols are immutable and unique -----");
let sym3 = Symbol('key');
let sym4 = Symbol('key');

console.log('Since all symbols are unique, comparing equality of 2 symbols always returns false');
console.log('sym3 === sym4: ', sym3 === sym4);

console.log(" ----- Symbols are usable as keys for object properties -----");
let sym5 = Symbol('sym5');

let obj = {
  [sym5]: 'value'
};

console.log('obj[sym5]:', obj[sym5]);

console.log('----------------------------------------------------------------------------------');
//######################################
//#          BUILT-IN SYMBOLS          #
//######################################
console.log('***************** BUILT-IN SYMBOLS *****************');
console.log(" ----- Built-in symbols are used to represent internal language behaviours -----");

console.log(" ----- Symbol.hasInstance lets you override default behaviour of instanceof keyword for obj it's defined on -----");
// TODO figure this out

console.log(" ----- IGNORE: Symbol.unscopables,  -----");


console.log('----------------------------------------------------------------------------------');
//######################################################################
//#          BUILT-IN SYMBOL Symbol.iterator and for-of LOOPS          #
//######################################################################
console.log('***************** BUILT-IN SYMBOL Symbol.iterator and for-of LOOPS *****************');

console.log(" ----- for-of loops: basically for-in loops that don't walk inheritance chain -----");

console.log(" ----- for-of loop that reverses an array -----");
var someArr = [];
for(let value of [1, 2, 3, 4, 5]) {
  someArr.unshift(value);
}
console.log(someArr); // => [5, 4, 3, 2, 1]



var someString = "Run away, we're under attack by helmet-carrying kneepads!!!!";

var iterator = someString[Symbol.iterator]();

console.log(iterator.next());




// var myIterable = {
//   [Symbol.iterator]() {
//       yield 1;
//       yield 2;
//       yield 3;
//   }
// };

// [...myIterable] // [1, 2, 3]





// var forOfTestObj = {
//   pants: 'jeans',
//   drinkingGlass: 'mug',
//   grain: 'quinuo',
//   tree: 'birch',
//   underseaRavine: 'Marianas Trench',
//   *[Symbol.iterator]() {
//     console.log("in forOfTestObj's Symbol.iterator definition!");
//     var keys = Object.keys(this);
//     var i = 0;
//     return this[]
//   }
// }

// for(let key of forOfTestObj) {
//   console.log(key);
// }




// let Dog = (name: string, age: number, barkNoise: string, breed = 'mutt': string) : Object => {
//   let hasValidArgs = ((age > -1) && (barkNoise.length < 10) && (!_.includes(barkNoise, ' ')));

//   if (hasValidArgs) {
//     return {
//       name: _.capitalize(name),
//       age,
//       barkNoise,
//       breed
//     }
//   }
//   return { error: new Error('invalid args provided to Dog constructor, could not create new dog') };
//  };



// const Dog = {
//   name: 'Meeka',
//   animal: 'dog',
//   age: 5,
//   [Symbol.hasInstance](value: any) {
//     console.log('in instanceof override');
//     return true;
//     // let matchableNames = ['rottweiler', 'dog', 'mammal', 'animal', 'organism'];
//     // return _.includes(matchableNames, _.lowerFirst(value));
//   }
// }

// class Animal {}



// console.log('Animal instanceof meeka?: ', Object instanceof Dog);

