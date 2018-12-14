exports.__esModule = true;

/******************************************** IMPORTS *********************************************/
const mad_utils_1 = require('mad-utils');
const env_var_helpers_1 = require('env-var-helpers');

/******************************************** LOGGING *********************************************/
const shared_1 = require('mad-logs/lib/shared');
const log = shared_1.logFactory('augment-string-prototype.ts', shared_1.Styles.angryBird);

/************************************* AUGMENTATION FUNCTIONS *************************************/
String.prototype.camelCase = function camelCase() {
    return mad_utils_1.toCamelCase(this);
};

String.prototype.pascalCase = function pascalCase() {
    return mad_utils_1.capitalize(mad_utils_1.toCamelCase(this));
};

String.prototype.snakeCase = function snakeCase() {
    return mad_utils_1.toSnakeCase(this);
};

String.prototype.dashCase = function dashCase() {
    return mad_utils_1.toDashCase(this);
};

String.prototype.reverse = function reverse() {
    return this.split('')
        .reverse()
        .join('');
};

String.prototype.removeMatches = function removeMatches(textToRm) {
    return mad_utils_1.removeMatchingText(this, textToRm);
};

String.prototype.truncate = function truncate(length, ending) {
    if (length === void 0) {
        length = 100;
    }
    if (ending === void 0) {
        ending = '...';
    }
    return this.length > length ? this.substring(0, length - ending.length) + ending : this;
};

//
// Override "includes" method with a polyfill that also takes regexes
//
// Store original includes
var origIncludes = String.prototype.includes;

// Override includes
String.prototype.includes = function includesAugmented(match) {
    return match instanceof RegExp ? !!this.match(match) : origIncludes.call(this, match);
};

String.prototype.padRight = function padRightAugmented(outWidth, padChar) {
    return mad_utils_1.string.padRight(this, outWidth, padChar);
};

String.prototype.padLeft = function padLeftAugmented(outWidth, padChar) {
    return mad_utils_1.string.padLeft(this, outWidth, padChar);
};

String.prototype.devOnly = function devOnlyString(prodVal) {
    return (env_var_helpers_1.isDevelopment || env_var_helpers_1.isQA) && !env_var_helpers_1.isUAT
        ? this
        : prodVal || null;
};

Reflect.defineProperty(String.prototype, 'sID', {
    get: function sID() {
        if (this === '') {
            console.error('ERROR :: sID cannot be run on an empty string');
            return this;
        }
        var newStr = this.removeMatches(/^text\./);
        return newStr.includes(/^text\./) ? newStr.sID : 'text.' + newStr;
    }
});

Reflect.defineProperty(String.prototype, 'elID', {
    get: function elID() {
        if (this === '') {
            console.error('ERROR :: elID cannot be run on an empty string');
            return this;
        }
        return '#' + this.removeMatches(/^#+/g);
    }
});

Reflect.defineProperty(String.prototype, 'rmEndPunc', {
    get: function rmEndPunc() {
        return this.replace(/[!.,;:\- ]+$/g, '');
    }
});

/*************************************** GET FROM POSITION ****************************************/
String.prototype.tail = function tailAugmented() {
    return this.slice(1);
};

String.prototype.init = function initAugmented() {
    return this.slice(0, -1);
};

Reflect.defineProperty(String.prototype, 'capitalize', {
    get: function capitalizeAugmented() {
        return mad_utils_1.capitalize(this);
    }
});

/***************************** BULK ADD FUNCTIONS TO STRING PROTOTYPE *****************************/
const newStrFuncs = [
    'cap1LowerRest',
    'isWhitespaceChar',
    'isAlphanumericChar',
    'isOperatorChar',
    'removeSurroundingQuotes',
    'removeWhitespace'
].forEach(function(fn) {
    String.prototype[fn] = function() {
        return mad_utils_1.string[fn](this);
    };
});

const newArrFuncs = [
    'first',
    'last',
    'second',
    'secondLast',
    'third',
    'thirdLast',
    'first2',
    'first3',
    'last2',
    'last3'
].forEach(function(fn) {
    String.prototype[fn] = function() {
        return mad_utils_1.array[fn](this);
    };
});

log.verbose(
    'Successfully augmented String.prototype. String.prototype keys:',
    Object.keys(String.prototype)
);
