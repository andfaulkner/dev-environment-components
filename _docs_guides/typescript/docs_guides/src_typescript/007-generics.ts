console.log('----------------------------------------------------------------------------------');
//####################################
//#          BASIC GENERICS          #
//####################################

console.log('***************** BASIC GENERICS *****************');

// Generics let you define type relationships without specifying actual types.
//
// Examples of the concept (i.e. examples of what a generic might communicate):
//
// -  for a function taking one argument, if the value given arg is of type "x", then said fn's
//    output must ALSO be type "x". Type "x" could be any type. This e.g. states that if a number
//    is given to the function, a number must be returned; whereas if a string is given to the
//    function, a string must be returned, and so on.
//
// -  for a function taking 3 arguments, if arg 1 is type "x" and arg 2 is type "y" then arg 3 must
//    also be type "x", and the return value must be an array w/ 2 items: the 1st of type "x", and
//    the 2nd of type "y". Thus, if a string then number is given, the third value given must also
//    be a string, and an arr w/ a string at item 1 & number at item 2 must be returned. Whereas if
//    a number then string is given, the 3rd val given must also be number, and an array w/ a
//    NUMBER at item 1 & string at item 2 must be returned.
//
// Generics define type RELATIONSHIPS of a function rather than individual types. If generics could
// talk, they'd say things like: "if you give me an integer here, you have to also give me another
// integer over there, but you can't also give me an integer at that 3rd location"
//

console.log(" ----- 'Identity' generic: must return item of same type as value passed in -----");

function identity<T>(arg: T): T {
  console.log('identity func! pass it in, and I\'ll spit it right back out!: Here ya go: ', arg);
  return arg;
}

identity<number>(4);
identity<string>('hey!');
identity<Object>({numberOfBumcheeks: 3, numberOfBumcracks: 1});
identity<string[]>(['hey!', 'yes you!', 'wtf dude?']);
identity<{ a: string }>({a: 'ok' });
identity<boolean>(true);

console.log(' --- Generic that returns array containing required # of duplicates of given val ---');

function duplicator<T>(arg: T, numDuplicates: number): T[] {
  let arr = Array.apply(null, Array(numDuplicates)).map(() => arg);
  // let arr = Array(numDuplicates).fill(arg);
  console.log(arr);
  return arr;
}

duplicator<string>('yay!', 4);


console.log('----------------------------------------------------------------------------------');
//###################################
//#          GENERIC TYPES          #
//###################################
console.log('***************** GENERIC TYPES *****************');

console.log(' ----- Complex generic function types (define rets, args, allowed assignments) -----');

function identity3<T>(arg: T): T {
  console.log('in identity3: ', arg);
  return arg;
}

//------------- 1 -------------\   /-- 2 --\
let myIdentity: <T>(arg: T) => T = identity3;
//
//1: generic function type definition
//2: actual function assigned to generic function type definition. Must meet definition in 1.

myIdentity<string>('ok');


console.log(' ----- Define complex generic function type right beside function expression -----');

let identity4: <T>(arg: T) => T = function identity4<T>(arg: T): T {
  console.log('in identity4: ', arg);
  return arg;
};

identity4<number>(42);

// This madness is also valid, but seriously don't do it...this is what generic interfaces are for
let identity5: <T>(arg: T) => T = <T>(arg: T): T => arg;

console.log('Output of mad identity5 function w/ confusing typedef: ', identity5<string>('YAY!'));


console.log('----------------------------------------------------------------------------------');
//########################################
//#          GENERIC INTERFACES          #
//########################################
console.log('***************** GENERIC INTERFACES *****************');

console.log(' ----- Def generic function interface -----');
interface GenericIdentityFn {
    <T>(arg: T): T;
}

let identity7: GenericIdentityFn = <T>(arg: T): T => arg;
console.log('identity7 (using generic fn) output: ',
            identity7<{ a: string }>({ a: 'value of eeeeeeehhhh!!!' }));

console.log(' ----- Purpose of generic fn interface: ensure vars using interface only get assigned matching fns -----');
let someRandomFn1 = <T>(arg: T): T => arg;

console.log('someRandomFn1 can be assigned to identity8 because the types match');
let identity8: GenericIdentityFn = someRandomFn1;
console.log('identity8 (using generic fn) output: ',
            identity8<string[]>(['abc', 'def']));

let someRandomFn2 = function someRandomFn2(thing: string, otherThing: number): string {
  return 'BEGIN\n  ' + thing + '\n' + otherThing.toString() + '\nEND';
};

let identity9: GenericIdentityFn;
console.log("someRandomFn2 can't be assigned to identity9 because the types don't match");
// This produces a compile-time error:
//     identity9 = someRandomFn2;
