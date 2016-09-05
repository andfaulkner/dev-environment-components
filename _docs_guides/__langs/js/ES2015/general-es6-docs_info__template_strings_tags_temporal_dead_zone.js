var _ = require('lodash');

console.log('----------------------------------------------------------------------------------');
//########################################
//#          TEMPORAL DEAD ZONE          #
//########################################
console.log('***************** TEMPORAL DEAD ZONE (TDZ) *****************');

console.log(' -- let/const declarations hoist, but throw errs if accessed before initialized');
console.log(" -- TDZ: consists of everywhere in the code between where the lets/consts get");
console.log("    hoisted to, & where they're actually initialized");

console.log("\n\n<-- Current location in the code is in declaration aloha's TDZ, because 'let aloha =...' hasn't yet been reached\n");

console.log(" ----- Initializing variable aloha with let aloha =... -----");
let aloha = 'aloha to the mainland!';
console.log('value of aloha (declared w/ let aloha): ', aloha);

console.log("\n<-- Current location in the code is not in declaration aloha's TDZ, because let aloha has now been passed\n\n");


console.log('----------------------------------------------------------------------------------');
//#############################################################
//#          TEMPLATE STRINGS & TEMPLATE STRING TAGS          #
//#############################################################
console.log('***************** TEMPLATE STRINGS & TEMPLATE STRING TAGS *****************');
let favoriteFruit = 'pomegranite';

console.log(" ----- Define a basic template string, with string-emitting js used inline -----");
console.log(`Jimson McCluckstenbourg's favorite fruit is: ${favoriteFruit}.`);

console.log(" ----- Create a 'tag' for template str preprocessing -----");
// A 'tag' is a function placed before a template string that preprocesses the template string
// literals & vals of all placeholder (PH) expressions (i.e. the in-string ${someCodeHere} blocks).
// Note that literals & PHs always alternate even if there are 2 template strs back-to-back, in
// which case it treats that location as containing a literal with value ''.
// You can thus interleave literals and placeholders to reconstruct the original string.

let rmLetter_e = (literals, ...placeholders) =>
  _(placeholders)
      .reduce((out, placeholder, i) => out + literals[i] + placeholder, '')
      .concat(_.last(literals))
      .replace(/[eE]/g, '');

console.log(" ----- Create template str w/ rmLetter_e tag applied to it -----");
console.log(rmLetter_e`${0}: My numbers are ${1 + 3}${2 + 8} and ${7 - 2}${5 * 4}. I <3 them.`);


