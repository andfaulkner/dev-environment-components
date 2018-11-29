import {
    toCamelCase,
    toSnakeCase,
    toDashCase,
    capitalize,
    array,
    string,
    removeMatchingText,
} from 'mad-utils';

import {isDevelopment, isUAT, isQA} from 'env-var-helpers';

/******************************************** LOGGING *********************************************/
import {logFactory, Styles} from 'mad-logs/lib/shared';
const log = logFactory(`augment-string-prototype.ts`, Styles.angryBird);

/*********************************** TYPE DECLARATIONS (GLOBAL) ***********************************/
declare global {
    interface String {
        /**
         * Example: `some string example`.camelCase()  -[outputs]-> "someStringExample"
         */
        camelCase(): string;

        /**
         * Example: `Some String Example`.snakeCase()  -[outputs]->  "some_string_example"
         */
        snakeCase(): string;

        /**
         * Example: `some string example`.pascalCase()  -[outputs]->  "SomeStringExample"
         */
        pascalCase(): string;

        /**
         * Example: `Some String Example`.dashCase()  -[outputs]->  "some-string-example"
         */
        dashCase(): string;

        /**
         * Example: `ExampLe`.reverse()  -[outputs]-> "eLpmaxE"
         */
        reverse(): string;

        /**
         * Capitalize the first character in the string
         */
        capitalize: string;

        /**
         * Capitalize the first character in the string, lowercase the rest
         *
         * Example:
         *     `TeST StRing`.cap1LowerRest();
         *     // => `Test string`
         */
        cap1LowerRest(): string;

        first(): string;
        last(): string;
        second(): string;
        secondLast(): string;
        third(): string;
        thirdLast(): string;

        first2(): string;
        first3(): string;
        last2(): string;
        last3(): string;

        /**
         * Get all but first character in string
         */
        tail(): string;

        /**
         * Get all but last character in string
         */
        init(): string;

        removeSurroundingQuotes(): string;
        removeWhitespace(): string;

        isWhitespaceChar(): string;
        isAlphanumericChar(): string;
        isOperatorChar(): string;

        /**
         * Prepend "text." to string, ensuring "text." only prepends the string once
         *
         * Example: "someString".sID           // => "text.someString"
         * Example: "text.someString".sID      // => "text.someString"
         * Example: "text.text.someString".sID // => "text.someString"
         * Example: "someString".sID.sID.sID   // => "text.someString"
         */
        sID: string;

        /**
         * Ensure single "#" prepended to string
         *
         * Examples:
         *     "some-string".elID            // => "#some-string"
         *
         *     "#some-string".elID           // => "#some-string"
         *
         *     "##some-string".elID          // => "#some-string"
         *
         *     "some-string".elID.elID.elID  // => "#some-string"
         */
        elID: string;

        /**
         * Remove end-of-sentence/fragment punctuation (! . , ; : -) & whitespace at end of string
         *
         * Example: "someString.".rmEndPunc      // => "someString"
         * Example: "someString".rmEndPunc       // => "someString"
         * Example: "someString:".rmEndPunc      // => "someString"
         * Example: "text.someString,".rmEndPunc // => "text.someString"
         * Example: "someString!!!".rmEndPunc    // => "someString"
         * Example: "someString!.".rmEndPunc     // => "someString"
         */
        rmEndPunc: string;

        /**
         * Remove all text matching [needle] from string (haystack)
         * Example: `Meeka is a Meeka`.removeMatches(`Meeka`)  =>  " is a "
         * Example: `Meeks doggy dog`.removeMatches(/\s?dog[a-z][a-z]\s?/)  =>  "Meeks"
         *
         * @param {string|RegExp} needle String or RegExp to search for in string
         */
        removeMatches(needle: string | RegExp): string;

        /**
         * Get string to trail off to keep it below given [length], optionally with [ending] applied
         *
         * @param {number} length Max string length. Trail off so str is <= this length {def: 100}
         * @param {string} ending String to have trailing off at the end {def: ...}
         */
        truncate(length?: number, ending?: string): string;

        /**
         * Returns true if string includes [text]
         * @param {string} text Character or string to match against
         */
        includes(text: string): boolean;

        /**
         * Returns true if [regex] returns a match in string
         * @param {RegExp} regex Regular expression to match against string
         */
        includes(regex: RegExp): boolean;

        /**
         * Only display given string in development mode or in UAT
         * Display given alternative string [prodVal, or null (by default) if
         * not in development mode (or in UAT, but not in QA)
         *
         * @param {string} prodVal [OPTIONAL] string to display instead when in production or UAT
         */
        devOnly(prodVal?: string): string | null;

        /**
         * Pad the string on the right side with character [padChar] (Default: ` `)
         * until it's the given [length] (Default: 0)
         *
         * @param {number} length Number of characters wide to make the output string
         * @param {string} padChar Character to pad the output string with
         */
        padRight(length?: number, padChar?: string): string;

        /**
         * Pad the string on the left side with character [padChar] (Default: ` `)
         * until it's the given [length] (Default: 0)
         *
         * @param {number} length Number of characters wide to make the output string
         * @param {string} padChar Character to pad the output string with
         */
        padLeft(length?: number, padChar?: string): string;
    }
}

