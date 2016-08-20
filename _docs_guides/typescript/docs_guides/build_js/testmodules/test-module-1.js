"use strict";
function __export(m) {
    for (var p in m) if (!exports.hasOwnProperty(p)) exports[p] = m[p];
}
exports.testExportString = 'testExportString successfully imported!';
exports.testExportFunction = (randomString) => {
    let out = `testExportFunction is running! You gave it an arg with value: ${randomString}.`;
    console.log(out);
    return out;
};
console.log('----------------------------------------------------------------------------------');
//#############################
//#          EXPORTS          #
//#############################
console.log('***************** EXPORTS *****************');
console.log(" ----- Export interface for outside consumption -----");
;
console.log(" ----- Export a constant for outside consumption -----");
exports.numberRegexp = /^[0-9]+$/;
console.log(" ----- Export class for outside consumption -----");
class ZipCodeValidator {
    isAcceptable(s) {
        return s.length === 5 && exports.numberRegexp.test(s); // note that exported items still internally usable
    }
}
exports.ZipCodeValidator = ZipCodeValidator;
;
console.log('----------------------------------------------------------------------------------');
//#######################################
//#          EXPORT STATEMENTS          #
//#######################################
console.log('***************** EXPORT STATEMENTS *****************');
console.log(" ----- Export something declared earlier with an export statement -----");
var MugColors;
(function (MugColors) {
    MugColors[MugColors["White"] = 0] = "White";
    MugColors[MugColors["Red"] = 1] = "Red";
    MugColors[MugColors["Green"] = 2] = "Green";
    MugColors[MugColors["Black"] = 3] = "Black";
    MugColors[MugColors["Gold"] = 4] = "Gold";
    MugColors[MugColors["Gray"] = 5] = "Gray";
})(MugColors || (MugColors = {}));
exports.MugColors = MugColors;
;
console.log(" ----- Export enum declared earlier -----");
console.log(" ----- Export class declared earlier, with a different name for the export -----");
class Mug {
    constructor(color, isFull) {
        this.color = color;
        this.isFull = isFull;
    }
}
exports.MyCup = Mug;
console.log('----------------------------------------------------------------------------------');
//################################
//#          RE-EXPORTS          #
//################################
console.log('***************** RE-EXPORTS *****************');
console.log(" ----- Import something then immediately export it -----");
var test_imports_exports_modules_2_1 = require("./test-imports-exports-modules-2");
exports.Package = test_imports_exports_modules_2_1.Parcel;
console.log(" ----- Import all items from another module, then immediately re-export them -----");
__export(require("./test-imports-exports-modules-3"));
console.log('----------------------------------------------------------------------------------');
//#######################################################################
//#          NON-INSTRUCTIVE: SAMPLE EXPORTS FOR USE ELSEWHERE          #
//#######################################################################
console.log('***************** NON-INSTRUCTIVE: SAMPLE EXPORTS FOR USE ELSEWHERE *****************');
function myNewFn() {
    console.log('my new fn!');
}
exports.myNewFn = myNewFn;
function yetAnotherFn() {
    console.log('yet another function :(');
}
exports.yetAnotherFn = yetAnotherFn;
;
class AnotherTestClass {
    constructor(name) {
        this.name = name;
    }
}
exports.AnotherTestClass = AnotherTestClass;
exports.BIG_UUID = 12981290482093482342;
class Someone {
    constructor(id, firstName, lastName) {
        this.id = id;
        this.fullName = firstName + " " + lastName;
    }
}
exports.Someone = Someone;
