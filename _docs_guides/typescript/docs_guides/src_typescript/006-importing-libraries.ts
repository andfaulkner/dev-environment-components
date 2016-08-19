//
// Importing is a painful in Typescript
//

// SOLUTION 1: reference path.
//   1) Install the library normally with npm e.g.
//             npm install lodash --save
//   2) Install type declarations into project via the terminal: e.g.:
//             tsd install lodash --save
//   3) Include a declaration like this in the typescript file you are using the library in: e.g.:
//#//          ///<reference path="../../typings/lodash/lodash.d.ts" />
//   4) Import the library normally (ES6 module syntax): e.g.:
//             import * as _ from "lodash";
//
// SOLUTION 2: import lib normally in src typescript file, & manually copy lib to same dir as src.
//             Code in the source file:
//             import * as _ from 'lodash';
//   A HORRIBLE SOLUTION. DON'T DO THIS.
//

/// <reference path="../../typings/lodash/lodash.d.ts" />

import * as _ from 'lodash';

console.log('----------------------------------------------------------------------------------');
//#####################################################
//#          IMPORTING THIRD-PARTY LIBRARIES          #
//#####################################################
console.log('***************** IMPORTING THIRD-PARTY LIBRARIES *****************');

console.log(' ----- Lodash successfully imported - note that _.pad is working: -----');
console.log(_.pad('test', 20, '_'));
