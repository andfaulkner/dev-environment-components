console.log('----------------------------------------------------------------------------------');
//#############################################
//#          STRUCTURAL TYPE MATCHES          #
//#############################################
console.log('***************** STRUCTURAL TYPE MATCHES *****************');
console.log(" ----- Discarding a param passed to a fn is OK -----");
let x = (a) => 0;
let y = (a, s) => 0;
y = x; // OK
console.log(" -- y = (a: number, s: string) => 0; --- y was assigned x: (a: number) => 0; <-OK --");
console.log(" ----- However, not having a required param to a fn is not allowed -----");
// ERROR: x = y;
console.log(' ----- When reassigning var holding an fn, can only give it a fn with LESS vars, not more');
console.log(" ----- DISCARDING KEYS IN RETURN TYPE -----");
let a = () => ({ name: "Alice" });
let z = () => ({ name: "Alice", location: "Seattle" });
console.log(" ---- When assigning new fn to param prev holding another var, OK to have extra ----");
console.log(" ---- key in ret obj in fn being assigned to var prev holding another fn ----");
a = z; // OK
console.log(" ----- However, missing a return key is not -----");
// ERROR: z = 1
console.log('----------------------------------------------------------------------------------');
//####################################################
//#          FUNCTION OVERLOAD TYPE MATCHES          #
//####################################################
console.log('***************** FUNCTION OVERLOAD TYPE MATCHES *****************');
// When a function has overloads, each overload in the source type must be matched by a compatible
// signature on the target type. This ensures that target function can be called in all the same
// situations as the source function.
console.log(" ----- Create a class with method overloads -----");
console.log(" ----- Overloads act as docs: only 1 implementation of fn allowed, others are -----");
console.log(" ----- just signatures informing what types of args are allowed -----");
class TestClass {
    testMethod(a, b) {
        return a + b;
    }
    ;
}
console.log(" ----- Note: unnecessary due to union types -----");
console.log('----------------------------------------------------------------------------------');
//#################################################
//#          CLASS OVERLOAD TYPE MATCHES          #
//#################################################
console.log('***************** CLASS OVERLOAD TYPE MATCHES *****************');
console.log(" ----- Create 2 classes differing only in params req by constructor -----");
class Animal {
    constructor(name, numFeet) {
        console.log('here!');
    }
}
class Size {
    constructor(name) {
        console.log('here, inside Animal!!');
    }
}
console.log(" ----- Vars defined as Animal assignable to vars defined as Size & vice versa -----");
let animal1;
let size1;
animal1 = size1; // OK
let animal2;
let size2;
size2 = animal2; // OK
console.log(" ----- Why? Only members of an instance are compared. Static methods, constructors ignored -----");
console.log('----------------------------------------------------------------------------------');
//#################################################################
//#          TYPE MATCHES FOR INSTANCES OF GENERIC TYPES          #
//#################################################################
console.log('***************** TYPE MATCHES FOR INSTANCES OF GENERIC TYPES *****************');
console.log(" ----- Create empty interface with a generic type -----");
;
console.log(" ----- Create 2 vars w/ different types given for generic passed to interface -----");
let m1;
let n1;
console.log(" ----- Assign n1 to m1. This is OK, because the signatures match -----");
m1 = n1; // OK, m1 matches structure of n1
console.log(" ----- Create interface w/ a generic type containing fn that uses the generic -----");
;
console.log(" ----- Create 2 more vars w/ diff types given for generic passed to interface -----");
let m2;
let n2;
console.log(" ----- Here n2 can't be assigned to m2, as the types no longer match due to -----");
console.log(" ----- application of the generic type -----");
// m1 = n1; // ERROR
