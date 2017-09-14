/**************************************** OBJECT LITERALS *****************************************/

// With functions
object someObj {
    fun hello(name: String): String = "Hello ${name}!" 
}

/************************************* OBJECT INITIALIZATION **************************************/
// Order of initialization
// =======================
// More info: https://medium.com/keepsafe-engineering/an-in-depth-look-at-kotlins-initializers-a0420fcbf546
//
// Order of initialization: inheritance present
// --------------------------------------------
// 1. Child default constructor arguments:
//    a) Default arguments to the constructor you called directly ("secondary" constructor)
//          `constructor(arg1 = println('Executes now')) { .. }`
//    b) Default arguments to any delegated constructors, in order called (including "primary constructor")
//          constructor(arg1, arg2): this(arg1) { .. }
//          constructor(arg1: println('Delegated constructor default args execute now')) { .. }
// 2. Parent initializers [*]
// 3. Parent primary constructor (if inheritance is being used)
//    Superclasses get fully constructed before any subclass constructors are called
// 4. Child initializers [*]
// 5. Child primary constructor
// 6. Child secondary constructor
// 
// [*] Initializers means both property initializers & init blocks.
//     These execute top-to-bottom - I.E. if you put an init { } block above the
//     properties, the init block will execute first.
//
// Order of initialization: no inheritance
// ---------------------------------------
// 1. Default constructor arguments - in order of constructor delegation
// 2. Delegated constructor arguments (in order of delegation)
// 3. Property initializers, from top-to-bottom
// 4. Delegated constructors (in order of delegation)
// 5. Secondary (directly called) constructor
//
// General rules
// -------------
// - If you call a secondary constructor, the constructor that gets delegated to will be run
//   before the secondary constructor
// - superclasses will be fully constructed before any subclass constructors are run
// - initializers are run top to bottom at the beginning of a class’ primary constructor
// - No matter where in the class the constructor is defined, it is always executed after
//   all initializers have run

/******************************* NULL-SAFE CALLS:    obj?.method() ********************************/
// If the method in the 2nd part of the expression doesn't exist, safely returns null
someObj?.nonexistentMethod() // => returns null if nonexistentMethod doesn't exist on someObj
someObj?.hello("Meeka") // => returns "Hello Meeka!" (calls hello, since someObj.hello exists)

/************************************** ELVIS OPERATOR:   ?: **************************************/
// If the first part of the expression is "null", use the fallback value
val someValue = someOtherVariable ?: "Fallback value"
val someValue = someOtherVariable?.getSomething() ?: "Fallback value"

/*********************************** NPE OPERATOR:   someVal!! ************************************/
// Throw a null-pointer exception if the value before the operator is null
null!! // << This will always throw

someObj!! // << Will not throw

val catName = "Kyra"
val pigName = null

someObj.hello(catName!!) // Returns "Hello Kyra!", because catName is not null
someObj.hello(fishName!!) // Throws, because fishName doesn't exist
someObj.hello(pigName!!) // Throws, because pigName is null
