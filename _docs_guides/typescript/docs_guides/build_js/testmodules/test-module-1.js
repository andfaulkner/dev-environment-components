"use strict";
exports.testExportString = 'testExportString successfully imported!';
exports.testExportFunction = function (randomString) {
    var out = "testExportFunction is running! You gave it an arg with value: " + randomString + ".";
    console.log(out);
    return out;
};
