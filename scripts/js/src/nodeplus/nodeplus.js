// @ts-check

/* POLYFILL BROWSER WINDOW OBJECT */
// @ts-ignore
const JSDOM = require('jsdom');
const jsDom = new JSDOM.JSDOM();

/**
 * Try to find a .nodeplus file in current directory
 * Add all items found in it to global
 */
const augmentations = {};
try {
    const nodeplus = require(process.cwd() + `/.nodeplus`);
    console.log(`nodeplus:`, nodeplus);
    Object.keys(nodeplus).forEach(key => (augmentations[key] = nodeplus[key]));
    // console.log(`augmentations:`, augmentations);
} catch (e) {
    console.log(`nodeplus augmentations not found`);
}

// Note that this accepts augmentations

Object.defineProperty(global, 'window', {value: jsDom.window, enumerable: false});
Object.defineProperty(global, 'document', {value: jsDom.window.document, enumerable: false});
Object.defineProperty(global, 'navigator', {value: jsDom.window.navigator, enumerable: false});

/************************************** THIRD-PARTY IMPORTS ***************************************/
require('../augment-global-prototypes/augment-global-prototypes');

const moment = require('moment');
const lodash = require('lodash');

// @ts-ignore
const madUtils = require('mad-utils/lib/node');

const fs = require('fs');
const path = require('path');
const repl = require('repl');
const util = require('util');
const fetch = require('isomorphic-fetch');
const appRootPath = require('app-root-path');
const rootPath = appRootPath.path;

// ShellJS
const shellJS = require('shelljs');

let packageJson;

try {
    packageJson = JSON.parse(fs.readFileSync('./package.json').toString());
} catch (err) {
    console.error(`Error:`, err);
}

/**************************************** PROJECT IMPORTS *****************************************/
const {
    bindPropsToRepl,
    // cat,
    cd,
    ls,
    pwd,
    inspect,
    keys,
    displayProps
} = require('./nodeplus-repl-setup');

const {
    cat,
    // cd,
    chmod,
    cp,
    dirs,
    echo,
    exec,
    exit,
    find,
    grep,
    uniq,
    which,
    touch,
    test,
    sort,
    tail,
    head,
    ln,
    // ls,
    mkdir,
    mv,
    popd,
    pushd,
    // pwd,
    rm,
    sed,
    set
} = require('shelljs');

/********************************** REPL NODE ENVIRONMENT SETUP ***********************************/
util.inspect.defaultOptions.colors = true;
util.inspect.defaultOptions.depth = 2;
util.inspect.defaultOptions.breakLength = 100;
util.inspect.defaultOptions.showHidden = false;
util.inspect.defaultOptions.maxArrayLength = Infinity;

/**
 * Augment functions with toS function providing a function source output that
 * is more readble in a REPL environment
 */
Object.defineProperty(global.Function.prototype, `toS`, {
    get: function toS() {
        const s = this && this.toString();
        if (s) {
            // @ts-ignore
            const args = inspect.getArgs(this);
            console.log(``);
            console.log(madUtils.deindent`
                /**
                *  @name ${this.name}
                *  ${args ? '\n*  @param ' + args.join(`\n*  @param `) : ``}
                */`);
            const splitStr = s.split(`\n`);
            if (splitStr.length === 1) return splitStr[0];
            console.log(splitStr.join('\n'));
        }
        // String designed to display as blank line
        return '--<__BLOCK_OUTPUT__>--';
    },
    configurable: false,
    enumerable: false
});

const nJvlnsLine = `\n          `;
const nJsLine = `\n                  `;

/************************************** CONFIG REPL CONTEXT ***************************************/
/**
 * Properties to bind to repl context (available at top level in repl)
 */
const ctxProps = {
    // Shell
    cd,
    ls: {val: ls, mutable: true},
    mv,
    ln,
    mkdir,
    cat,
    chmod,
    cp,
    dirs,
    echo,
    exec,
    exit,
    find,
    grep,
    uniq,
    which,
    touch,
    test,
    sort,
    tail,
    head,
    popd,
    pushd,
    // pwd,
    rm,
    sed,
    [`set`]: set,

    // Helper libraries
    lodash,
    moment,
    madUtils,
    m_: madUtils,
    ld: lodash,
    fetch,

    Function,

    // Logging & object info-related
    inspect,
    // @ts-ignore
    getArgs: inspect.getArgs,
    keys,
    ...augmentations
};

// package.json content
if (packageJson) ctxProps.packageJson = packageJson;

const descAdditions = Object.keys(augmentations).reduce((acc, key) => {
    if (augmentations[key].__repl_description__) acc[key] = augmentations[key].__repl_description__;
    return acc;
}, {})

/**
 * Extra descriptions for bound properties
 */
const descriptions = {
    _: `Result of last command`,
    ld: `lodash alias`,
    m_: `mad-utils alias`,
    // TODO pwd description not showing
    pwd: `Show current working directory (like pwd in bash)`,
    Function: `Standard global has added property 'toS' for displaying as a clean string`,
    ...descAdditions,
};

// Attach props to REPL (repl is in repl setup)
const r = bindPropsToRepl(ctxProps, descriptions, `> `);

/**
 * Filtered repl history without numbered lines
 */
r.defineCommand(`help_added_globals`, {
    help: `Display custom objects/functions added to the top-level context`,
    action: () => displayProps(ctxProps, descriptions)
});

Reflect.defineProperty(r.context, 'pwd', {
    get: function() {
        return process.cwd();
    }
});

// r.context['pwd'] = {
//         get val() {
//             return process.cwd();
//         },
//         mutable: true
//     }
