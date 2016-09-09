var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
console.log('----------------------------------------------------------------------------------');
//################################
//#          DECORATORS          #
//################################
console.log('***************** DECORATORS *****************');
// Special declaration that can be attached to a class declaration, method, accessor, property,
// or parameter to modify its behaviour. They have the form:
//     @expression
// ...where expression evaluates to a fn called at runtime w info abt the decorated declaration.
console.log('----------------------------------------------------------------------------------');
//#########################################
//#          DEFINING DECORATORS          #
//#########################################
console.log('***************** DEFINING DECORATORS *****************');
console.log(' ----- Create an example decorator -----');
function logTarget(target) {
    console.log('The target wrapped by this decorator is: ', target.name);
    let typeOfWrappedComponent = 'function';
    let startsWithCap = target.name.match(/^\s?[A-Z]/g) !== null;
    let hasFnSharingTargetName = target.toString().match(`function ${target.name}`);
    let hasMultipleFns = target.toString().match(/.*function.*function.*/g);
    let hasEmptyFn = target.toString().match(/function[^\{]+?\{[^a-zA-Z0-9_]+?\}/);
    if (startsWithCap && hasFnSharingTargetName && !hasMultipleFns && hasEmptyFn) {
        typeOfWrappedComponent = 'class';
    }
    console.log('This decorator is wrapping a ' + typeOfWrappedComponent + '.');
}
console.log(' ----- Use example decorator on a class -----');
let Dog = class Dog {
    bark() {
        console.log('woof');
    }
};
Dog = __decorate([
    logTarget
], Dog);
console.log('----------------------------------------------------------------------------------');
//#########################################
//#          DECORATOR FACTORIES          #
//#########################################
console.log('***************** DECORATOR FACTORIES *****************');
// a function that returns the expression that will be called by the decorator at runtime
function logTargetWOpts(value) {
    console.log(`Decorator factory used rather than standard decorator. Received value: ${value}`);
    return logTarget; // this is the decorator
}
let Cat = class Cat {
};
Cat = __decorate([
    logTargetWOpts('yep')
], Cat);
/**
 * NewClass
 */
class NewClass {
    constructor(parameters) {
    }
}
