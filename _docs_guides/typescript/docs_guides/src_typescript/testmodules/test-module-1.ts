export const testExportString: string = 'testExportString successfully imported!';

export var testExportFunction = (randomString: string) : string => {
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
export interface StringValidator {
  isAcceptable(s: string): boolean;
};

console.log(" ----- Export a constant for outside consumption -----");
export const numberRegexp = /^[0-9]+$/;

console.log(" ----- Export class for outside consumption -----");
export class ZipCodeValidator implements StringValidator {
  isAcceptable(s: string) {
    return s.length === 5 && numberRegexp.test(s); // note that exported items still internally usable
  }
};


console.log('----------------------------------------------------------------------------------');
//#######################################
//#          EXPORT STATEMENTS          #
//#######################################
console.log('***************** EXPORT STATEMENTS *****************');
console.log(" ----- Export something declared earlier with an export statement -----");

enum MugColors {
  White,
  Red,
  Green,
  Black,
  Gold,
  Gray
};

console.log(" ----- Export enum declared earlier -----");
export { MugColors };

console.log(" ----- Export class declared earlier, with a different name for the export -----");
class Mug {
  constructor(public color: MugColors, public isFull: boolean) { }
}

export { Mug as MyCup };


console.log('----------------------------------------------------------------------------------');
//################################
//#          RE-EXPORTS          #
//################################
console.log('***************** RE-EXPORTS *****************');

console.log(" ----- Import something then immediately export it -----");
export {Parcel as Package} from "./test-imports-exports-modules-2";

console.log(" ----- Import all items from another module, then immediately re-export them -----");
export * from "./test-imports-exports-modules-3";



console.log('----------------------------------------------------------------------------------');
//#######################################################################
//#          NON-INSTRUCTIVE: SAMPLE EXPORTS FOR USE ELSEWHERE          #
//#######################################################################
console.log('***************** NON-INSTRUCTIVE: SAMPLE EXPORTS FOR USE ELSEWHERE *****************');


export function myNewFn() {
  console.log('my new fn!');
}

export function yetAnotherFn() {
  console.log('yet another function :(');
};

export class AnotherTestClass {
  constructor(public name: string) { }
}

export const BIG_UUID: number = 12981290482093482342;

export class Someone {
  fullName: string;
  constructor(public id: number, firstName: string, lastName: string) {
    this.fullName = firstName + " " + lastName;
  }
}


