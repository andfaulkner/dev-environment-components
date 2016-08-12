"use strict";
require('sleep');
console.log('----------------------------------------------------------------------------------');
//#####################################################
//#          BLOCK-SCOPED VARIABLE CAPTURING          #
//#####################################################
console.log('***************** BLOCK-SCOPED VARIABLE CAPTURING *****************');
function theCityThatAlwaysSleeps() {
    var getCity;
    if (true) {
        var city_1 = "Seattle";
        getCity = function () {
            return city_1;
        };
    }
    return getCity();
}
console.log('returned due to block-scoped variable capturing: ', theCityThatAlwaysSleeps());
console.log('----------------------------------------------------------------------------------');
//######################################
//#          HELLO AGAIN LET!          #
//######################################
console.log('***************** HELLO AGAIN LET! *****************');
var _loop_1 = function(i) {
    setTimeout(function () { console.log(i); }, 100 * i);
};
for (var i = 0; i >= 10; i++) {
    _loop_1(i);
}
// => would normally output 1 2 3 4 5 6 7 8 9 10, but the app completes too quickly
console.log('----------------------------------------------------------------------------------');
//################################################
//#          HELLO AGAIN DESTRUCTURING!          #
//################################################
console.log('***************** HELLO AGAIN DESTRUCTURING! *****************');
console.log(" ----- Assign vars from an array to individual vars with destructuring... -----");
var input = [1, 2];
var uno = input[0], dos = input[1];
console.log('uno:', uno, '   dos:', dos);
console.log(" ----- Now flip them easily with more destructuring... -----");
_a = [dos, uno], uno = _a[0], dos = _a[1];
console.log('uno:', uno, '   dos:', dos);
console.log(" ----- Destructure right in function parameters... -----");
function func(_a) {
    var uno = _a[0], dos = _a[1];
    console.log('1st param from the array arg: ', uno, ';; 2nd param from the array arg: ', dos);
}
func([4, 5]);
console.log(" ----- Pull random-ass elements from an array... -----");
var arr = [1, 2, 3, 4, 5, 6, 7];
var third = arr[2], fourth = arr[3], sixth = arr[5];
console.log('third: ', third, ';; fourth: ', fourth, ';; sixth: ', sixth);
console.log(" ----- Destructure objects... -----");
var o = {
    a: "foo",
    b: 12,
    c: "bar",
    d: [1, 2, 3]
};
var a = o.a, b = o.b;
console.log('Vars extracted from an object:  a: ', a, ';; b: ', b);
var newName1 = o.c, newName2 = o.d;
// wat. This is backwards from what you'd expect...
console.log('New variable newName1, from c in object o: ', newName1);
console.log('New variable newName2, from d in object o: ', newName2);
console.log('----------------------------------------------------------------------------------');
//##############################################################
//#          TYPE ALIASES / EXPLICIT TYPE DEFINITIONS          #
//##############################################################
console.log('***************** TYPE ALIASES / EXPLICIT TYPE DEFINITIONS *****************');
console.log(" ----- Define a new 'type' -----");
console.log(" ----- Adding explicit type def to fn arg ensures fn args match props of type -----");
console.log('arg a MUST be a str, & arg b must be a #, as per the equivalent props in type C');
function fnTestTwo(_a) {
    var a = _a.a, _b = _a.b, b = _b === void 0 ? 3 : _b;
    console.log('a: ', a, ';; b: ', b);
}
console.log('Below works, because fnTestTwo was given an obj w/ str & number in correct props');
fnTestTwo({ a: 'TEN!', b: 4 });
console.log('Also works with no second var defined, because the function declares a default');
fnTestTwo({ a: 'TEN!', b: 4 });
console.log('note that types are not objects. You cannot log them.');
console.log(" ----- Slightly less trivial example of type aliasing... -----");
function bark(_a) {
    var name = _a.name, age = _a.age, _b = _a.breed, breed = _b === void 0 ? 'mutt' : _b;
    var titleName = name.charAt(0).toUpperCase() + name.substr(1).toLowerCase();
    console.log(titleName + " the " + age + "-year-old " + breed + " dog goes bark bark bark");
}
bark({ name: 'meeka', age: 5, breed: 'Rottie-shepherd' });
bark({ name: 'callie', age: 5 });
var _a;
