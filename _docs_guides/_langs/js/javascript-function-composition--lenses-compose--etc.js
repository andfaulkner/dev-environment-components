/**
 * Function composition is a pattern in which the output of one function gets given as the input
 * of the next in a 'composition chain'.
 * That's basically it.
 */

// Helpers, for use in examples

const square = (n) => (n * n);

const double = (n) => (n * 2);

const minusTwo = (n) => (n - 2);

/******************************************** MANUALLY ********************************************/
const result = minusTwo(double(square(5)))
// => 48

// Issue: this is ugly, confusing, hard-to-read, and the order the code runs is
// the opposite of what is normally seen (above, square runs, then double, then minusTwo)

// Solution: composition utilities

/************************************ COMPOSITION WITH LODASH *************************************/
const _ = require('lodash');

// Notice that the expected order of execution is restored
_.flow([square, double, minusTwo])(5);

// *** EQUIVALENCY COMPARISON (for reference) ***
_.flow([_.add, square])(1, 2);
// ...is equivalent to:
square(_.add(1, 2));

/********************************** MANUAL COMPOSITION UTILITIES **********************************/
/**
 * Actual compose function - going right to left.
 */
const composeRight = (fns) => {
    if (fns.length < 1) throw new TypeError('composeRight only takes arrs of funcs');
    const iter = function iter(funcs, curFunc) {
        if (funcs.length === 0) return (value) => curFunc(value);
        const nextFn = funcs.reverse().pop();
        funcs.reverse();
        return iter(funcs, (value) => curFunc(nextFn(value)));
    }
    const currentFunc = fns.reverse().pop();
    fns.reverse();
    return iter(fns, currentFunc);
};

/**
 * Actual compose function - going left to right
 */
const compose = (fns) => {
    if (fns.length < 1) throw new TypeError('compose only takes arrs of funcs');
    const iter = function iter(funcs, curFunc) {
        if (funcs.length === 0) return (value) => curFunc(value);
        const nextFn = funcs.pop();
        return iter(funcs, (value) => curFunc(nextFn(value)));
    }
    const currentFunc = fns.pop();
    return iter(fns, currentFunc);
};

//
// EXAMPLES
//

const curFunc = composeRight([square, double, minusTwo]);
console.log('curFunc OUTSIDE ALL FUNCTIONS #1:', curFunc);

const curFunc2 = compose([square, double, minusTwo]);
console.log('curFunc OUTSIDE ALL FUNCTIONS #2:', curFunc2);

alert(curFunc(3));
// => 4
alert(curFunc2(3));
// => 16

/********************************************* LENSES *********************************************/
// see https://medium.com/javascript-inside/an-introduction-into-lenses-in-javascript-e494948d1ea5

//  Definition
//      Lens: functional getter/setter

//
// Naive implementation
//

const lens = (getter, setter) => {
    return ({
        get: obj => getter(obj),
        set: (val, obj) => setter(val, obj),
    })
}

const view = (lens, obj) => lens.get(obj);

const set = (lens, val, obj) => lens.set(val, obj);
