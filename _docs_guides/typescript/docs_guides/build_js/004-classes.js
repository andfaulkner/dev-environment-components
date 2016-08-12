var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
console.log('----------------------------------------------------------------------------------');
//###################################
//#          BASIC CLASSES          #
//###################################
console.log('***************** BASIC CLASSES *****************');
var Greeter = (function () {
    // CONSTRUCTOR
    function Greeter(greeting, name) {
        this.greeting = greeting;
        this.name = name;
        console.log("Created new Greeter. Name: " + this.name + ". Unique greeting: " + this.greeting + ".");
    }
    // METHODS
    Greeter.prototype.greet = function (doUseName) {
        if (doUseName === void 0) { doUseName = false; }
        var greeting = "Hello, " + this.greeting + (doUseName ? (', my name is ' + this.name) : '') + "!";
        console.log("Greeting returned from greet method on Greeter instance:\n    " + greeting);
        return greeting;
    };
    Greeter.prototype.hello = function (doLog) {
        if (doLog === void 0) { doLog = true; }
        if (doLog) {
            console.log('hello');
        }
        return 'hello';
    };
    return Greeter;
}());
console.log(" ----- Classes can have constructors w/ typed params. To assign val of an arg -----");
console.log(" ----- given to constructor->the instance, prop must be defined on the class. -----");
var BigBubbaBlob = new Greeter('aloha', 'Bubba');
console.log(" ----- Methods can have default param values -----");
console.log(BigBubbaBlob.greet());
console.log(" ----- Passing a val to a fn param w a default val overrides the default val -----");
console.log(BigBubbaBlob.greet(true));
console.log('----------------------------------------------------------------------------------');
var GeneralProduct;
(function (GeneralProduct) {
    GeneralProduct[GeneralProduct["Food"] = 0] = "Food";
    GeneralProduct[GeneralProduct["Toys"] = 1] = "Toys";
    GeneralProduct[GeneralProduct["Electronics"] = 2] = "Electronics";
    GeneralProduct[GeneralProduct["Toiletries"] = 3] = "Toiletries";
    GeneralProduct[GeneralProduct["Medications"] = 4] = "Medications";
})(GeneralProduct || (GeneralProduct = {}));
var AmericanProduct;
(function (AmericanProduct) {
    AmericanProduct[AmericanProduct["Shotguns"] = 0] = "Shotguns";
    AmericanProduct[AmericanProduct["Revolvers"] = 1] = "Revolvers";
    AmericanProduct[AmericanProduct["Assault_Rifles"] = 2] = "Assault_Rifles";
    AmericanProduct[AmericanProduct["Semiautomatics"] = 3] = "Semiautomatics";
    AmericanProduct[AmericanProduct["Handguns"] = 4] = "Handguns";
})(AmericanProduct || (AmericanProduct = {}));
console.log('----------------------------------------------------------------------------------');
//#######################################
//#          CLASS INHERITANCE          #
//#######################################
console.log('***************** CLASS INHERITANCE *****************');
console.log(" ----- Create class that inherits from another class -----");
var WalmartGreeter = (function (_super) {
    __extends(WalmartGreeter, _super);
    function WalmartGreeter(greeting, name, product) {
        _super.call(this, greeting, name); // runs parent constructor (in class Greeter)
        this.product = product;
        console.log('Product: ', AmericanProduct[product]);
    }
    WalmartGreeter.prototype.sell = function (additionalProduct) {
        if (additionalProduct === void 0) { additionalProduct = null; }
        var product = AmericanProduct[this.product];
        console.log("What in tarnation? Looks like we got some runaway deals on " + product + "!");
        if (additionalProduct !== null) {
            console.log("And what the darn tootin' are we gonna do with all these extra savings on " +
                (AmericanProduct[additionalProduct] + "?"));
        }
    };
    WalmartGreeter.prototype.hello = function () {
        var oldHello = _super.prototype.hello.call(this, false);
        var newHello = (oldHello + " is what they say in the hoity-toity north. But this is real") +
            '\'Murica! Here we say "Hey Billy-bob, get off ma roof, Imma tryin to roll ma John Deere"';
        console.log(newHello);
        return newHello;
    };
    return WalmartGreeter;
}(Greeter));
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
var Animal = (function () {
    function Animal() {
    }
    Animal.prototype.move = function () {
        console.log('roamity roam roam roam...');
    };
    return Animal;
}());
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
var PowerStation;
(function (PowerStation) {
    PowerStation[PowerStation["Solar"] = 2] = "Solar";
    PowerStation[PowerStation["Wind"] = 3] = "Wind";
    PowerStation[PowerStation["Coal"] = 10] = "Coal";
    PowerStation[PowerStation["Oil"] = 20] = "Oil";
    PowerStation[PowerStation["Nuclear"] = 50] = "Nuclear";
    PowerStation[PowerStation["Fusion"] = 100] = "Fusion";
})(PowerStation || (PowerStation = {}));
// Define a superclass for all industrial plants
// Not instantiable
var IndustrialPlant = (function () {
    function IndustrialPlant() {
        var _this = this;
        // virtual property (essentially) - provides # of volts this plant takes to run.
        this.dailyVoltUse = function () { return (_this.squareMetres / 100); };
    }
    return IndustrialPlant;
}());
var WaterTreatmentPlant = (function (_super) {
    __extends(WaterTreatmentPlant, _super);
    function WaterTreatmentPlant(squareMetres, dailyLitres, name) {
        _super.call(this);
        this.dailyLitres = dailyLitres;
        this.name = name;
        this.storedVolts = 0;
        this.squareMetres = squareMetres;
        console.log("New water treatment plant, thy gates hath opened! I shall dub thee... " + this.name + ".");
    }
    // public API, takes request to create clean water
    WaterTreatmentPlant.prototype.processWater = function (daysOfTreatment) {
        var amountTreated = this.runTreatment(daysOfTreatment);
        console.log("WaterTreatmentPlant#processWater: amountTreated (return val): " + amountTreated + "L");
        return amountTreated;
    };
    // Increase # of storedVolts based on power station type used, and days it charged the water
    // treatment plant for. Returns total number of volts stored after charging complete.
    WaterTreatmentPlant.prototype.chargeBatteries = function (plant, daysToCharge) {
        this.storedVolts = (this.storedVolts + (plant * daysToCharge));
        return this.storedVolts;
    };
    // run the requested treatment. Determines if the full treatment can be run or not, and calls
    // treatment running methods accordingly
    WaterTreatmentPlant.prototype.runTreatment = function (daysOfTreatment) {
        var requiredVolts = this.voltsRequired(daysOfTreatment);
        return (requiredVolts <= this.storedVolts)
            ? this.runFullTreatment(requiredVolts, daysOfTreatment)
            : this.runTreatmentVoltShortage();
    };
    // run the full requested treatment (no resource shortages), return litres of water produced
    WaterTreatmentPlant.prototype.runFullTreatment = function (requiredVolts, daysOfTreatment) {
        console.log('There was enough power! yay!');
        this.storedVolts = this.storedVolts - requiredVolts;
        return this.dailyLitres * daysOfTreatment;
    };
    // run treatment until plant runs out of power, return litres of water produced
    WaterTreatmentPlant.prototype.runTreatmentVoltShortage = function () {
        console.log('Not enough power - how sad :(');
        var daysBeforeNoPower = this.storedVolts / this.dailyVoltUse();
        this.storedVolts = 0;
        return daysBeforeNoPower * this.dailyLitres;
    };
    // calculate number of stored volts required to completed the requested treatment
    WaterTreatmentPlant.prototype.voltsRequired = function (daysOfTreatment) {
        var requiredVolts = this.dailyVoltUse() * daysOfTreatment;
        console.log('requiredVolts: ', requiredVolts);
        return requiredVolts;
    };
    return WaterTreatmentPlant;
}(IndustrialPlant));
var CobourgPoosucker = new WaterTreatmentPlant(1000, 500, 'Cobourg Poosucker');
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
