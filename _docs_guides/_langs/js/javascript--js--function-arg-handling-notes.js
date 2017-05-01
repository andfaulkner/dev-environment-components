
/********************************* REST ARGS / VARARGS BEHAVIOUR **********************************/
// Behaviour of arguments in functions/methods ending with 'rest' args / varargs (...args)

// For example function someFunction within class SomeClass:
class SomeClass {
    someFunction = (firstArg?: any, ...restArgs: any[]): any => { /* Things */};
}
const someInstance = new SomeClass();

// Given each of the following sets of arguments, these are what we can expect the values of
// firstArg and restArgs to be within someFunction:
//
//   someInstance.someFunction()
//      RESULT:
//          firstArg:   typeof firstArg === undefined     value: undefined
//          restArgs:   typeof restArgs !== undefined     value: []             restArgs.length: 0
//
//   someInstance.someFunction('a')
//      RESULT:
//          firstArg:   typeof firstArg !== undefined     value: 'a'
//          restArgs:   typeof restArgs !== undefined     value: []             restArgs.length: 0
//
//   someInstance.someFunction('a', 'b')
//      RESULT:
//          firstArg:   typeof firstArg !== undefined     value: 'a'
//          restArgs:   typeof restArgs !== undefined     value: ['b']          restArgs.length: 1
//
//   someInstance.someFunction('a', 'b', 'c');
//      RESULT:
//          firstArg:   typeof firstArg !== undefined     value: 'a'
//          restArgs:   typeof restArgs !== undefined     value: ['b', 'c']     restArgs.length: 2
