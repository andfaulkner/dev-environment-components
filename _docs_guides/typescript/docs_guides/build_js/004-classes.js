var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
console.log('hey!');
console.log('----------------------------------------------------------------------------------');
//###################################
//#          BASIC CLASSES          #
//###################################
console.log('***************** BASIC CLASSES *****************');
var Greeter = (function () {
    function Greeter(greeting, name) {
        this.greeting = greeting;
        this.name = name;
        console.log("Created new Greeter. Name: " + this.name + ". Unique greeting: " + this.greeting + ".");
    }
    Greeter.prototype.greet = function (doUseName) {
        if (doUseName === void 0) { doUseName = false; }
        return "Hello, " + this.greeting + (doUseName ? (', my name is ' + this.name) : '') + "!";
    };
    return Greeter;
}());
console.log(" ----- Classes can have constructors w/ typed params. To assign val of an arg -----");
console.log(" ----- given to constructor->the instance, prop must be defined on the class. -----");
var BigBubbaBlob = new Greeter('aloha', 'Bubba');
console.log(" ----- Methods can have default param values -----");
console.log(BigBubbaBlob.greet());
console.log(" ----- Passing a val to the fn param w the default val overrides the default -----");
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
// Product = AmericanProduct
console.log('***************** CLASS INHERITANCE *****************');
var WalmartGreeter = (function (_super) {
    __extends(WalmartGreeter, _super);
    function WalmartGreeter(greeting, name, product) {
        _super.call(this, greeting, name);
        console.log('Product: ', AmericanProduct[product]);
    }
    return WalmartGreeter;
}(Greeter));
new WalmartGreeter('yo homie', 'Jim Bob', AmericanProduct.Revolvers);
