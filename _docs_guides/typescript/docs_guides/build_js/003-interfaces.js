console.log('----------------------------------------------------------------------------------');
//######################################
//#          BASIC INTERFACES          #
//######################################
console.log('***************** BASIC INTERFACES *****************');
function printLabel(labelledObj) {
    console.log('labelledObject.label: ', labelledObj.label);
}
console.log(" ----- Function with interface -----");
printLabel({ label: 'The first label' });
console.log(" ----- Passed-in obj autodestructured to match fn args (as def by interface) -----");
var myObj = { size: 10, label: "Size 10 object!" };
printLabel(myObj);
console.log('----------------------------------------------------------------------------------');
//#######################################
//#          INLINE INTERFACES          #
//#######################################
console.log('***************** INLINE INTERFACES *****************');
console.log(" ----- Fn params basically act as an interface. In such inline interfaces, -----");
console.log(" ----- required vars must be given, but additional properties are allowed. -----");
function printMyLabel(labelledObj) {
    console.log(labelledObj.label);
}
printMyLabel({ label: 'hello label!' });
console.log(" ----- Complex inline 'return interfaces' -----");
console.log('function must return an object with the exact expected structure');
function printMyLabel2(labelledObj) {
    return {
        newLabel: 'ok',
        oldLabel: labelledObj.label
    };
}
console.log(printMyLabel2({ label: 'weeeee label!' }));
// => { newLabel: 'ok', oldLabel: 'weeeee label!' }
console.log(" ----- Can even create complex nested objects as expected return vals -----");
function printMyLabel3(labelledObj) {
    return {
        newLabelObj: {
            label: labelledObj.label + '! Oh yeah!',
            nests: 2
        },
        oldLabel: labelledObj.label
    };
}
console.log(printMyLabel3({ label: 'weeeee another label!!!!' }));
console.log(" ----- ...this gets messy quickly. This is where interfaces come in handy... -----");
console.log('----------------------------------------------------------------------------------');
//#######################################################
//#          OPTIONAL PROPERTIES ON INTERFACES          #
//#######################################################
console.log('***************** OPTIONAL PROPERTIES ON INTERFACES *****************');
// Note that the function could still be defined without having thingy in the args
function printTestInterfaceArgs(_a) {
    var name = _a.name;
    console.log(name + " is the name property on TestInterface.");
    console.log('all the arguments in printTestInterfaceArgs: ', arguments);
}
// Thingy IS defined here, 
function printTestInterfaceArgs2(_a) {
    var name = _a.name, thingy = _a.thingy;
    console.log(name + " is the name property on TestInterface. " + thingy + " is the thingy property");
    if (thingy) {
        console.log(thingy + " is the thingy property");
    }
}
console.log(" ----- fn can't be called w props not in TestInterface, since fn implements it -----");
printTestInterfaceArgs({ name: 'boogaboogaboo' });
console.log(" ----- fn CAN however be defined & called w or w/out the optional prop(s) -----");
printTestInterfaceArgs2({ name: 'boogaboogaboo', thingy: 'yep' });
console.log('----------------------------------------------------------------------------------');
//####################################
//#          OPTION 'BAGS'           #
//####################################
console.log('***************** OPTION "BAGS" *****************');
function buildShape(shape) {
    console.log(shape);
}
console.log(" ----- Can only pass options the config interface allows via an obj literal: -----");
buildShape({ color: 'red', sides: 4, width: 100 });
console.log(" ----- Unless you use a type inference (curvature isn't def in ShapeConfig): -----");
buildShape({ color: 'red', sides: 4, width: 100, curvature: true });
console.log('----------------------------------------------------------------------------------');
//####################################
//#          FUNCTION TYPES          #
//####################################
console.log('***************** FUNCTION TYPES *****************');
console.log(" ----- Use function type when def fn to ensure proper args passed & result ret -----");
var mySearch = function mySearch(source, subString) {
    var result = source.search(subString);
    if (result === -1) {
        console.log(subString + " was not found in " + source);
        return false;
    }
    console.log(subString + " was found in " + source + "! Yay!");
    return true;
};
if (mySearch('asdfasdf', 'sd')) {
    console.log('search succeeded!');
}
// ensures 2 strings are given as params, and boolean returned
console.log('----------------------------------------------------------------------------------');
//#####################################################################
//#          FUNCTION INTERFACES THAT DEF BOTH ARGS & RETURN          #
//#####################################################################
console.log('***************** FUNCTION INTERFACES THAT DEF BOTH ARGS & RETURN *****************');
var printMyLabel5 = function printMyLabel5(label) {
    return true;
};
console.log('----------------------------------------------------------------------------------');
//#######################################
//#          NESTED INTERFACES          #
//#######################################
console.log('***************** NESTED INTERFACES *****************');
console.log(" ----- NESTED INTERFACES: EXAMPLE 1: -----");
console.log(" ----- Interface for fn taking str arg & returing JS obj w a defined structure -----");
var printMyLabel6 = function printMyLabel6(label) {
    return {
        labelRes: false
    };
};
console.log(" ----- NESTED INTERFACES: EXAMPLE 2: -----");
console.log(" ----- Interface for fn taking complex object as args, returning string -----");
var printMyLabel7 = function printMyLabel7(label) {
    return { labelRes: false };
};
var genPass = function genPass(mandatory, lengths) {
    console.log("Mandatory strings: " + mandatory.toString() + "; min length: " + lengths.min + "; max length: " + lengths.max);
    return 'random example password!';
};
genPass(['a-z', 'A-Z', '0-9', '!@#$%^&'], { min: 4, max: 20 });
console.log(" ----- NESTED INTERFACES: EXAMPLE 3: -----");
console.log(" ----- Interface for fn taking complex object as args & returning complex obj -----");
var Agencies;
(function (Agencies) {
    Agencies[Agencies["police"] = 0] = "police";
    Agencies[Agencies["DEA"] = 1] = "DEA";
    Agencies[Agencies["FBI"] = 2] = "FBI";
    Agencies[Agencies["CIA"] = 3] = "CIA";
    Agencies[Agencies["NSA"] = 4] = "NSA";
})(Agencies || (Agencies = {}));
var genPass2 = (function (mandatory, lengths) { return ({
    strength: {
        encryptable: false,
        bruteForce: [
            { machinePower: '100mhz', avMsToCrack: 10000 },
            { machinePower: '10ghz', avMsToCrack: 100 }
        ],
        passesAtAgencies: [Agencies.police, Agencies.DEA, Agencies.CIA]
    },
    examples: ['anrner3ne!', 'mn4jn#nu4()', 'vmire#HU8e34h'],
    avMsToGenerate: 20,
    allMandatory: mandatory.reduce((function (total, item) { return '' + total + item; }), '')
}); });
console.log(" ----- Interfaces can handle any lvl of nesting. e.g. below used an interface: -----");
console.log(genPass2(['1234567890', 'a-zA-Z', '(#$*'], { min: 5, max: 10 }));
console.log('----------------------------------------------------------------------------------');
//##########################################
//#          INDEXABLE INTERFACES          #
//##########################################
console.log('***************** INDEXABLE INTERFACES *****************');
// with indexable props, items from within a property can be grabbed using vars of a given type
// E.g.: using numbers. E.g. 2: using strings
// Why? For example, a property with an index of type 'number' could store either a string or an
// array of strings, because both types can have string data retrieved using a numeric index.
console.log(" ----- INDEXABLE INTERFACES: EXAMPLE 1: NUMERIC INDEX -----");
var myArray = ["Bob", "Fred", "Joe"];
console.log('myArray - using interface StringArray: ', myArray); // => ["Bob", "Fred", "Joe"]
var myStr = myArray[0];
console.log('myStr - index from myArray: ', myStr); // => "Bob"
var myLetterClump = "BobFredJoe";
console.log('myLetterClump - using interface StringArray: ', myLetterClump); // => "BobFredJoe"
var myChar = myLetterClump[0];
console.log('myChar - index from myLetterClump: ', myChar); // => "B"
console.log(" ----- INDEXABLE INTERFACES: EXAMPLE 2: STRING INDEX -----");
var dict = { name: 'Smokey', bearType: 'Forest Fire Preventer Bear' };
console.log(dict);
