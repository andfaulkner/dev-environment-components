/// <reference path="./sideEffectsTestModuleSideEffects.d.ts" />
import * as GLOBAL from 'GLOBAL';

process["sideEffect"] = "hey look a side effect!";

console["uhoh"] = "I'm logging nothing useful!";

GLOBAL.testModuleSideEffects = {
  hello: 'yoooo!',
  uhoh: 'seriously this is a bad idea',
  erm: 'no, I mean it, cut this out, this is evil shit'
};