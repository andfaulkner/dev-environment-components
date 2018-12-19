// @ts-check

/* POLYFILL BROWSER WINDOW OBJECT */
// @ts-ignore
const JSDOM = require('jsdom');
const jsDom = new JSDOM.JSDOM();

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
const appRootPath = require('app-root-path');
const rootPath = appRootPath.path;

// ShellJS
const shellJS = require('shelljs');

// const packageJson = require('../package.json');
const packageJson = JSON.parse(fs.readFileSync('./package.json').toString());

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
    ln,
    mkdir,
    mv,
    popd,
    pushd,
    // pwd,
    rm,
    sed,
    "set": set,

    // Helper libraries
    lodash,
    moment,
    madUtils,
    m_: madUtils,
    _: lodash,

    Function,

    // Logging & object info-related
    inspect,
    // @ts-ignore
    getArgs: inspect.getArgs,
    keys,

    // Navigation, filesystem helpers
    cd,
    ls: {val: ls, mutable: true},
    pwd: {val: pwd, mutable: true},

    // package.json content
    packageJson
};

/**
 * Extra descriptions for bound properties
 */
const descriptions = {
    _: `lodash alias`,
    m_: `mad-utils alias`,
    Function: `Standard global has added property 'toS' for displaying as a clean string`
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
