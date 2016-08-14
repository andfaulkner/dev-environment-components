"use strict";
exports.testExportString = 'testExportString successfully imported!';
exports.testExportFunction = (randomString) => {
    let out = `testExportFunction is running! You gave it an arg with value: ${randomString}.`;
    console.log(out);
    return out;
};