/************************************* AUGMENTATION FUNCTIONS *************************************/
String.prototype.camelCase = function camelCase() {
    return toCamelCase(this);
};

String.prototype.pascalCase = function pascalCase() {
    return capitalize(toCamelCase(this));
};

String.prototype.snakeCase = function snakeCase() {
    return toSnakeCase(this);
};

String.prototype.dashCase = function dashCase() {
    return toDashCase(this);
};

String.prototype.reverse = function reverse() {
    return this.split(``)
        .reverse()
        .join(``);
};

String.prototype.removeMatches = function removeMatches(textToRm: string | RegExp) {
    return removeMatchingText(this, textToRm);
};

String.prototype.truncate = function truncate(length: number = 100, ending = `...`): string {
    return this.length > length ? this.substring(0, length - ending.length) + ending : this;
};

//
// Override "includes" method with a polyfill that also takes regexes
//

// Store original includes
const origIncludes = String.prototype.includes;

// Override includes
String.prototype.includes = function includesAugmented<T extends string | RegExp>(
    match: T
): boolean {
    return match instanceof RegExp ? !!this.match(match) : origIncludes.call(this, match);
};

String.prototype.padRight = function padRightAugmented(outWidth?: number, padChar?: string) {
    return string.padRight(this, outWidth, padChar);
};

String.prototype.padLeft = function padLeftAugmented(outWidth?: number, padChar?: string) {
    return string.padLeft(this, outWidth, padChar);
};

String.prototype.devOnly = function devOnlyString(prodVal?: string): string | null {
    return (isDevelopment || isQA) && !isUAT ? this : prodVal || null;
};

Reflect.defineProperty(String.prototype, `sID`, {
    get: function sID(this: string): string {
        if (this === ``) {
            console.error(`ERROR :: sID cannot be run on an empty string`);
            return this;
        }

        const newStr = this.removeMatches(/^text\./);
        return newStr.includes(/^text\./) ? newStr.sID : `text.${newStr}`;
    },
});

Reflect.defineProperty(String.prototype, `elID`, {
    get: function elID(this: string): string {
        if (this === ``) {
            console.error(`ERROR :: elID cannot be run on an empty string`);
            return this;
        }

        return `#${this.removeMatches(/^#+/g)}`;
    },
});

Reflect.defineProperty(String.prototype, `rmEndPunc`, {
    get: function rmEndPunc(this: string): string {
        return this.replace(/[!.,;:\- ]+$/g, ``);
    },
});

/*************************************** GET FROM POSITION ****************************************/
String.prototype.tail = function tailAugmented(this: string): string {
    return this.slice(1);
};

String.prototype.init = function initAugmented(this: string): string {
    return this.slice(0, -1);
};

Reflect.defineProperty(String.prototype, `capitalize`, {
    get: function capitalizeAugmented(this: string): string {
        return capitalize(this);
    },
});

/***************************** BULK ADD FUNCTIONS TO STRING PROTOTYPE *****************************/
const newStrFuncs = [
    `cap1LowerRest`,
    `isWhitespaceChar`,
    `isAlphanumericChar`,
    `isOperatorChar`,
    `removeSurroundingQuotes`,
    `removeWhitespace`,
].forEach(fn => {
    String.prototype[fn] = function() {
        return string[fn](this);
    };
});

const newArrFuncs = [
    `first`,
    `last`,
    `second`,
    `secondLast`,
    `third`,
    `thirdLast`,
    `first2`,
    `first3`,
    `last2`,
    `last3`,
].forEach(fn => {
    String.prototype[fn] = function() {
        return array[fn](this);
    };
});

/********************** EXPORTS REQUIRED TO ENSURE UPTAKE FOR AUGMENTATIONS ***********************/
export type BaseStrFunc = () => string;

log.verbose(
    `Successfully augmented String.prototype. String.prototype keys:`,
    Object.keys(String.prototype)
);
