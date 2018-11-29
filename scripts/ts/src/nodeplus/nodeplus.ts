declare function require(name: string);

/************************************** THIRD-PARTY IMPORTS ***************************************/
import * as __AUGMENT_GLOBAL_PROTOTYPE__ from '../augment-global-prototypes/augment-global-prototypes';

import * as lodash from 'lodash';
import * as moment from 'moment';
import * as madUtils from 'mad-utils';

import * as util from 'util';
import * as repl from 'repl';
import * as path from 'path';
import * as fs from 'fs';
import * as os from 'os';
import {path as rootPath} from 'app-root-path';

/**************************************** PROJECT MODULES *****************************************/
import {ls} from './ls';

/********************************** REPL NODE ENVIRONMENT SETUP ***********************************/
util.inspect.defaultOptions.colors = true;
util.inspect.defaultOptions.depth = 10;
util.inspect.defaultOptions.breakLength = 100;
util.inspect.defaultOptions.showHidden = true;

/****************************************** CONFIG REPL *******************************************/
// const packageJson = fs.readFileSync(path.join(rootPath, `./package.json`)).toString(); //require('./package.json');

const {defineProperty} = Object;

export const defPropConfig = {
    // Configuration for a global value that cannot be reassigned in the repl
    immutable: (lib: any) => ({
        configurable: false,
        enumerable: true,
        writable: false,
        value: lib,
    }),
    // Configuration for a global value that can be reassigned in the repl
    mutable: (lib: any) => ({
        configurable: true,
        enumerable: true,
        writable: true,
        value: lib,
    }),
};

/**
 * Run when inspect is called in the repl
 */
export const inspect = (...args) => {
    (console.log as any)(
        ...args.map(arg => {
            if (typeof arg === 'function') return arg.toString();
            return util.inspect(arg);
        })
    );
    return util.inspect(args[0]);
};

/****************************************** CREATE REPL *******************************************/
export const r = repl.start({useColors: true});

// Add REPL history file
const historyFile = path.join(os.homedir(), `.nodeplus_history`);
require('repl.history')(r, historyFile);

// Add IN_REPL property to repl environment. Acts as identifier that REPL is currently running
defineProperty((r.context as any).process.env, 'IN_REPL', defPropConfig.immutable(true));

/****************************************** REPL HELPERS ******************************************/
/**
 * Bind given properties to the repl context, with the given values
 * Display as list on repl load, with descriptions for each specified in descriptions prop
 * @param {Object} activeRepl Started repl (through repl.start())
 * @param {Object} ctxProps Bind each given value to its corresponding key
 *                 e.g. {_: lodash, _m: madUtils, Promise: bluebird}
 * @param {Object} descriptions Optional matching descriptions to display beside prop w/ given key
 *                 e.g.: {_: 'lodash alias', bluebird: 'promises library'}
 * @example bindPropsToRepl(repl.start(), { _: lodash, projData }, { _: 'Util lib' });
 */
export const bindPropsToRepl = (ctxProps: Object, descriptions: {[key: string]: string}) => {
    console.log(`\n\nEnhanced Node REPL`);
    console.log(`Custom properties bound to the top-level context:`);

    // Iterate through the given context properties
    for (let [key, val] of lodash.toPairs(ctxProps)) {
        // Add current prop's value to repl context. Mutable if requested, immutable otherwise
        if (typeof val === 'object' && val.val && val.mutable) {
            defineProperty(r.context, key, defPropConfig.mutable(val.val));
        } else {
            defineProperty(r.context, key, defPropConfig.immutable(val));
        }

        // Display prop and (if defined) prop description on repl boot
        if (descriptions[key]) {
            console.log(` * ${key}: ${descriptions[key]}`);
            // If prop description provided, bind it to the object in the context
            defineProperty(val, `__repl_description__`, defPropConfig.immutable(descriptions[key]));
        } else {
            console.log(` * ${key}`);
        }
    }
    console.log(`> `);
};

/***************************************** PROPS TO BIND ******************************************/
/**
 * Properties to bind to repl context (available at top level in repl)
 */
const ctxProps = {
    // Helper libraries
    // bluebird,
    lodash,
    l_: lodash,
    madUtils,
    m_: madUtils,
    ls,

    // Date handling
    moment,

    // Logging & object info-related
    inspect,

    // package.json content
    // packageJson,
};

/**
 * Extra descriptions for bound properties
 */
const descriptions = {
    l_: `lodash alias`,
    m_: `mad-utils alias`,
};

// Attach props to REPL (repl is in repl setup)
bindPropsToRepl(ctxProps, descriptions);
