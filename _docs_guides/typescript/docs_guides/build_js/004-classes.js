/// <reference path="../../typings/lodash/lodash.d.ts" />
"use strict";
var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
var _ = require("lodash");
var cLog = console.log;
cLog('----------------------------------------------------------------------------------');
//###################################
//#          BASIC CLASSES          #
//###################################
cLog('***************** BASIC CLASSES *****************');
var Greeter = (function () {
    // CONSTRUCTOR
    function Greeter(greeting, name) {
        this.greeting = greeting;
        this.name = name;
        cLog("Created new Greeter. Name: " + this.name + ". Unique greeting: " + this.greeting + ".");
    }
    // METHODS
    Greeter.prototype.greet = function (doUseName) {
        if (doUseName === void 0) { doUseName = false; }
        var greeting = "Hello, " + this.greeting + (doUseName ? (', my name is ' + this.name) : '') + "!";
        cLog("Greeting returned from greet method on Greeter instance:\n    " + greeting);
        return greeting;
    };
    Greeter.prototype.hello = function (doLog) {
        if (doLog === void 0) { doLog = true; }
        if (doLog) {
            cLog('hello');
        }
        return 'hello';
    };
    return Greeter;
}());
cLog(" ----- Classes can have constructors w/ typed params. To assign val of an arg -----");
cLog(" ----- given to constructor->the instance, prop must be defined on the class. -----");
var BigBubbaBlob = new Greeter('aloha', 'Bubba');
cLog(" ----- Methods can have default param values -----");
cLog(BigBubbaBlob.greet());
cLog(" ----- Passing a val to a fn param w a default val overrides the default val -----");
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
cLog(" ----- Create class that inherits from another class -----");
var WalmartGreeter = (function (_super) {
    __extends(WalmartGreeter, _super);
    function WalmartGreeter(greeting, name, product) {
        _super.call(this, greeting, name); // runs parent constructor (in class Greeter)
        this.product = product;
        cLog('Product: ', AmericanProduct[product]);
    }
    WalmartGreeter.prototype.sell = function (additionalProduct) {
        if (additionalProduct === void 0) { additionalProduct = null; }
        var product = AmericanProduct[this.product];
        cLog("What in tarnation? Looks like we got some runaway deals on " + product + "!");
        if (additionalProduct !== null) {
            cLog("And what the darn tootin' are we gonna do with all these extra savings on " +
                (AmericanProduct[additionalProduct] + "?"));
        }
    };
    WalmartGreeter.prototype.hello = function () {
        var oldHello = _super.prototype.hello.call(this, false);
        var newHello = (oldHello + " is what they say in the hoity-toity north. But this is real") +
            '\'Murica! Here we say "Hey Billy-bob, get off ma roof, Imma tryin to roll ma John Deere"';
        cLog(newHello);
        return newHello;
    };
    return WalmartGreeter;
}(Greeter));
cLog(" ----- Instantiate new child (inheriting) class: -----");
var jimBob = new WalmartGreeter('yo homie', 'Jim Bob', AmericanProduct.Revolvers);
cLog(" ----- Call instance method on child class from new (child) instance -----");
jimBob.sell(AmericanProduct.Shotguns);
cLog(" ----- Call instance method on original parent class from new (child) instance -----");
jimBob.greet();
cLog(" ----- Call parent class-overriding instance method on child class -----");
cLog(" ----- Note that the overriding method calls the parent method (calls super) -----");
jimBob.hello();
cLog('----------------------------------------------------------------------------------');
//#########################################
//#          GETTERS AND SETTERS          #
//#########################################
cLog('***************** GETTERS AND SETTERS *****************');
cLog(" ----- Def 'chest of marbles' class where marbles are viewed & added via get & set -----");
var ChestOfMarbles = (function () {
    function ChestOfMarbles(_name) {
        this._name = _name;
        this._marbles = [];
        this._verbose = false;
    }
    ;
    Object.defineProperty(ChestOfMarbles.prototype, "marbleQuantity", {
        get: function () {
            this._log('marbleQuantity: ', this._name + " contains " + this._marbles.length + " marbles.");
            return this._marbles.length;
        },
        enumerable: true,
        configurable: true
    });
    ;
    Object.defineProperty(ChestOfMarbles.prototype, "latestMarble", {
        get: function () {
            this._log('get latestMarble:', 'Most recently added marble:', (this._latestMarble) ? this._latestMarble : ' null');
            return this._latestMarble;
        },
        set: function (marble) {
            this._marbles = this._marbles.concat(marble);
            this._latestMarble = marble;
            this._log('set latestMarble: ', "New marble added to " + this._name + "!");
        },
        enumerable: true,
        configurable: true
    });
    ;
    ;
    Object.defineProperty(ChestOfMarbles.prototype, "verbose", {
        set: function (isVerbose) {
            if (this._verbose !== isVerbose) {
                this._verbose = isVerbose;
                if (this._verbose) {
                    cLog("* " + this._name + " now has verbose mode set to on. All actions will be logged.");
                }
                else {
                    cLog("* " + this._name + " now has verbose mode set to off. No actions will be logged.");
                }
            }
        },
        enumerable: true,
        configurable: true
    });
    ChestOfMarbles.prototype._log = function (msg, obj1, obj2) {
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
    };
    return ChestOfMarbles;
}());
cLog(" ----- Instantiate a (empty to start) chest of marbles, put in var marbleBox -----");
var marbleBox = new ChestOfMarbles('Johnny the Marble Box');
cLog(" ----- Get # of marbles inside & the most recent added. Should be 0 & undefined. -----");
cLog(marbleBox.marbleQuantity);
cLog(marbleBox.latestMarble);
cLog(" ----- Add a marble to marbleBox. -----");
marbleBox.latestMarble = { color: 'red', age: 10, material: 'glass' };
cLog(" ----- No log the that marble was added because verbose prop on ChestOfMarbles defaults to false -----");
cLog(" ----- Get # of marbles. We just added 1 & instance was empty before, so it should return 1 -----");
cLog(marbleBox.marbleQuantity);
cLog(" ----- Get most recently added marble, i.e. the one we just set. -----");
cLog(marbleBox.latestMarble);
cLog(" ----- Set marbleBox.verbose to true -----");
marbleBox.verbose = true;
cLog(" ----- Add marble to marbleBox. Action gets logged since marbleBox.verbose === true now -----");
marbleBox.latestMarble = { color: 'green', age: 2, material: 'wood' };
cLog(" ----- Get # of marbles. Should be 2 this time. Should also log that you requested this. -----");
cLog(marbleBox.marbleQuantity);
cLog(" ----- Get most recently added marble. Should also log that you requested this. -----");
cLog(marbleBox.latestMarble);
cLog('----------------------------------------------------------------------------------');
//######################################
//#          ABSTRACT CLASSES          #
//######################################
cLog('***************** ABSTRACT CLASSES *****************');
cLog(" -- Uninstantiable base classes to derive other classes from (Note that a class derived");
cLog("    from an abstract class is instantiable - only abstract classes themselves are not)");
cLog('***************** ABSTRACT METHODS *****************');
cLog(" -- Only available in abstract classes");
cLog(" -- Methods marked abstract must have no implementation: that is provided by");
cLog(" -- subclasses. However, you can declare the yet-unimplemented method's type info.");
cLog(" ----- Create an abstract class with an abstract method & an implmented method -----");
var Animal = (function () {
    function Animal() {
    }
    Animal.prototype.move = function () {
        cLog('roamity roam roam roam...');
    };
    return Animal;
}());
cLog(" ----- Examine the var the abstract class object is assigned to: -----");
cLog('abstract class Animal is a function: ', Animal instanceof Function);
cLog('Note that abstract class Animal is an empty fn @ runtime: ', Animal);
cLog(" ----- See below (in public, protected, private section) for a larger example -----");
cLog('----------------------------------------------------------------------------------');
//################################################
//#          PUBLIC, PROTECTED, PRIVATE          #
//################################################
cLog('***************** PUBLIC, PROTECTED, PRIVATE *****************');
cLog("-- Almost the same as in Java.");
cLog("-- Note that methods & properties are public by default.");
cLog("-- Public & protected (but not private) members are accessable in derived classes.");
cLog("-- Public (but not protected & private) members are accessible outside the class");
cLog(" ----- EXAMPLE USE OF PUBLIC, PROTECTED, PRIVATE MODIFIERS -----");
cLog(" ----- Access modifiers on constructor args auto-assigns them to the instance -----");
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
        cLog("New water treatment plant, thy gates hath opened! I shall dub thee... " + this.name + ".");
    }
    // public API, takes request to create clean water
    WaterTreatmentPlant.prototype.processWater = function (daysOfTreatment) {
        var amountTreated = this.runTreatment(daysOfTreatment);
        cLog("WaterTreatmentPlant#processWater: amountTreated (return val): " + amountTreated + "L");
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
        cLog('There was enough power! yay!');
        this.storedVolts = this.storedVolts - requiredVolts;
        return this.dailyLitres * daysOfTreatment;
    };
    // run treatment until plant runs out of power, return litres of water produced
    WaterTreatmentPlant.prototype.runTreatmentVoltShortage = function () {
        cLog('Not enough power - how sad :(');
        var daysBeforeNoPower = this.storedVolts / this.dailyVoltUse();
        this.storedVolts = 0;
        return daysBeforeNoPower * this.dailyLitres;
    };
    // calculate number of stored volts required to completed the requested treatment
    WaterTreatmentPlant.prototype.voltsRequired = function (daysOfTreatment) {
        var requiredVolts = this.dailyVoltUse() * daysOfTreatment;
        cLog('requiredVolts: ', requiredVolts);
        return requiredVolts;
    };
    return WaterTreatmentPlant;
}(IndustrialPlant));
var CobourgPoosucker = new WaterTreatmentPlant(1000, 500, 'Cobourg Poosucker');
cLog(" ----- Should make no water since we haven't charged the plant yet. -----");
CobourgPoosucker.processWater(4);
cLog(" ----- Uses public api to charge plant. Gives not quite enough power to do the full order. -----");
CobourgPoosucker.chargeBatteries(PowerStation.Oil, 1);
cLog(" ----- Now has enough volts to produce some (but not all req) water if order run again -----");
CobourgPoosucker.processWater(4);
cLog(" ----- View leftover voltage stored via public accessor, should be 0 -----");
cLog(CobourgPoosucker.storedVolts);
cLog(" ----- We use the public api to charge the plant, with enough power this time... -----");
CobourgPoosucker.chargeBatteries(PowerStation.Fusion, 1);
cLog(" ----- Now when we run it again there's enough power to produce the whole order -----");
CobourgPoosucker.processWater(6);
cLog(" ----- View leftover voltage stored via public accessor again, should be 40 this time: -----");
cLog(CobourgPoosucker.storedVolts);
console.log('----------------------------------------------------------------------------------');
//#######################################
//#          STATIC PROPERTIES          #
//#######################################
console.log('***************** STATIC PROPERTIES *****************');
// Static properties are accessible from all instances of a class.
console.log(" ----- Define a class with static properties -----");
var BandType;
(function (BandType) {
    BandType[BandType["AM"] = 0] = "AM";
    BandType[BandType["FM"] = 1] = "FM";
})(BandType || (BandType = {}));
var allFmChannelFreqs = _.range(87.5, 108.0, 0.2).map(function (num) { return _.round(num, 1); });
var RadioStation = (function () {
    // constructor.
    // Note: if no 'band' is provided, 1 is picked at random from remaining available frequency bands
    function RadioStation(name, band) {
        if (band === void 0) { band = RadioStation.randomFreeBand(); }
        this.registerBand(RadioStation.isBandUsable(band) ? band : RadioStation.randomFreeBand());
    }
    Object.defineProperty(RadioStation, "numBandsFree", {
        // static getters for static (class) properties
        get: function () {
            return RadioStation.freeBands.length;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(RadioStation, "numBandsTaken", {
        get: function () {
            return RadioStation.takenBands.length;
        },
        enumerable: true,
        configurable: true
    });
    // private instance method
    RadioStation.prototype.registerBand = function (band) {
        this.broadcastBand = band;
        RadioStation.takenBands.push(_.pull(RadioStation.freeBands, band)[0]);
    };
    // static (class) properties with default values assigned via property initializers
    RadioStation.freeBands = _.range(87.5, 108.0, 0.2).map(function (num) { return _.round(num, 1); });
    RadioStation.takenBands = [];
    // static (class) properties with value assigned via a property initializer
    RadioStation.LEGAL_BANDS = Object.freeze(_.range(87.5, 108.0, 0.2)
        .map(function (num) { return _.round(num, 1); }));
    // static (class) functions
    RadioStation.randomFreeBand = function () { return _.sample(RadioStation.freeBands); };
    RadioStation.isBandUsable = function (freq) { return _.includes(RadioStation.freeBands, freq); };
    return RadioStation;
}());
console.log(" ----- Initial values of class RadioStation's static props before any instantiated -----");
console.log('RadioStation.takenBands:       ', RadioStation.takenBands);
console.log('RadioStation.freeBands.length: ', RadioStation.freeBands.length);
console.log('RadioStation.numBandsFree:     ', RadioStation.numBandsFree);
console.log(" ----- RadioStation instantiated, creating station nothinButTheHits -----");
var nothinButThaHits = new RadioStation('Nothin\' But Tha Hitz', 91.1);
console.log(" ----- Values of class RadioStation's static props after 1 instantiated -----");
console.log('RadioStation.takenBands:       ', RadioStation.takenBands);
console.log('RadioStation.freeBands.length: ', RadioStation.freeBands.length);
console.log('RadioStation.numBandsFree:     ', RadioStation.numBandsFree);
