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

function logTarget(target: any) {
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
@logTarget
class Dog {
  bark() {
    console.log('woof');
  }
}


console.log('----------------------------------------------------------------------------------');
//#########################################
//#          DECORATOR FACTORIES          #
//#########################################
console.log('***************** DECORATOR FACTORIES *****************');
// a function that returns the expression that will be called by the decorator at runtime

function logTargetWOpts(value: string) { // this is the decorator factory
  console.log(`Decorator factory used rather than standard decorator. Received value: ${value}`);
  return logTarget; // this is the decorator
}

@logTargetWOpts('yep')
class Cat { }

/**
 * NewClass
 */
class NewClass {
  constructor(parameters) {
  }
}
