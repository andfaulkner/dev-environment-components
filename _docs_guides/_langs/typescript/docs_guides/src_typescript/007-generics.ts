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

console.log('----------------------------------------------------------------------------------');
//#####################################
//#          GENERIC CLASSES          #
//#####################################
console.log('***************** GENERIC CLASSES *****************');

console.log(' ----- Define a generic class, no actual values defined -----');
class GenericNumber<T> {
  zeroValue: T;
  add: (x: T, y: T) => T;
}

console.log(' ----- Instantiate generic class with a type declared -----');
let gn = new GenericNumber<number>();

console.log(' ----- Set values for class params that meet the requirements -----');
// gn.zeroValue = "asdf";  << ERROR - wrong type, it must be a number
gn.zeroValue = 0;

gn.add = (x: number): number => {
  console.log('in GenericNumber#add: value x is: ' + x);
  return x + 3;
};

// gn.add(4); <<< will error even though the above fn is OK. It still expects it to match the class
gn.add(4, 4); // <<< ok, even though the 2nd 4 is useless
//=> 7

gn.add = (x: number, y: number): number => {
  console.log('gn.add: second pass. Given numbers: ', x, 'and', y, ' -- totaling', x + y);
  return (x + y);
};
gn.add(6, 7);
//=> 13  

console.log(' ----- Note: static members of a class can\'t use the class\' type params -----');

console.log('----------------------------------------------------------------------------------');
//###############################################
//#          EXTENDING GENERIC CLASSES          #
//###############################################
console.log('***************** EXTENDING GENERIC CLASSES *****************');

console.log(' ----- Create a generic class ----- ');
class Component<S, T> {
  id: S;
  genFullTitleFromId: (salt: T) => string;
}

console.log(' ----- Create a class extending generic class ----- ');
class Password extends Component<string, number> {
  constructor(id: string) {
    super();
    this.id = id;
  }
  genFullTitleFromId = (salt: number): string => {
    let salted = this.id + ((salt ^ 2) - salt) + 'asdf' + this.id;
    console.log('007-generics-Password#genFillTitleFromId: salted: ', salted);
    return salted;
  }
}

console.log(' ----- Instantiate class that extended generic class ----- ');
let pwd = new Password('my_password_123');

pwd.genFullTitleFromId(3416);



console.log('----------------------------------------------------------------------------------');
//#########################################
//#          GENERIC CONSTRAINTS          #
//#########################################
console.log('***************** GENERIC CONSTRAINTS *****************');

console.log(' ----- Write a fn that works on any type matching the given constraints ----- ');
console.log(' ----- i.e. any function that meets the given interface, but can have anything else ----- ');

interface LengthMeasurable {
  length: number;
}

function loggingIdentity<T extends LengthMeasurable>(arg: T): T {
  console.log(arg.length);
  return arg;
}

function loggingIdentityTwo<T extends LengthMeasurable>(arg: T): T {
  console.log(arg.length);
  arg.length = 20;
  return arg;
}

function loggingIdentityThree<T extends LengthMeasurable>(arg: T): T {
  console.log(arg.length);
  arg.length = 20;
  let newArg = arg;
  Object.keys(arg).forEach((key, i, arr) => { newArg[key] = 'yep'; });
  console.log(newArg);
  return newArg;
}

// myType must contain 53 for this to work
let myType: { length: number, name: string } = {
  length: 53,
  name: 'asdf the poo llama'
};

loggingIdentityThree(myType); // hey look, I broke it

loggingIdentityThree('asdfasdf'); // OK, because strings have a length property
// loggingIdentityThree(6); // << ERROR, because numbers have no length property

console.log('----------------------------------------------------------------------------------');
//###############################################################################
//#          TYPE PARAMS CONSTRAINED BY OTHER TYPE PARAMS IN A GENERIC          #
//###############################################################################
console.log('***************** TYPE PARAMS CONSTRAINED BY OTHER TYPE PARAMS IN A GENERIC *****************');

console.log(" ----- Create a class with 2 type params, where 1 constrains the other -----");

console.log(" ----- T must have all the methods of U, but can have more -----");
interface StringWithId extends String {
  id: string;
}

function copyFields<T extends U, U>(target: T, source: U): T {
    for (let id in source) {
        target[id] = source[id];
    }
    return target;
}

