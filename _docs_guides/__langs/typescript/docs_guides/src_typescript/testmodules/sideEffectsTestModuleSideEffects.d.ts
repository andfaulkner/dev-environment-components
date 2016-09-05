// fake nodeJS declaration file. Also includes handler for troublesome sideEffects file earlier on.

// declare module "path" {
//     export function normalize(p: string): string;
//     export function join(...paths: any[]): string;
//     export var sep: string;
//     export var poo: string;
// }

declare module "GLOBAL" {
  export var testModuleSideEffects: Object;
}

declare module "testModuleSideEffects" {
  export var hello: string;
  export var uhoh: string;
  export var erm: string;
}

// works, but interferes
// declare module "console" {
//   export var uhoh: string;
//   export function log(...args: any[]): void;
//   export function warn(...args: any[]): void;
//   export function error(...args: any[]): void;
//   export function dir(...args: any[]): void;
//   export function time(label: string): void;
//   export function timeEnd(label: string): void;
//   export function trace(message: string, ...moreMsgs: string[]): void;
//   export function assert(assert: any, ...message: string[]): void;
//   export class Console {
//     constructor(stdout: WriteStream, stderr: RStream);
//   }
// }