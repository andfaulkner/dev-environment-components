console.log('hey!');

console.log('----------------------------------------------------------------------------------');
//###################################
//#          BASIC CLASSES          #
//###################################
console.log('***************** BASIC CLASSES *****************');
class Greeter {
  greeting: string;
  name: string;

  constructor(greeting: string, name: string) {
    this.greeting = greeting;
    this.name = name;
    console.log(`Created new Greeter. Name: ${this.name}. Unique greeting: ${this.greeting}.`);
  }

  greet(doUseName : boolean = false) {
    return `Hello, ${this.greeting}${(doUseName ? (', my name is ' + this.name) : '')}!`;
  }
}

console.log(" ----- Classes can have constructors w/ typed params. To assign val of an arg -----");
console.log(" ----- given to constructor->the instance, prop must be defined on the class. -----");
let BigBubbaBlob = new Greeter('aloha', 'Bubba');

console.log(" ----- Methods can have default param values -----");
console.log(BigBubbaBlob.greet());

console.log(" ----- Passing a val to the fn param w the default val overrides the default -----");
console.log(BigBubbaBlob.greet(true));


console.log('----------------------------------------------------------------------------------');
//#######################################
//#          CLASS INHERITANCE          #
//#######################################

interface Product {
  item: GeneralProduct | AmericanProduct;
}

enum GeneralProduct {
  Food,
  Toys,
  Electronics,
  Toiletries,
  Medications
}

enum AmericanProduct {
  Shotguns,
  Revolvers,
  Assault_Rifles,
  Semiautomatics,
  Handguns
}

// Product = AmericanProduct

console.log('***************** CLASS INHERITANCE *****************');

class WalmartGreeter extends Greeter {
  constructor(greeting: string, name : string, product: AmericanProduct) {
    super(greeting, name);
    console.log('Product: ', AmericanProduct[product]);
  }
}

new WalmartGreeter('yo homie', 'Jim Bob', AmericanProduct.Revolvers);

