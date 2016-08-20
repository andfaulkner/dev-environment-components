"use strict";
/// <reference path="./sideEffectsTestModuleSideEffects.d.ts" />
const GLOBAL = require('GLOBAL');
process["sideEffect"] = "hey look a side effect!";
console["uhoh"] = "I'm logging nothing useful!";
GLOBAL.testModuleSideEffects = {
    hello: 'yoooo!',
    uhoh: 'seriously this is a bad idea',
    erm: 'no, I mean it, cut this out, this is evil shit'
};
