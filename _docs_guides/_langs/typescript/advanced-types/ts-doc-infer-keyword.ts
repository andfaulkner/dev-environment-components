/// <reference path="../../../../node_modules/typescript/lib/lib.es2018.d.ts" />

/*======================================== infer KEYWORD =========================================*/
/*
 *  - Used within a condition in a conditional type to put the inferred type into a variable.
 *  - That inferred variable can then be used within the conditional branches.
 *
 *  - Interesting conception of it:
 *        - "infer" is there to say you know you are declaring a new type (in the conditional
 *          type's scope), much like you have to write var, let or const to tell the compiler
 *          you know you're declaring a new variable
 *
 *        - Without "infer", the compiler wouldn't know if you wanted to introduce an
 *          additional type variable (e.g. R) that is to be inferred, or if R is just
 *          an accidental typing error/typo
 *          - You can also give a generic type a name that shadows a name in the outer
 *            scope using infer
 */


//--------------------------------------------------------------------------------------------------
/*------------------------------------------ EXAMPLE 1 -------------------------------------------*/
//---- Infer type of an array's content ----//

/**
 * Flatten an array by one layer, inferring the type inside.
 */
type FlattenArr<Type> = Type extends Array<infer Item> ? Item : Type;
// This introduces a new generic type variable named Item.

// Example with number inside
const myArr = [1, 2, 3, 4, 5, [6, 7], [8, 9], 10]; // type: (number | number[])[]
type FlattenedMyArr = FlattenArr<typeof myArr>; // type: number | number[]

// Example with string inside
const myStrArr = ['a', 'b', 'c', 'd', ['e', 'f'], 'g', ['h', 'i']]; // type: (string | string[])[]
type FlattenedMyStrArr = FlattenArr<typeof myArr>; // type: string | string[]


//--------------------------------------------------------------------------------------------------
/*------------------------------------------ EXAMPLE 2 -------------------------------------------*/
//---- Infer return type of a function ----//

/**
 * Extract the return type from a function
 */
type GetReturnType<Type> = Type extends (...args: never[]) => infer Return ? Return : never;

// Use with function with no args
const add20ToRand = () => Math.random() + 20; // type: () => number
type Add20ToRandRetType = GetReturnType<typeof add20ToRand>; // type: number

// Use with function with args
const add20ToInputNums = (num1: number, num2: number) => num1 + num2 + 20; // type: (num1: number, num2: number) => number
type Add20ToInputNumsRetType = GetReturnType<typeof add20ToInputNums>; // type: number

// Use with string-returning function with args
const buildName = (firstName: string, lastName: string) => `${firstName} ${lastName}`; // type: (firstName: string, lastName: string) => string
type BuildNameRetType = GetReturnType<typeof buildName>; // type: string


//--------------------------------------------------------------------------------------------------
/*------------------------------------------ EXAMPLE 3 -------------------------------------------*/
//---- Infer type in a promise ----//

/**
 * Extract the boxed type in a promise.
 */
type Unpromisify<Type> = Type extends Promise<infer Return> ? Return : Type;

// Use with promise containing a string
const promisedStr = Promise.resolve('abc'); // type: Promise<string>
type PromisedStrType = Unpromisify<typeof promisedStr>; // type: string


//--------------------------------------------------------------------------------------------------
/*------------------------------------------ EXAMPLE 4 -------------------------------------------*/
//---- Infer type of first argument of a function ----//

/**
 * Extract the type of the first argument of a function
 */
type Arg1<Type extends Function> = Type extends (a1: infer Arg1) => any ? Arg1 : never;

// Use with a function with a number in the first argument
const incrementAndToString = (num: number) => (num++).toString(); // type: (num: number) => string
type IncrementAndToStringFirstArg = Arg1<typeof incrementAndToString>; // type: number


//--------------------------------------------------------------------------------------------------
/*------------------------------------------ EXAMPLE 5 -------------------------------------------*/
//---- Infer from multiple positions simulataneously ----//

