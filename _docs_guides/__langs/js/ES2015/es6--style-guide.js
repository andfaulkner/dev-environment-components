/* eslint-disable no-unused-vars */

// 1.  Use const for all references. (note: const is block-scoped)

    const a = 1; 

// 2.  If reassignment is required, use let, not var (let is block-scoped):

    let b = 2;
    b += 1;     // minimize the amount you do this

// 3.  Never use new Object(). Instead use literals:

    const item = {};

// 4.  Use computed property values everywhere you can:

    const keyToTheCity = (k) => `key named ${k}`;
    const obj = {
      id: 5,
      city: 'poop city',
      [keyToTheCity('enabled')]: true // will produce a 'key named enabled' property on the object 
    };

