console.log('----------------------------------------------------------------------------------');
//#############################
//#          SYMBOLS          #
//#############################
console.log('***************** SYMBOLS *****************');
// #Basic info
// *  immutable and unique
// *  usable as keys for object props
console.log(" ----- Symbols are created with the Symbol() constructor -----");
let sym1 = Symbol();
console.log(" ----- Can assign str key to symbols to aid debugging (id symbol in stack etc) -----");
let sym2 = Symbol('sym2');
console.log(" ----- Symbols are immutable and unique -----");
let sym3 = Symbol('key');
let sym4 = Symbol('key');
console.log('Since all symbols are unique, comparing equality of 2 symbols always returns false');
console.log('sym3 === sym4: ', sym3 === sym4);
console.log(" ----- Symbols are usable as keys for object properties -----");
let sym5 = Symbol('sym5');
let obj = {
    [sym5]: 'value'
};
console.log(obj[sym5]);
