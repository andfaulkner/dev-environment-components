//WIP - NOT REALLY SET UP

var FLAG_UP = 1; // 00001
var FLAG_SPEC = 2; // 00010
var FLAG_NUM = 4; // 00100
var FLAG_WHITE = 8; // 01000
var FLAG_LEN = 16; // 10000

function arrayFromMask(nMask) {
		// nMask must be between -2147483648 and 2147483647
		if (nMask > 0x7fffffff || nMask < -0x80000000) {
				throw new TypeError("arrayFromMask - out of range");
		}
		for (var nShifted = nMask, aFromMask = []; nShifted; aFromMask.push(Boolean(nShifted & 1)), nShifted >>>= 1);
		return aFromMask;
}

var masks = [];
for (var i = 0; i < 25; i++) {
		var arrFromMask = arrayFromMask(i);
		while (arrFromMask.length < 5) {
				arrFromMask.unshift(false);
		}
		masks.push(arrFromMask);
}
