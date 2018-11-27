#!/usr/bin/env ts-node
import {last, first, second, compact, arrayRemove} from 'mad-utils';

/*************************************** TYPE DECLARATIONS ****************************************/
export type BaseArrFunc<T = any> = (this: T[]) => T[];
export type GetArrayItemFunc<T = any> = (this: T[]) => T;

export type ArrayGetter<T = any> = T[];
export type ArrayItemGetter<T = any> = T | undefined;
export type FlatMapType = <T, U>(mapFunction: (value: T, idx: number, array: T[]) => U[]) => U[];

export type BooleanInfoType = <T = any>(this: T[]) => boolean;

type FalsyType = 'allFalsy' | 'nullUndef' | 'keep0' | 'keepStr';

declare global {
    interface Array<T> {
        clone: <T = any>() => T[];

        /**
         * Get first item in array
         */
        first: ArrayItemGetter<T>;
        /**
         * Get second item in array
         */
        second: ArrayItemGetter<T>;
        /**
         * Get last item in array
         */
        last: ArrayItemGetter<T>;
        /**
         * Get all but last item in array
         */
        init: ArrayGetter<T>;
        /**
         * Get all but first item in array
         */
        tail: ArrayGetter<T>;

        /**
         * Remove all falsy values except 0, ``, and false
         * If argument [all] is true, include 0, ``, and false in removed values
         */
        compact: <T = any>(all?: boolean) => T[];

        /**
         * Remove falsy values from the array
         * By default removes all falsy val types, but can select a specific subset to rm w 2nd arg
         * @param {string} falsyTypes: 'allFalsy'  [DEFAULT] Remove all falsy values
         *                             'nullUndef' Remove only null & undefined values
         *                             'keep0'     Remove all falsy values except 0
         *                             'keepStr'   Remove all falsy values except ''
         * @return {Array} Array with set falsy val types removed (rms all falsy vals by default)
         */
        rmFalsyVals: <T = any>(falsyTypes?: FalsyType) => T[];

        /**
         * Return true if array is empty
         */
        empty: BooleanInfoType;

        /**
         * Return first truthy value returned from predicate
         *
         * Similar to find, but returns whatever value you want from the
         * predicate, rather than the found value itself
         *
         * Returns null if no truthy value returned by predicate for any values
         * of array
         */
        returnFirstTruthy: <R>(predicate: (item: T) => R) => R;

        /**
         * Map over array, then flatten result (one level deep)
         */
        flatMap: FlatMapType;

        /**
         *  Map after deep-flattening array (contrast with flatMapDeep, which
         *  deep-flattens after mapping top-level array)
         */
        flatDeepMap: FlatMapType;

        /**
         * Map over (top-level) array, then deep-flatten result
         */
        flatMapDeep: FlatMapType;

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
        deleteAll: <T>(this: T[], needle: T) => T[];

        /**
         * Return new array with all matches of given value removed from array
         *
         * Example: const arr = ['a', 'b', 'c', 'd', 'b'];
         *          const newArr = arr.remove('b');
         *          console.log(newArr); // => ['a', 'c', 'd']
         *          console.log(arr);    // => ['a', 'b', 'c', 'd']
         */
        remove: <T>(this: T[], itemToRemove: T) => T[];
    }
}

/******************************************** HELPERS *********************************************/
/**
 * Comparison algorithm
 */
const sameValueZero = (x: number, y: number) =>
    x === y || (typeof x === 'number' && typeof y === 'number' && isNaN(x) && isNaN(y));

/*************************************** GET FROM POSITION ****************************************/
/**
 * Get first item in array
 */
Reflect.defineProperty(Array.prototype, `first`, {
    get: function firstAugmented<T = any>(this: T[]): T {
        return first(this);
    },
    configurable: false,
    enumerable: false,
});

/**
 * Get second item in array
 */
