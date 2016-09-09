import 'sleep';

console.log('----------------------------------------------------------------------------------');
//#####################################################
//#          BLOCK-SCOPED VARIABLE CAPTURING          #
//#####################################################
console.log('***************** BLOCK-SCOPED VARIABLE CAPTURING *****************');

function theCityThatAlwaysSleeps() {
    let getCity;

    if (true) {
        let city = "Seattle";
        getCity = function() {
            return city;
        }
    }

    return getCity();
}

console.log('returned due to block-scoped variable capturing: ', theCityThatAlwaysSleeps());

console.log('----------------------------------------------------------------------------------');
//######################################
//#          HELLO AGAIN LET!          #
//######################################
console.log('***************** HELLO AGAIN LET! *****************');

for (let i = 0; i >= 10; i++) {
    setTimeout(function(): void {console.log(i); }, 100 * i);
}
// => would normally output 1 2 3 4 5 6 7 8 9 10, but the app completes too quickly

console.log('----------------------------------------------------------------------------------');
//################################################
//#          HELLO AGAIN DESTRUCTURING!          #
//################################################
console.log('***************** HELLO AGAIN DESTRUCTURING! *****************');


console.log(" ----- Assign vars from an array to individual vars with destructuring... -----");
let input = [1, 2];
let [uno, dos] = input;
console.log('uno:', uno, '   dos:', dos);

console.log(" ----- Now flip them easily with more destructuring... -----");
[uno, dos] = [dos, uno];
console.log('uno:', uno, '   dos:', dos);

console.log(" ----- Destructure right in function parameters... -----");
function func([uno, dos]: [number, number]): void {
  console.log('1st param from the array arg: ', uno, ';; 2nd param from the array arg: ', dos);
}

func([4, 5]);

console.log(" ----- Pull random-ass elements from an array... -----");
let arr = [1, 2, 3, 4, 5, 6, 7];
let [ , , third, fourth, , sixth] = arr;
console.log('third: ', third, ';; fourth: ', fourth, ';; sixth: ', sixth);

console.log(" ----- Destructure objects... -----");

let o = {
    a: "foo",
    b: 12,
    c: "bar",
    d: [1, 2, 3]
}
let {a, b} = o;

console.log('Vars extracted from an object:  a: ', a, ';; b: ', b);

let { c: newName1, d: newName2 } = o;

// wat. This is backwards from what you'd expect...
console.log('New variable newName1, from c in object o: ', newName1);
console.log('New variable newName2, from d in object o: ', newName2);

console.log('----------------------------------------------------------------------------------');
//##############################################################
//#          TYPE ALIASES / EXPLICIT TYPE DEFINITIONS          #
//##############################################################
console.log('***************** TYPE ALIASES / EXPLICIT TYPE DEFINITIONS *****************');

console.log(" ----- Define a new 'type' -----");
type C = {a: string, b?: number}

console.log(" ----- Adding explicit type def to fn arg ensures fn args match props of type -----");
console.log('arg a MUST be a str, & arg b must be a #, as per the equivalent props in type C');

function fnTestTwo({a, b = 3}: C) : void {
  console.log('a: ', a, ';; b: ', b);
}

console.log('Below works, because fnTestTwo was given an obj w/ str & number in correct props');
fnTestTwo({a: 'TEN!', b: 4 });

console.log('Also works with no second var defined, because the function declares a default');
fnTestTwo({a: 'TEN!', b: 4 });

console.log('note that types are not objects. You cannot log them.');

console.log(" ----- Slightly less trivial example of type aliasing... -----");
type Dog = {name: string, age: number, breed?: string}

function bark({name, age, breed = 'mutt' } : Dog) : void {
  let titleName = name.charAt(0).toUpperCase() + name.substr(1).toLowerCase();
  console.log(`${titleName} the ${age}-year-old ${breed} dog goes bark bark bark`);
}

bark({name: 'meeka', age: 5, breed: 'Rottie-shepherd'})
bark({name: 'callie', age: 5})
