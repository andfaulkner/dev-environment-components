/// <reference path="../../typings/lodash/lodash.d.ts" />
"use strict";
const _ = require('lodash');
let cLog = console.log;
cLog('----------------------------------------------------------------------------------');
//###################################
//#          BASIC CLASSES          #
//###################################
cLog('***************** BASIC CLASSES *****************');
class Greeter {
    // CONSTRUCTOR
    constructor(greeting, name) {
        this.greeting = greeting;
        this.name = name;
        cLog(`Created new Greeter. Name: ${this.name}. Unique greeting: ${this.greeting}.`);
    }
    // METHODS
    greet(doUseName = false) {
        let greeting = `Hello, ${this.greeting}${(doUseName ? (', my name is ' + this.name) : '')}!`;
        cLog(`Greeting returned from greet method on Greeter instance:\n    ${greeting}`);
        return greeting;
    }
    hello(doLog = true) {
        if (doLog) {
            cLog('hello');
        }
        return 'hello';
    }
}
cLog(' ----- Classes can have constructors w/ typed params. To assign val of an arg -----');
cLog(' ----- given to constructor->the instance, prop must be defined on the class. -----');
let BigBubbaBlob = new Greeter('aloha', 'Bubba');
cLog(' ----- Methods can have default param values -----');
cLog(BigBubbaBlob.greet());
cLog(' ----- Passing a val to a fn param w a default val overrides the default val -----');
cLog(BigBubbaBlob.greet(true));
cLog('----------------------------------------------------------------------------------');
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
cLog('----------------------------------------------------------------------------------');
//#######################################
//#          CLASS INHERITANCE          #
//#######################################
cLog('***************** CLASS INHERITANCE *****************');
cLog(' ----- Create class that inherits from another class -----');
class WalmartGreeter extends Greeter {
    constructor(greeting, name, product) {
        super(greeting, name); // runs parent constructor (in class Greeter)
        this.product = product;
        cLog('Product: ', AmericanProduct[product]);
    }
    sell(additionalProduct = null) {
        let product = AmericanProduct[this.product];
        cLog(`What in tarnation? Looks like we got some runaway deals on ${product}!`);
        if (additionalProduct !== null) {
            cLog("And what the darn tootin' are we gonna do with all these extra savings on " +
                `${AmericanProduct[additionalProduct]}?`);
        }
    }
    hello() {
        let oldHello = super.hello(false);
        let newHello = `${oldHello} is what they say in the hoity-toity north. But this is real` +
            '\'Murica! Here we say "Hey Billy-bob, get off ma roof, Imma tryin to roll ma John Deere"';
        cLog(newHello);
        return newHello;
    }
}
cLog(' ----- Instantiate new child (inheriting) class: -----');
let jimBob = new WalmartGreeter('yo homie', 'Jim Bob', AmericanProduct.Revolvers);
cLog(' ----- Call instance method on child class from new (child) instance -----');
jimBob.sell(AmericanProduct.Shotguns);
cLog(' ----- Call instance method on original parent class from new (child) instance -----');
jimBob.greet();
cLog(' ----- Call parent class-overriding instance method on child class -----');
cLog(' ----- Note that the overriding method calls the parent method (calls super) -----');
jimBob.hello();
cLog('----------------------------------------------------------------------------------');
//#########################################
//#          GETTERS AND SETTERS          #
//#########################################
cLog('***************** GETTERS AND SETTERS *****************');
cLog(" ----- Def 'chest of marbles' class where marbles are viewed & added via get & set -----");
class ChestOfMarbles {
    constructor(_name) {
        this._name = _name;
        this._marbles = [];
        this._verbose = false;
    }
    ;
    get marbleQuantity() {
        this._log('marbleQuantity: ', `${this._name} contains ${this._marbles.length} marbles.`);
        return this._marbles.length;
    }
    ;
    set latestMarble(marble) {
        this._marbles = this._marbles.concat(marble);
        this._latestMarble = marble;
        this._log('set latestMarble: ', `New marble added to ${this._name}!`);
    }
    ;
    get latestMarble() {
        this._log('get latestMarble:', 'Most recently added marble:', (this._latestMarble) ? this._latestMarble : ' null');
        return this._latestMarble;
    }
    ;
    set verbose(isVerbose) {
        if (this._verbose !== isVerbose) {
            this._verbose = isVerbose;
            if (this._verbose) {
                cLog(`* ${this._name} now has verbose mode set to on. All actions will be logged.`);
            }
            else {
                cLog(`* ${this._name} now has verbose mode set to off. No actions will be logged.`);
            }
        }
    }
    _log(msg, obj1, obj2) {
        if (!this._verbose) {
            return;
        }
        if (obj2) {
            cLog(msg, obj1, obj2);
        }
        else if (obj1) {
            cLog(msg, obj1);
        }
        else {
            cLog(msg);
        }
    }
}
cLog(' ----- Instantiate a (empty to start) chest of marbles, put in var marbleBox -----');
let marbleBox = new ChestOfMarbles('Johnny the Marble Box');
cLog(' ----- Get # of marbles inside & the most recent added. Should be 0 & undefined. -----');
cLog(marbleBox.marbleQuantity);
cLog(marbleBox.latestMarble);
cLog(' ----- Add a marble to marbleBox. -----');
marbleBox.latestMarble = { color: 'red', age: 10, material: 'glass' };
cLog(' ----- No log the that marble was added because verbose prop on ChestOfMarbles defaults to false -----');
cLog(' ----- Get # of marbles. We just added 1 & instance was empty before, so it should return 1 -----');
cLog(marbleBox.marbleQuantity);
cLog(' ----- Get most recently added marble, i.e. the one we just set. -----');
cLog(marbleBox.latestMarble);
cLog(' ----- Set marbleBox.verbose to true -----');
marbleBox.verbose = true;
cLog(' ----- Add marble to marbleBox. Action gets logged since marbleBox.verbose === true now -----');
marbleBox.latestMarble = { color: 'green', age: 2, material: 'wood' };
cLog(' ----- Get # of marbles. Should be 2 this time. Should also log that you requested this. -----');
cLog(marbleBox.marbleQuantity);
cLog(' ----- Get most recently added marble. Should also log that you requested this. -----');
cLog(marbleBox.latestMarble);
cLog('----------------------------------------------------------------------------------');
//######################################
//#          ABSTRACT CLASSES          #
//######################################
cLog('***************** ABSTRACT CLASSES *****************');
cLog(' -- Uninstantiable base classes to derive other classes from (Note that a class derived');
cLog('    from an abstract class is instantiable - only abstract classes themselves are not)');
cLog('***************** ABSTRACT METHODS *****************');
cLog(' -- Only available in abstract classes');
cLog(' -- Methods marked abstract must have no implementation: that is provided by');
cLog(" -- subclasses. However, you can declare the yet-unimplemented method's type info.");
cLog(' ----- Create an abstract class with an abstract method & an implmented method -----');
class Animal {
    move() {
        cLog('roamity roam roam roam...');
    }
}
cLog(' ----- Examine the var the abstract class object is assigned to: -----');
cLog('abstract class Animal is a function: ', Animal instanceof Function);
cLog('Note that abstract class Animal is an empty fn @ runtime: ', Animal);
cLog(' ----- See below (in public, protected, private section) for a larger example -----');
cLog('----------------------------------------------------------------------------------');
//################################################
//#          PUBLIC, PROTECTED, PRIVATE          #
//################################################
cLog('***************** PUBLIC, PROTECTED, PRIVATE *****************');
cLog('-- Almost the same as in Java.');
cLog('-- Note that methods & properties are public by default.');
cLog('-- Public & protected (but not private) members are accessable in derived classes.');
cLog('-- Public (but not protected & private) members are accessible outside the class');
cLog(' ----- EXAMPLE USE OF PUBLIC, PROTECTED, PRIVATE MODIFIERS -----');
cLog(' ----- Access modifiers on constructor args auto-assigns them to the instance -----');
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
class IndustrialPlant {
    constructor() {
        // virtual property (essentially) - provides # of volts this plant takes to run.
        this.dailyVoltUse = () => (this.squareMetres / 100);
    }
}
class WaterTreatmentPlant extends IndustrialPlant {
    constructor(squareMetres, dailyLitres, name) {
        super();
        this.dailyLitres = dailyLitres;
        this.name = name;
        this.storedVolts = 0;
        this.squareMetres = squareMetres;
        cLog(`New water treatment plant, thy gates hath opened! I shall dub thee... ${this.name}.`);
    }
    // public API, takes request to create clean water
    processWater(daysOfTreatment) {
        let amountTreated = this.runTreatment(daysOfTreatment);
        cLog(`WaterTreatmentPlant#processWater: amountTreated (return val): ${amountTreated}L`);
        return amountTreated;
    }
    // Increase # of storedVolts based on power station type used, and days it charged the water
    // treatment plant for. Returns total number of volts stored after charging complete.
    chargeBatteries(plant, daysToCharge) {
        this.storedVolts = (this.storedVolts + (plant * daysToCharge));
        return this.storedVolts;
    }
    // run the requested treatment. Determines if the full treatment can be run or not, and calls
    // treatment running methods accordingly
    runTreatment(daysOfTreatment) {
        let requiredVolts = this.voltsRequired(daysOfTreatment);
        return (requiredVolts <= this.storedVolts)
            ? this.runFullTreatment(requiredVolts, daysOfTreatment)
            : this.runTreatmentVoltShortage();
    }
    // run the full requested treatment (no resource shortages), return litres of water produced
    runFullTreatment(requiredVolts, daysOfTreatment) {
        cLog('There was enough power! yay!');
        this.storedVolts = this.storedVolts - requiredVolts;
        return this.dailyLitres * daysOfTreatment;
    }
    // run treatment until plant runs out of power, return litres of water produced
    runTreatmentVoltShortage() {
        cLog('Not enough power - how sad :(');
        let daysBeforeNoPower = this.storedVolts / this.dailyVoltUse();
        this.storedVolts = 0;
        return daysBeforeNoPower * this.dailyLitres;
    }
    // calculate number of stored volts required to completed the requested treatment
    voltsRequired(daysOfTreatment) {
        let requiredVolts = this.dailyVoltUse() * daysOfTreatment;
        cLog('requiredVolts: ', requiredVolts);
        return requiredVolts;
    }
}
let CobourgPoosucker = new WaterTreatmentPlant(1000, 500, 'Cobourg Poosucker');
cLog(" ----- Should make no water since we haven't charged the plant yet. -----");
CobourgPoosucker.processWater(4);
cLog(' ----- Uses public api to charge plant. Gives not quite enough power to do the full order. -----');
CobourgPoosucker.chargeBatteries(PowerStation.Oil, 1);
cLog(' ----- Now has enough volts to produce some (but not all req) water if order run again -----');
CobourgPoosucker.processWater(4);
cLog(' ----- View leftover voltage stored via public accessor, should be 0 -----');
cLog(CobourgPoosucker.storedVolts);
cLog(' ----- We use the public api to charge the plant, with enough power this time... -----');
CobourgPoosucker.chargeBatteries(PowerStation.Fusion, 1);
cLog(" ----- Now when we run it again there's enough power to produce the whole order -----");
CobourgPoosucker.processWater(6);
cLog(' ----- View leftover voltage stored via public accessor again, should be 40 this time: -----');
cLog(CobourgPoosucker.storedVolts);
console.log('----------------------------------------------------------------------------------');
//#######################################
//#          STATIC PROPERTIES          #
//#######################################
console.log('***************** STATIC PROPERTIES *****************');
// Static properties are accessible from all instances of a class.
console.log(' ----- Define a class with static properties -----');
class RadioStation {
    // @constructor
    // Note: if 'band' val not given, 1 is picked at random from remaining available frequency bands
    constructor(name, band = RadioStation.randomFreeBand()) {
        this.name = name;
        this.registerBand(RadioStation.isBandUsable(band) ? band : RadioStation.randomFreeBand());
    }
    // static (class) getter returning the number of legal frequency bands still available
    static get numBandsFree() {
        return RadioStation.freeBands.length;
    }
    // static (class) getter returning the number of frequency bands so far registered
    static get numBandsTaken() {
        return RadioStation.takenBands.length;
    }
    // private instance method. Registers a frequency band to this station (instance).
    registerBand(band) {
        this.broadcastBand = band;
        RadioStation.takenBands.push(_.pull(RadioStation.freeBands, band)[0]);
    }
}
// static (class) properties with default values assigned via property initializers
RadioStation.freeBands = _.range(87.5, 108.0, 0.2).map(num => _.round(num, 1));
RadioStation.takenBands = [];
// static (class) properties with value assigned via a property initializer
RadioStation.LEGAL_BANDS = Object.freeze(_.range(87.5, 108.0, 0.2)
    .map(num => _.round(num, 1)));
