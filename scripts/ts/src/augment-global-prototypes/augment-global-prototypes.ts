/************************************* GLOBAL TYPE OVERRIDES **************************************/
declare global {
    interface RegExpConstructor {
        /**
         * @param {string} unescapedStr String to escape
         */
        escape: RegExpEscapeFn;
    }
}

// Note: it's important to have at least 1 export from here
export type RegExpEscapeFn = (unescapedStr: string) => string;

/**************************************** RegExp POLYFILLS ****************************************/
if (!RegExp.escape) {
    Reflect.defineProperty(RegExp, `escape`, {
        value: function(unescapedStr) {
            return String(unescapedStr).replace(/[\\^$*+?.()|[\]{}]/g, '\\$&');
        },
        configurable: false,
        enumerable: false,
    });
}

/************************ BARREL EXPORTS FOR OTHER PROTOTYPE AUGMENTATIONS ************************/
import * as StringProto from './augment-string-prototype';
import * as ArrayProto from './augment-array-prototype';

export {StringProto, ArrayProto};
