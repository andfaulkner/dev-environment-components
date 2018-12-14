import * as repl from 'repl';

import {
    toCamelCase,
    toSnakeCase,
    toDashCase,
    capitalize,
    array,
    string,
    removeMatchingText,
} from 'mad-utils/lib/shared';

declare global {
    interface String {
        /**
         * Example: `some string example`.camelCase()  -[outputs]-> "someStringExample"
         */
        camelCase(): string;
    }
}

String.prototype.camelCase = function camelCase() {
    return toCamelCase(this);
};

const r = repl.start({
    prompt: `Node.js via stdin> `,
    input: process.stdin,
    output: process.stdout,
});

r.context.String = String;
r.context.String.prototype.camelCase = function camelCase() {
    return toCamelCase(this);
};