type UnboxAandBKeysFromObj<Type> = Type extends {a: infer Return; b: infer Return} ? Return: never;

type ValsAtAandBKeys = UnboxAandBKeysFromObj<{a: string; b: number}>; // type: string | number



//--------------------------------------------------------------------------------------------------
/*------------------------------------------ EXAMPLE 6 -------------------------------------------*/
//---- Get types of object in first argument of function (e.g. props) ----//

/**
 * Any function with one argument that contains an object
 */
type FuncWOneObjArg<Props extends {[x: string]: any}, Return> = (props: Props) => Return;
// Note: Also works if:   {[x: string]: any}   is instead:  Record<string, any>

/**
 * Helper to get destructured arguments of the object passed to the first
 * argument of an array (i.e. the props object).
 */
type DestructuredArgsOfFunc<
    Func extends FuncWOneObjArg<any, any>
> = Func extends FuncWOneObjArg<infer Props, any> ? Props : never;

// Function that takes a prefix & 3 coordinates, & creates a string from them.
const toCoordsString = (props: {x: number; y: number; z: number; prefix: string;}): string => {
    return `${props.prefix}: ${props.x}, ${props.y}, ${props.z}`;
};

// Get types of first arg
const props: DestructuredArgsOfFunc<typeof toCoordsString> = {
    x: 1,
    y: 2,
    z: 4,
    prefix: 'Atom position coordinates'
};
/* type:
    {
        x: number;
        y: number;
        z: number;
        prefix: string;
    }
*/
// This will fail if types not matching the props arg of toCoordsString are given.

// Intellisense detects that props has props.x, props.y, props.z, and props.prefix.


//--------------------------------------------------------------------------------------------------
/*------------------------------------------ EXAMPLE 7 -------------------------------------------*/
//---- Get types from first item in array ----//

/**
 * Helper to get the type of the first item in an array
 */
type GetFirstTupleItem<Type> = Type extends ([infer V1, ...any]) ? V1 : never;

const arr1 = [Symbol('okok')] as [symbol];
type Arr1Type = GetFirstTupleItem<typeof arr1>; // type: symbol

const arr2 = ['first', 3, 4] as [string, number, number];
type Arr2Type = GetFirstTupleItem<typeof arr2>; // type: string

const arr3 = [1, 'second', 4, 'okie'] as [number, string, number, string];
type Arr3Type = GetFirstTupleItem<typeof arr3>; // type: number

const arr4 = [false, 1, 'second', 4, 'okie', true] as [boolean, number, string, number, string, boolean];
type Arr4Type = GetFirstTupleItem<typeof arr4>; // type: number


//--------------------------------------------------------------------------------------------------
/*------------------------------------------ EXAMPLE 8 -------------------------------------------*/
//---- Create "passthrough" type ----//

/**
 * Infer new variable RetVal from Type. It'll be the type of whatever is passed to it.
 *
 * (Not useful, just for demonstration)
 */
type PassthroughType<Type> = Type extends infer RetVal ? RetVal : never;

type NumAgain = PassthroughType<number> // type: number
type StringAgain = PassthroughType<string> // type: string
type TupleAgain = PassthroughType<[boolean, string, number]> // type: [boolean, string, number]


//--------------------------------------------------------------------------------------------------
/*------------------------------------------ EXAMPLE 9 -------------------------------------------*/
//---- Shadow type in the outer scope by defining generic variable with infer ----//

type RObj = { a: number }

// Compare T with above type RObj
type MyInferType1<Type> = Type extends RObj ? RObj : never;
type MyNewType1 = MyInferType1<{b: string}> // type: never

// Don't compare "Type" with RObj above - defining RObj with infer creates a new
// locally-scoped generic variable that shadows RObj above.
type MyInferType2<Type> = Type extends infer RObj ? RObj : never;
type MyNewType2 = MyInferType2<{b: string}> // type: {b: string}
// type: never


