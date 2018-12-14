exports.__esModule = true;

/******************************************** IMPORTS *********************************************/
const mad_utils_1 = require('mad-utils');

/*************************************** GET FROM POSITION ****************************************/
/**
 * Get first item in array
 */
Reflect.defineProperty(Array.prototype, 'first', {
    get: function firstAugmented() {
        return mad_utils_1.first(this);
    },
    configurable: false,
    enumerable: false
});

/**
 * Get second item in array
 */
Reflect.defineProperty(Array.prototype, 'second', {
    get: function secondAugmented() {
        return mad_utils_1.second(this);
    },
    configurable: false,
    enumerable: false
});

/**
 * Get last item in array
 */
Reflect.defineProperty(Array.prototype, 'last', {
    get: function lastAugmented() {
        return mad_utils_1.last(this);
    },
    configurable: false,
    enumerable: false
});

/**
 * Get all but last item in array
 */
Reflect.defineProperty(Array.prototype, 'init', {
    get: function initAugmented() {
        return this.slice(0, -1);
    },
    configurable: false,
    enumerable: false
});

/**
 * Get all but first item in array
 */
Reflect.defineProperty(Array.prototype, 'tail', {
    get: function tailAugmented() {
        return this.slice(1);
    },
    configurable: false,
    enumerable: false
});

/**
 * Remove falsy values from the array
 * By default removes all falsy val types, but can select a specific subset to rm w 2nd arg
 * @param {string} falsyTypes: 'allFalsy'  [DEFAULT] Remove all falsy values
 *                             'nullUndef' Remove only null & undefined values
 *                             'keep0'     Remove all falsy values except 0
 *                             'keepStr'   Remove all falsy values except ''
 * @return {Array} Array with set falsy val types removed (rms all falsy vals by default)
 */
Reflect.defineProperty(Array.prototype, 'rmFalsyVals', {
    value: function rmFalsyVals(falsyType) {
        if (falsyType === void 0) {
            falsyType = 'allFalsy';
        }
        return mad_utils_1.compact(this, falsyType);
    },
    configurable: false,
    enumerable: false
});

/************************************** ARRAY INFO POLYFILLS **************************************/
/**
 * Return true if current array is not empty
 */
Reflect.defineProperty(Array.prototype, 'empty', {
    get: function emptyAugmented() {
        return !this.last;
    },
    configurable: false,
    enumerable: false
});

/*************************************** flatMap POLYFILLS ****************************************/
/**
 * Map over array, then flatten result (one level deep)
 */
Reflect.defineProperty(Array.prototype, 'flatMap', {
    value: function(lambda) {
        return Array.prototype.concat.apply([], this.map(lambda));
    },
    configurable: false,
    enumerable: false
});

/**
 *  Map after deep-flattening array (contrast with flatMapDeep, which
 *  deep-flattens after mapping top-level array)
 */
Reflect.defineProperty(Array.prototype, 'flatDeepMap', {
    value: function flatDeepMap(mapper) {
        return Array.isArray(this)
            ? this.reduce(function(acc, val) {
                  return acc.concat(Array.isArray(val) ? val.flatDeepMap(mapper) : mapper(val));
              }, [])
            : mapper(this);
    },
    configurable: false,
    enumerable: false
});

/**
 * Map over (top-level) array, then deep-flatten result
 */
Reflect.defineProperty(Array.prototype, 'flatMapDeep', {
    value: function flatMapDeep(mapper) {
        return Array.isArray(this)
            ? this.reduce(function(acc, val) {
                  return acc.concat(mapper(val));
              }, [])
            : mapper(this);
    },
    configurable: false,
    enumerable: false
});

/**
 * [MUTATIVE]
 * Mutatively removes all matches of given value from array
 * Also returns new array
 *
 * Example: const arr = ['a', 'b', 'c', 'd', 'b'];
 *          arr.remove('b');
 *          console.log(arr); // => ['a', 'c', 'd']
 *
 * @param {any} needle Item to remove all matches of from array
 * @return {Array} array from haystack property with all "needle"s removed
 */
Reflect.defineProperty(Array.prototype, 'deleteAll', {
    value: function deleteAllItem(needle) {
        return mad_utils_1.arrayRemove(this, needle);
    },
    configurable: false,
    enumerable: false
});

/**
 * Return new array with all matches of given value removed from array
 *
 * Example: const arr = ['a', 'b', 'c', 'd', 'b'];
 *          const newArr = arr.remove('b');
 *          console.log(newArr); // => ['a', 'c', 'd']
 *          console.log(arr);    // => ['a', 'b', 'c', 'd']
 */
Reflect.defineProperty(Array.prototype, 'remove', {
    value: function removeItem(itemToRemove) {
        return this.filter(function(item) {
            return item === itemToRemove;
        });
    },
    configurable: false,
    enumerable: false
});

/**
 * Return first truthy value returned from predicate
 *
 * Similar to find, but returns whatever value you want from the
 * predicate, rather than the found value itself
 *
 * Returns null if no truthy value returned by predicate for any values
 * of array
 */
Reflect.defineProperty(Array.prototype, 'returnFirstTruthy', {
    value: function returnFirstTruthy(predicate) {
        var match = null;
        for (var _i = 0, _a = this; _i < _a.length; _i++) {
            var item = _a[_i];
            var val = predicate(item);
            if (val) return val;
        }
        return null;
    },
    configurable: false,
    enumerable: false
});

/**
 * Remove all falsy values except 0, ``, and false
 * If argument [all] is true, include 0, ``, and false in removed values
 */
Reflect.defineProperty(Array.prototype, 'compact', {
    value: function compact(all) {
        return this.filter(function(item) {
            return all ? !!item : item !== 0 && item !== '' && item !== false && !!item;
        });
    }
});

/**
 * Create duplicate of array
 */
Reflect.defineProperty(Array.prototype, 'clone', {
    value: function clone() {
        return this.slice(0);
    }
});
