
console.log('----------------------------------------------------------------------------------');
//###################################
//#          BASIC CLASSES          #
//###################################
console.log('***************** BASIC CLASSES *****************');

class Greeter {

  // CLASS PROPERTIES
  greeting: string;
  name: string;

  // CONSTRUCTOR
  constructor(greeting: string, name: string) {
    this.greeting = greeting;
    this.name = name;
    console.log(`Created new Greeter. Name: ${this.name}. Unique greeting: ${this.greeting}.`);
  }

  // METHODS
  greet(doUseName : boolean = false) {
    let greeting = `Hello, ${this.greeting}${(doUseName ? (', my name is ' + this.name) : '')}!`;
    console.log(`Greeting returned from greet method on Greeter instance:\n    ${greeting}` );
    return greeting;
  }

  hello(doLog: boolean = true) {
    if (doLog) {
      console.log('hello');
    }
    return 'hello';
  }
}

console.log(" ----- Classes can have constructors w/ typed params. To assign val of an arg -----");
console.log(" ----- given to constructor->the instance, prop must be defined on the class. -----");
let BigBubbaBlob = new Greeter('aloha', 'Bubba');

console.log(" ----- Methods can have default param values -----");
console.log(BigBubbaBlob.greet());

console.log(" ----- Passing a val to a fn param w a default val overrides the default val -----");
console.log(BigBubbaBlob.greet(true));


console.log('----------------------------------------------------------------------------------');
//#####################################################################
//#          RANDOM PARTS - USED IN OTHER SECTIONS OF LESSON          #
//#####################################################################
interface Product {
  item: GeneralProduct | AmericanProduct;
}

enum GeneralProduct { Food, Toys, Electronics, Toiletries, Medications }
enum AmericanProduct { Shotguns, Revolvers, Assault_Rifles, Semiautomatics, Handguns }


console.log('----------------------------------------------------------------------------------');
//#######################################
//#          CLASS INHERITANCE          #
//#######################################
console.log('***************** CLASS INHERITANCE *****************');

console.log(" ----- Create class that inherits from another class -----");

class WalmartGreeter extends Greeter {
  product: AmericanProduct;

  constructor(greeting: string, name : string, product: AmericanProduct) {
    super(greeting, name); // runs parent constructor (in class Greeter)
    this.product = product;
    console.log('Product: ', AmericanProduct[product]);
  }

  sell(additionalProduct: AmericanProduct = null) {
    let product = AmericanProduct[this.product];
    console.log(`What in tarnation? Looks like we got some runaway deals on ${product}!`);
    if (additionalProduct !== null) {
      console.log("And what the darn tootin' are we gonna do with all these extra savings on " +
                  `${AmericanProduct[additionalProduct]}?`);
    }
  }

  hello(): string {
    let oldHello = super.hello(false);
    let newHello = `${oldHello} is what they say in the hoity-toity north. But this is real` + 
      '\'Murica! Here we say "Hey Billy-bob, get off ma roof, Imma tryin to roll ma John Deere"';
     console.log(newHello);
     return newHello;
  }

}

console.log(" ----- Instantiate new child (inheriting) class: -----");
var jimBob = new WalmartGreeter('yo homie', 'Jim Bob', AmericanProduct.Revolvers);

console.log(" ----- Call instance method on child class from new (child) instance -----");
jimBob.sell(AmericanProduct.Shotguns);

console.log(" ----- Call instance method on original parent class from new (child) instance -----");
jimBob.greet();

console.log(" ----- Call parent class-overriding instance method on child class -----");
console.log(" ----- Note that the overriding method calls the parent method (calls super) -----");
jimBob.hello();


console.log('----------------------------------------------------------------------------------');
//######################################
//#          ABSTRACT CLASSES          #
//######################################
console.log('***************** ABSTRACT CLASSES *****************');
console.log(" -- Uninstantiable base classes to derive other classes from (Note that a class derived");
console.log("    from an abstract class is instantiable - only abstract classes themselves are not)");

console.log('***************** ABSTRACT METHODS *****************');
console.log(" -- Only available in abstract classes");
console.log(" -- Methods marked abstract must have no implementation: that is provided by");
console.log(" -- subclasses. However, you can declare the yet-unimplemented method's type info.");

console.log(" ----- Create an abstract class with an abstract method & an implmented method -----");
abstract class Animal {
  abstract makeSound(): void
  move(): void {
    console.log('roamity roam roam roam...');
  }
}

console.log(" ----- Examine the var the abstract class object is assigned to: -----");
console.log('abstract class Animal is a function: ', Animal instanceof Function);
console.log('Note that abstract class Animal is an empty fn @ runtime: ', Animal);