Reflect.defineProperty(Array.prototype, `second`, {
    get: function secondAugmented<T = any>(this: T[]): T {
        return second(this);
    },
    configurable: false,
    enumerable: false,
});

/**
 * Get last item in array
 */
Reflect.defineProperty(Array.prototype, `last`, {
    get: function lastAugmented<T = any>(this: T[]): T {
        return last(this);
    },
    configurable: false,
    enumerable: false,
});

/**
 * Get all but last item in array
 */
Reflect.defineProperty(Array.prototype, `init`, {
    get: function initAugmented<T = any>(this: T[]): T[] {
        return this.slice(0, -1);
    },
    configurable: false,
    enumerable: false,
});

/**
 * Get all but first item in array
 */
Reflect.defineProperty(Array.prototype, `tail`, {
    get: function tailAugmented<T = any>(this: T[]): T[] {
        return this.slice(1);
    },
    configurable: false,
    enumerable: false,
});

/**
 * Get new array containing all non-falsy vals from array
 */
Reflect.defineProperty(Array.prototype, 'rmFalsyVals', {
    value: function rmFalsyVals<T = any>(this: T[], falsyType: FalsyType = 'allFalsy'): T[] {
        return compact(this, falsyType);
    },
    configurable: false,
    enumerable: false,
});

/************************************** ARRAY INFO POLYFILLS **************************************/
/**
 * Return true if current array is not empty
 */
Reflect.defineProperty(Array.prototype, `empty`, {
    get: function emptyAugmented<T = any>(this: T[]): boolean {
        return !this.last;
    },
    configurable: false,
    enumerable: false,
});

/*************************************** flatMap POLYFILLS ****************************************/
Reflect.defineProperty(Array.prototype, 'flatMap', {
    value: function(lambda) {
        return Array.prototype.concat.apply([], this.map(lambda));
    },
    configurable: false,
    enumerable: false,
});

Reflect.defineProperty(Array.prototype, 'flatDeepMap', {
    value: function flatDeepMap<T>(this: T[], mapper) {
        return Array.isArray(this)
            ? this.reduce(
                  (acc, val) =>
                      acc.concat(Array.isArray(val) ? val.flatDeepMap(mapper) : mapper(val)),
                  []
              )
            : mapper(this);
    },
    configurable: false,
    enumerable: false,
});

Reflect.defineProperty(Array.prototype, 'flatMapDeep', {
    value: function flatMapDeep<T>(this: T[], mapper) {
        return Array.isArray(this)
            ? this.reduce((acc, val) => acc.concat(mapper(val)), [])
            : mapper(this);
    },
    configurable: false,
    enumerable: false,
});

Reflect.defineProperty(Array.prototype, 'deleteAll', {
    value: function deleteAllItem<T>(this: T[], needle: T) {
        return arrayRemove(this, needle);
    },
    configurable: false,
    enumerable: false,
});

Reflect.defineProperty(Array.prototype, 'remove', {
    value: function removeItem<T>(this: T[], itemToRemove: T) {
        return this.filter(item => item === itemToRemove);
    },
    configurable: false,
    enumerable: false,
});

Reflect.defineProperty(Array.prototype, 'returnFirstTruthy', {
    value: function returnFirstTruthy<T>(this: T[], predicate: (item: T) => boolean) {
        let match = null;
        for (const item of this) {
            const val = predicate(item);
            if (val) return val;
        }
        return null;
    },
    configurable: false,
    enumerable: false,
});

Reflect.defineProperty(Array.prototype, 'compact', {
    value: function compact<T = any>(this: T[], all?: boolean) {
        return this.filter((item: any) =>
            all ? !!item : item !== 0 && item !== `` && item !== false && !!item
        );
    },
});

Reflect.defineProperty(Array.prototype, 'clone', {
    value: function clone<T>(this: T[]) {
        return this.slice(0);
    },
});

/****************************************** LOG SUCCESS *******************************************/
console.log(`Successfully augmented Array.prototype.`);

export {};