console.log(" ----- Factory is needed to create function extending String prototype -----");
let asdf: String = "asdfasdf";
function stringWithIdFactory(str: string, id: string): StringWithId {
  let something: any = str;
  something[id] = "[" + id + "]";
  return something;
}

let asdfWId = stringWithIdFactory("hello", "greeting");

console.log(" ----- Pass String and StringWId object to copyFields fn where 1 generic type -----");
console.log(" ----- constrains the other -----");
copyFields<StringWithId, String>(asdfWId, asdf); // OK - all type requirements met

console.log(" ----- Pass object literals to copyFields fn; works because 1st item has all -----");
console.log(" ----- fields 2nd one does, and more -----");
copyFields<{x: number, y: number}, {x: number}>({x: 1, y: 3}, {x: 5});

console.log(" ----- Pass object literals to copyFields fn without declaring generic types. -----");
console.log(" ----- They're not needed if passing object literals. -----");
copyFields({x: 1, y: 3}, {x: 5});

copyFields({x: 1}, {x: 4}); // OK, because a type qualifies as an extension of itself in this case

console.log('----------------------------------------------------------------------------------');
//#############################################
//#          CLASS TYPES IN GENERICS          #
//#############################################
console.log('***************** CLASS TYPES IN GENERICS *****************');


enum Color {
  Red,
  Blue,
  Green,
  White
}

///////////
console.log(" ----- EXAMPLE 1: CLASS TYPES IN GENERICS -----");
///////////

class Square {
  constructor(public width: number) { };
  area = () => (this.width * this.width);
}

function createShape<T>(fn: {new(...dimen: number[])}, ...dimen: number[]): T {
  return new fn(...dimen);
}

let newSquare: Square = createShape<Square>(Square, 10);
console.log('newSquare.area(): ', newSquare.area()); // => 100


///////////
console.log(" ----- EXAMPLE 2: CLASS TYPES IN GENERICS -----");
///////////

console.log(" ----- Define class to be auto-constructed by a factory later -----");
class Hydrant {
  name: string;
  color: Color;
  constructor(color: Color, name: string) {
    this.name = name.charAt(0).toUpperCase() + name.slice(1).toLowerCase();
    this.color = color;
  }
}

console.log(" ----- Create factory in typescript using generics -----");
// must refer to the constructor function if doing this
// i.e. the class being passed as a param must have a constructor with a matching param signature
function createRed<T>(fn: {new(color: Color, name?: string): T; },
                      name?: string): T {
  return (name) ? new fn(Color.Red, name) : new fn(Color.Red);
}

console.log(" ----- Instantiate with in typescript using generics -----");
let joe = createRed<Hydrant>(Hydrant, "joe");

console.log(joe);

console.log('----------------------------------------------------------------------------------');
//##########################################################################
//#          USE CLASS TYPES IN GENERICS W ADDED USE OF PROTOTYPE          #
//##########################################################################
console.log('***************** USE CLASS TYPES IN GENERICS W ADDED USE OF PROTOTYPE *****************');

class Person {
  constructor(public name: string) { }
}

class Adult extends Person {
  hasDriversLicense: boolean;
}

class Child extends Person {
  currentSchool: string;
}

class Vehicle {
  numWheels: number;
  rider: Person;
}

class Car extends Vehicle {
  numWheels = 4;
  horsepower: number;
}

class Tricycle extends Vehicle {
  numWheels = 3;
  hasBasket: boolean;
  hasLittleTrayAtBottomBack: boolean;
}

class Bicycle extends Vehicle {
  hasBasket: boolean;
  numWheels = 2;
}

function getRider<V extends Vehicle, P>(v: {new(): V; prototype: {rider: P}}): P {
  console.log('007-generics#getRider: v: ', v);
  console.log('007-generics#getRider: v.prototype: ', v.prototype);
  console.log('007-generics#getRider: v.prototype.rider: ', v.prototype.rider);
  return v.prototype.rider;
}

getRider(Tricycle); // => undefined; however, the type checking passes
// getRider(Tricycle).name; // => typechecks, but it causes a crash if run. Hm fail.

console.log(" ----- NOTE ON class extends: WHEN YOU USE extends, ALL ITEMS ON THE CLASS BEING -----");
console.log(" ----- EXTENDED ARE ASSIGNED TO THE prototype PROPERTY OF THE class DOING THE EXTENDING -----");
