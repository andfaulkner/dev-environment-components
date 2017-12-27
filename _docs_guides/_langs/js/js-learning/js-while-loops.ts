
Array.prototype['iterator'] = function iterator() {
    let curPos = 0;
    const hasNext = () => curPos < this.length;
    const next    = () => hasNext() ? this[curPos++] : undefined;
    const clear   = () => { while(hasNext()) next(); };            // <<< NOTE THIS ONE
    const remove  = () => { hasNext() && next(); };
    return { next, hasNext, clear, remove }
};

let counter = 0;
let str = 'abcd';
while (counter < str.length) {
    console.log(str[counter++]);
}
// => a
// => b
// => c
// => d

while (true) {
    // Infinite loop, unless you hit break
    break; // << prevented it from being an infinite loop
}

// while (!_this.input.isEOF() && predicate(_this.input.peek())) {
//     str += _this.input.next();
// }

// while (!_this.input.isEOF()) {
//     // things
// }

// while (n > 0) {
//     //Do things
// }

// while (counter < length) {
//     // do things
// }

// do {
//     encoded = alphabet[num % length] + encoded;
//     num = Math.floor(num / length);
// } while (num > 0);

// // If 2+ cleanArgs given, replace each numbered tag in str w/ the numerically corresponding
// // arg. Each '%1$s' gets replaced by the 1st arg given, each %2$s by the 2nd, & so on.
// var idx = 0;
// while (idx < cleanArgs.length) {
//     str = str.replace(new RegExp("%" + (idx + 1) + "\\$s", 'g'), cleanArgs[idx]);
//     idx++;
// }

// COMPARISONS
//
// function eq(x, y) {
//     var stack = [];
//     var isEqual = eqHelp(x, y, 0, stack);
//     var pair;
//     while (isEqual && (pair = stack.pop()))
//     {
//         isEqual = eqHelp(pair.x, pair.y, 0, stack);
//     }
//     return isEqual;
// }
