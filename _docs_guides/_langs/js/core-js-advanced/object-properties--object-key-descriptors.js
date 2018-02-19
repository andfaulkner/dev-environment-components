// OBJECT KEY DESCRIPTOR TYPES
// ===========================
// 1. Data descriptor
//     - Has a value, which may or may not be writable
// 2. Accessor descriptor
//     - Described by getter-setter pair of functions

// OBJECT DESCRIPTOR PROPERTIES (for each object key)
// ==================================================
// PROPERTIES OF OBJECT KEY
// ## configurable
//    -   AVAILABLE IN: both descriptor types
//    -   DEFAULT VALUE: false
//    -   true if this property descriptor's behaviour can be modified AND property can be deleted
//        Can make this property enumerable/non-enumerable, writable/non-writable, and/or
//        configurable/non-configurable.
//        DOES NOT IN AND OF ITSELF MAKE THE PROPERTY WRITABLE!!!
//
// ## enumerable
//    -   AVAILABLE IN: both descriptor types
//    -   DEFAULT VALUE: false
//    -   true if value shows up when enumerating properties on the corresponding object
//        This means it's accessible in a for-of or for-in loops, and visible via Object.keys
//
// ## writable
//    -   AVAILABLE IN: data descriptors
//    -   DEFAULT VALUE: false
//    -   true if value associated with the property can be changed by an assignment operator
//
// CONTENT AT OBJECT KEY
// ## get    --  accessor descriptors  |  DEFAULT: undefined
// ## set    --  accessor descriptors  |  DEFAULT: undefined
// ## value  --  data descriptors      |  DEFAULT: undefined

/******************************************** EXAMPLES ********************************************/
//
// 1 :: STATIC PROPERTY
//

Object.defineProperty(obj, 'key', {
    configurable: false,
    enumerable: false,
    writable: false,
    value: 'I am a static property'
});

// Output
console.log(obj.key); // => 'I am a static property'

// Fails because it's not writable
obj.key = 'this will not work';
console.log(obj.key); // => 'I am a static property'

// Fails because it's not configurable
delete obj.key;       // => false
console.log(obj.key); // => 'I am a static property'

// Fails because it's not enumerable
console.log(Object.keys(obj)); // => []

// Still works, even though it's not enumerable
console.log(Object.getOwnPropertyNames(obj)); // => ['key']


//
// 2 :: MUTABLE PROPERTY
//

Object.defineProperty(o, 'a', {
    configurable: true
    enumerable: true,
    writable: true,
    value: 37,
});

console.log(o.a); // => 37

// Works because it's writable
o.a = 55;
console.log(o.a); // => 55

// Works because it's configurable
delete o.a;       // => true
console.log(o.a); // => undefined

// Works because it's enumerable
console.log(Object.keys(o)); // => ['a']

// Still works, but would even if not enumerable
console.log(Object.getOwnPropertyNames(o)); // => ['a']