// static (class) functions
RadioStation.randomFreeBand = () => _.sample(RadioStation.freeBands);
RadioStation.isBandUsable = (freq) => _.includes(RadioStation.freeBands, freq);
console.log(" ----- Initial values of class RadioStation's static props before any instantiated -----");
console.log('RadioStation.takenBands:       ', RadioStation.takenBands);
console.log('RadioStation.freeBands.length: ', RadioStation.freeBands.length);
console.log('RadioStation.numBandsFree:     ', RadioStation.numBandsFree);
console.log(' ----- RadioStation instantiated, creating station nothinButTheHits -----');
let nothinButThaHits = new RadioStation('Nothin\' But Tha Hitz', 91.1);
console.log(" ----- Values of class RadioStation's static props after 1 instantiated -----");
console.log('RadioStation.takenBands:       ', RadioStation.takenBands);
console.log('RadioStation.freeBands.length: ', RadioStation.freeBands.length);
console.log('RadioStation.numBandsFree:     ', RadioStation.numBandsFree);
console.log('----------------------------------------------------------------------------------');
//#################################################
//#          USE A CLASS AS AN INTERFACE          #
//#################################################
console.log('***************** USE A CLASS AS AN INTERFACE *****************');
console.log(' ----- Define class to be used as interface -----');
class Point2D {
}
console.log(" ----- Define interface 'extending' class being used as interface -----");
console.log(' ----- Use the interface extending the class normally (used on class methods) -----');
class Vector3D {
    constructor(startPoint, endPoint) {
        this.startPoint = startPoint;
        this.endPoint = endPoint;
        this.calcVectLength = (p1, p2) => (Math.sqrt(Math.abs(p1.x - p2.x) ^ 2 + Math.abs(p1.y - p2.y) ^ 2 + Math.abs(p1.z - p2.z) ^ 2));
        this.vectLength = this.calcVectLength(startPoint, endPoint);
    }
}
let vect = new Vector3D({ x: 0, y: 0, z: 0 }, { x: 1, y: 1, z: 1 });
console.log(vect.vectLength);
console.log(' ----- Note: interfaces that extend classes may have questionable utility -----');
