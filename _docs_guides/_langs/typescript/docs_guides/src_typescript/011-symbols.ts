/// <reference path="../../typings/lodash/lodash.d.ts" />

import * as _ from 'lodash';

console.log('----------------------------------------------------------------------------------');
//#############################
//#          SYMBOLS          #
//#############################
console.log('***************** SYMBOLS *****************');

// #Basic info
// *  immutable and unique
// *  usable as keys for object props

console.log(' ----- Symbols are created with the Symbol() constructor -----');
let sym1 = Symbol();

console.log(' ----- Can assign str key to symbols to aid debugging (id symbol in stack etc) -----');
let sym2 = Symbol('sym2');

console.log(' ----- Symbols are immutable and unique -----');
let sym3 = Symbol('key');
let sym4 = Symbol('key');

console.log('Since all symbols are unique, comparing equality of 2 symbols always returns false');
console.log('sym3 === sym4: ', sym3 === sym4);

console.log(' ----- Symbols are usable as keys for object properties -----');
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
console.log(' ----- Built-in symbols are used to represent internal language behaviours -----');

console.log(" ----- Symbol.hasInstance lets you override default behaviour of instanceof keyword for obj it's defined on -----");
// TODO figure this out

console.log(' ----- IGNORE: Symbol.unscopables,  -----');

console.log('----------------------------------------------------------------------------------');
//##################################
//#          FOR-OF LOOPS          #
//##################################
console.log('***************** FOR-OF LOOPS *****************');

console.log(" ----- for-of loops: basically for-in loops that don't walk inheritance chain -----");
console.log(' ----- Can only loop over iterable objs: arr, str, set, etc; but NOT basic objs -----');

console.log(' ----- example: for-of loop that reverses an array -----');
let someArr = [];
for (const value of [1, 2, 3, 4, 5]) {
  someArr.unshift(value);
}
console.log(someArr); // => [5, 4, 3, 2, 1]

console.log(' ----- e.g. for-of loop over each char in a string -----');

for (const char of 'bzz') {
  console.log(char);
}
// => b   {{{linebreak_here}}}   z   {{{linebreak_here}}}   z

console.log(' ----- break & continue work in for-of loops. -----');

console.log(" ----- e.g. 'continue' preventing output of strs longer than 1 from an arr of strs -----");
for (const val of ['a', 'b', 'c', 'dee', 'e', 'f']) {
  if (val.length > 1) { // prevents output of multiletter values
    continue;
  }
  console.log(val);
}

console.log(" ----- e.g. 'break' stopping for-of loop thru str if non-alphanumeric char hit-----");
for (const val of 'Jack Meoff') {
  if (!val.match(/[a-zA-Z0-9]/gi)) { // prevents output of multiletter values
    break;
  }
  console.log(val);
}
// => J   {{{linebreak_here}}}   a   {{{linebreak_here}}}   c   {{{linebreak_here}}}   k



console.log(' ----- e.g. for-of loop through obj by looping over its keys -----');
let juiceColors = {
  orange: 'orange',
  grapefruit: 'red',
  apple: 'yellow',
  grape: 'purple'
};

for (const key of Object.keys(juiceColors)) {
  console.log('juice type: ', key, '; color: ', juiceColors[key]);
}
// => juice type:  orange ; color:  orange
// => juice type:  grapefruit ; color:  red
// => juice type:  apple ; color:  yellow
// => juice type:  grape ; color:  purple


console.log(' ----- e.g. iterate with an existing letiable -----');


console.log('----------------------------------------------------------------------------------');
//###################################################
//#          DESTRUCTURING IN for-of LOOPS          #
//###################################################
console.log('***************** DESTRUCTURING IN for-of LOOPS *****************');
const mealOptions = [
  { entree: 'steak', sideOne: 'potatoes', sideTwo: 'salad' },
  { entree: 'fish', sideOne: 'chips', sideTwo: 'coleslaw' },
  { entree: 'burder', sideOne: 'fries', sideTwo: 'onion rings' },
];

console.log(' ----- e.g. grab given props out of each obj in arr of objs, directly in the args -----');
for (const { entree, sideOne, sideTwo } of mealOptions) {
  console.log(_.padEnd('Entree: ' + entree, 15),
              _.padEnd('first side dish: ' + sideOne, 26),
              'second side dish: ' + sideTwo);
}

console.log(' ----- e.g. make current arr index available in for-of loop thru arr (destructure arr.entries output) -----');

let nighttimeRoutine = [
  'find box, charger, waterbowl', 'go upstairs w/ Meeka', 'brush teeth', 'make bed & get into it'
];

for (const [stepNumber, step] of nighttimeRoutine.entries()) {
  console.log('step ' + (stepNumber + 1) + ': ' + step);
}
// => step 1: find box, charger, waterbowl
// => step 2: go upstairs w/ Meeka
// => step 3: brush teeth
// => step 4: make bed & get into it

console.log(' ----- e.g. put current val from for-of in an arr at a given pos, rather than in a const -----');
const arr = [];
for (arr[0] of ['a', 'b']) {
    console.log(arr[0]);
}


console.log('----------------------------------------------------------------------------------');
//#####################################################
//#          BUILT-IN SYMBOL Symbol.iterator          #
//#####################################################
console.log('***************** BUILT-IN SYMBOL Symbol.iterator *****************');

// TODO build-in symbol Symbol.iterator

// var arrLikeObj = {
//   0: 'a',
//   1: 'b',
//   2: 'c',
//   3: 'd',

// };
// console.log(arrLikeObj);

// var arrFromArrLike = Array.from(arrLikeObj);
// console.log(arrFromArrLike);




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
