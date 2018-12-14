exports.__esModule = true;

/**************************************** RegExp POLYFILLS ****************************************/
if (!RegExp.escape) {
    Reflect.defineProperty(RegExp, 'escape', {
        value: function(unescapedStr) {
            return String(unescapedStr).replace(/[\\^$*+?.()|[\]{}]/g, '\\$&');
        },
        configurable: false,
        enumerable: false
    });
}

/************************ BARREL EXPORTS FOR OTHER PROTOTYPE AUGMENTATIONS ************************/
var StringProto = require('./augment-string-prototype');
exports.StringProto = StringProto;

var ArrayProto = require('./augment-array-prototype');
exports.ArrayProto = ArrayProto;
