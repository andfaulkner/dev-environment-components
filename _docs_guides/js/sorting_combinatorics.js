var _ = require('lodash');
var R = require('ramda');

//
// Array.sort()
//

console.log('----------------------------------------------------------------------------------');
//###################################
//#          BASIC SORTING          #
//###################################
console.log('***************** BASIC SORTING *****************');

console.log(" ----- DEFINE AN ARRAY TO SORT -----");
var colors = ['red', 'orange', 'yellow', 'green', 'blue'];
console.log(colors)

console.log(" ----- PERFORM A BASIC ALPHANUMERIC SORT -----");
console.log(colors.sort())

console.log(" ----- PERFORM BASIC ALPHANUMERIC SORT ON NUBMERS, NOTICE IT FAILS -----");
var numbers = [14, 2, 64, 21, 12, 1, 9, 3, 8];
console.log(numbers.sort());

console.log(" ----- METHOD OF SORTING NUMBERS THAT WORKS -----");

// Abstraction for numeric sorting
var numericSorter = function numericSorter(a, b) {
	return a - b;
};
// appears to just do piles of comparisons between items
// ...but not EVERY comparison. Like 1/2. This doesn't scale.
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort
console.log(numbers.sort(numericSorter));

// how sort works: 
//   if sorter fn passed in returns 1 or more, a considered greater than b
//   if it returns 0, a is considered equal to b
//   if it returns -1 or less, b is considered greater than a.

var incomplete = R.filter(R.whereEq({complete: false}));

var colors = ['red', 'orange', 'yellow', 'green'];

console.log('----------------------------------------------------------------------------------');
//###################################################
//#          COMBINATIONS WITH npm MODULES          #
//###################################################
console.log('***************** COMBINATIONS WITH npm MODULES *****************');
var combo = require('combinations');
console.log(" ----- combinations MODULE DOES ALL COMBOS OF ALL LENGTHS, NO DUPES -----");
console.log(combo(colors));
// => [ [ 'red' ],
//			[ 'orange' ],
//			[ 'yellow' ],
//			[ 'green' ],
//			[ 'red', 'orange' ],
//			[ 'red', 'yellow' ],
//			[ 'red', 'green' ],
//			[ 'orange', 'yellow' ],
//			[ 'orange', 'green' ],
//			[ 'yellow', 'green' ],
//			[ 'red', 'orange', 'yellow' ],
//			[ 'red', 'orange', 'green' ],
//			[ 'red', 'yellow', 'green' ],
//			[ 'orange', 'yellow', 'green' ],
//			[ 'red', 'orange', 'yellow', 'green' ] ]
console.log(" ----- combinations MODULE ALSO ALLOWS SPECIFYING MINIMUM COMBO TO OUTPUT -----");
console.log(combo(colors, 2));
// => [ [ 'red', 'orange' ],
//			[ 'red', 'yellow' ],
//			[ 'red', 'green' ],
//			[ 'orange', 'yellow' ],
//			[ 'orange', 'green' ],
//			[ 'yellow', 'green' ],
//			[ 'red', 'orange', 'yellow' ],
//			[ 'red', 'orange', 'green' ],
//			[ 'red', 'yellow', 'green' ],
//			[ 'orange', 'yellow', 'green' ],
//			[ 'red', 'orange', 'yellow', 'green' ] ]

console.log('----------------------------------------------------------------------------------');
//###################################################
//#          RAMDA SORTING & COMBINATORICS          #
//###################################################
console.log('***************** RAMDA SORTING & COMBINATORICS *****************');

console.log(" ----- RAMDA APERTURE: get all combinations of the given length of an array -----");
colors2 = colors.sort();
console.log(R.aperture(5, colors2).sort()
	.concat(R.aperture(4, colors2).sort())
	.concat(R.aperture(3, colors2).sort())
	.concat(R.aperture(2, colors2).sort())
	.concat(R.aperture(1, colors2).sort()).reverse())