console.log(" ----- See below (in public, protected, private section) for a larger example -----");

console.log('----------------------------------------------------------------------------------');
//################################################
//#          PUBLIC, PROTECTED, PRIVATE          #
//################################################
console.log('***************** PUBLIC, PROTECTED, PRIVATE *****************');
console.log("-- Almost the same as in Java.");
console.log("-- Note that methods & properties are public by default.");
console.log("-- Public & protected (but not private) members are accessable in derived classes.");
console.log("-- Public (but not protected & private) members are accessible outside the class");

console.log(" ----- EXAMPLE USE OF PUBLIC, PROTECTED, PRIVATE MODIFIERS -----");

console.log(" ----- Access modifiers on constructor args auto-assigns them to the instance -----");

enum PowerStation {
  Solar = 2,
  Wind = 3,
  Coal = 10,
  Oil = 20,
  Nuclear = 50,
  Fusion = 100
}

// Define a superclass for all industrial plants
// Not instantiable
abstract class IndustrialPlant {
  protected squareMetres: number;

  abstract chargeBatteries(plant: PowerStation, daysToCharge: number): number;

  // virtual property (essentially) - provides # of volts this plant takes to run.
  protected dailyVoltUse = (): number => (this.squareMetres / 100);
}

class WaterTreatmentPlant extends IndustrialPlant {
  public storedVolts: number = 0;

  constructor(squareMetres: number, private dailyLitres: number, public name: string) {
    super();
    this.squareMetres = squareMetres;
    console.log(`New water treatment plant, thy gates hath opened! I shall dub thee... ${this.name}.`);
  }

  // public API, takes request to create clean water
  public processWater(daysOfTreatment: number): number {
    let amountTreated: number = this.runTreatment(daysOfTreatment);
    console.log(`WaterTreatmentPlant#processWater: amountTreated (return val): ${amountTreated}L`);
    return amountTreated;
  }

  // Increase # of storedVolts based on power station type used, and days it charged the water
  // treatment plant for. Returns total number of volts stored after charging complete.
  public chargeBatteries(plant: PowerStation, daysToCharge: number): number {
    this.storedVolts = (this.storedVolts + (plant * daysToCharge));
    return this.storedVolts;
  }

  // run the requested treatment. Determines if the full treatment can be run or not, and calls
  // treatment running methods accordingly
  private runTreatment(daysOfTreatment: number): number {
    let requiredVolts = this.voltsRequired(daysOfTreatment);
    return (requiredVolts <= this.storedVolts)
              ? this.runFullTreatment(requiredVolts, daysOfTreatment)
              : this.runTreatmentVoltShortage();
  }

  // run the full requested treatment (no resource shortages), return litres of water produced
  private runFullTreatment(requiredVolts: number, daysOfTreatment: number): number {
    console.log('There was enough power! yay!');
    this.storedVolts = this.storedVolts - requiredVolts;
    return this.dailyLitres * daysOfTreatment;
  }

  // run treatment until plant runs out of power, return litres of water produced
  private runTreatmentVoltShortage(): number {
    console.log('Not enough power - how sad :(');
    let daysBeforeNoPower: number = this.storedVolts / this.dailyVoltUse()
    this.storedVolts = 0;
    return daysBeforeNoPower * this.dailyLitres;
  }

  // calculate number of stored volts required to completed the requested treatment
  private voltsRequired(daysOfTreatment: number): number {
    let requiredVolts = this.dailyVoltUse() * daysOfTreatment;
    console.log('requiredVolts: ', requiredVolts);
    return requiredVolts;
  }
}

let CobourgPoosucker = new WaterTreatmentPlant(1000, 500, 'Cobourg Poosucker');

console.log(" ----- Should make no water since we haven't charged the plant yet. -----");
CobourgPoosucker.processWater(4);

console.log(" ----- We use the public api to charge the plant, but not quite enough for the full order... -----");
CobourgPoosucker.chargeBatteries(PowerStation.Oil, 1);

console.log(" ----- Now when we run it again there's enough power to produce some water, but not the whole order -----");
CobourgPoosucker.processWater(4);

console.log(" ----- View leftover voltage stored via public accessor, should be 0 -----");
console.log(CobourgPoosucker.storedVolts);

console.log(" ----- We use the public api to charge the plant, with enough power this time... -----");
CobourgPoosucker.chargeBatteries(PowerStation.Fusion, 1);

console.log(" ----- Now when we run it again there's enough power to produce the whole order -----");
CobourgPoosucker.processWater(6);

console.log(" ----- View leftover voltage stored via public accessor again, should be 40 this time: -----");
console.log(CobourgPoosucker.storedVolts);
