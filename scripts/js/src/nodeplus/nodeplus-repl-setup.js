// @ts-check

/************************************** THIRD-PARTY MODULES ***************************************/
/**
 * Lodash module
 */
const _ = require('lodash');

const fs = require('fs');
const path = require('path');
const repl = require('repl');
const util = require('util');
const vm = require('vm');

// @ts-ignore
const commonTags = require('common-tags');
const {oneLine} = commonTags;

// @ts-ignore
const appRootPath = require('app-root-path');
const rootPath = appRootPath.path;

// @ts-ignore
const madUtils = require('mad-utils/lib/shared');

const {
    defineImmutableProp,
    defineMutableProp,
    getArgNames,
    inspectKeyTree,
    isRegexString,
    getFlagsFromRegexString,
    removeSurroundingQuotes,
    removeSlashesFlagsSurroundingRegexString,
    get,
    toCamelCase: convertToCamelCase
} = madUtils;

const getArgs = getArgNames;

/******************************************* START REPL *******************************************/
const prompt = `> `;

// @ts-ignore
String.prototype.toCamelCase = function toCamelCase() {
    // @ts-ignore
    return convertToCamelCase(this);
};

/**
 * Actual REPL object
 */
const r = repl.start({
    prompt,
    useGlobal: true,
    // ignoreUndefined: true,
    writer: output => {
        if (output === `--<__BLOCK_OUTPUT__>--`) return ``;
        return util.inspect(output);
    }
    // eval: (cmd, context, filename, callback) => {
    //     const cleanCmd = cmd.replace(/\n$/, ``);
    //     // console.log(`callback:`, callback.toString());
    //     if (!cleanCmd) {
    //         r.clearBufferedCommand();
    //         process.stdout.write(prompt);
    //     } else {
    //         callback(null, vm.runInThisContext(cleanCmd));
    //     }
    // }
});

// Add REPL history file
const historyFile = path.join(rootPath, `.node_history`);

const replHistory = require('repl.history');
replHistory(r, historyFile);

// Add IN_REPL property to repl environment
// Acts as identifier that REPL is currently running
defineImmutableProp(r.context.process.env, `IN_REPL`, true);

/**
 * Display props bound to repl context, with descriptions for each specified in
 * descriptions prop
 * @param {Object} ctxProps - Bind each given value to its corresponding key
 *                            e.g. {_: lodash, _m: madUtils, Promise: bluebird}
 * @param {Object} descriptions - Optional matching descriptions to display
 *                                beside prop with given key :: {[key: string]: string}
 *                 e.g.: {_: `lodash alias`, bluebird: `promises library`}
 */
const displayProps = (ctxProps, descriptions) => {
    console.log(`\nCustom properties bound to the top-level context:`);

    // Iterate through the given context properties
    /**
     * @param {string} key
     * @param {Object} val
     */
    for (let [key, val] of _.toPairs(ctxProps)) {
        // Display prop and (if defined) prop description on repl boot
        if (descriptions[key]) {
            console.log(` * ${key}: ${descriptions[key]}`);
            // If prop description provided, bind it to the object in the context
            defineImmutableProp(val, `__repl_description__`, descriptions[key]);
        } else {
            console.log(` * ${key}`);
        }
    }

    process.stdout.write(prompt || `> `);
};

/******************************************** HELPERS *********************************************/
/**
 * Bind given properties to the repl context, with the given values
 * Display as list on repl load, with descriptions for each specified in
 * descriptions prop
 *
 * Example: bindPropsToRepl(repl.start(), {_: lodash, projData}, {_: `Util lib`})
 *
 * @param {Object} ctxProps - Bind each given value to its corresponding key
 *                            e.g. {_: lodash, _m: madUtils, Promise: bluebird}
 * @param {Object} descriptions - Optional matching descriptions to display
 *                                beside prop with given key :: {[key: string]: string}
 *                 e.g.: {_: `lodash alias`, bluebird: `promises library`}
 * @param {string} [prompt] - Prompt string
 * @return {repl.REPLServer} REPL object
 */
const bindPropsToRepl = (ctxProps, descriptions, prompt) => {
    console.log(`\nWelcome to the enhanced Node.js REPL!`);

    // Iterate through the given context properties
    /**
     * @param {string} key
     * @param {Object} val
     */
    for (let [key, val] of _.toPairs(ctxProps)) {
        // Add current prop's value to repl context. Mutable if requested,
        // immutable otherwise
        if (typeof val === `object` && get(val, `val`) && get(val, `mutable`)) {
            defineImmutableProp(r.context, key, get(val, `val`));
        } else {
            defineImmutableProp(r.context, key, val);
        }
    }

    displayProps(ctxProps, descriptions);
    return r;
};

/******************************************* LOGGING *********************************************/;
/**
 * Run when inspect is called in the repl
 */
const inspect = (...args) => {
    console.log(
        ...args.map(arg => {
            if (typeof arg === `function`) return arg.toString();
            return util.inspect(arg);
        })
    );
    return util.inspect(args[0]);
};

// Bind getArgs to inspect object
defineImmutableProp(inspect, `getArgs`, getArgs);

/**
 * Powerful key inspection tool
 * Shows keys of object and all objects in its prototype chain
 * Displays object name at each layer in the chain
 * @param {Object} obj Object to get the keys of
 * @param {Object} showHidden If true, also display hidden keys
 * @param {boolean} showKeyPosInProtoChain If true, log objects showing each
 *                                         key's prototype chain position & the
 *                                         associated objects' names
 * @return {string[]} List of keys in obj & its prototype chain, with hidden
 *                    keys if showHidden=true
 */
const keys = (obj, showHidden = true, showKeyPosInProtoChain = false) => {
    const prevMaxArrLen = 0 + util.inspect.defaultOptions.maxArrayLength;
    util.inspect.defaultOptions.maxArrayLength = Infinity;

    const allKeys = inspectKeyTree(obj, showHidden, showKeyPosInProtoChain);

    util.inspect.defaultOptions.maxArrayLength = prevMaxArrLen;
    return allKeys;
};

/***************************** DIRECTORIES / NAVIGATION / FILESYSTEM ******************************/
/**
 * Is the given iNode (file, dir, socket, etc) a directory?
 * @param {string} iNode path
 * @return {boolean}
 */
const isDir = iNode => fs.lstatSync(iNode).isDirectory();

/**
 * Is the given path an absolute path?
 * @param {string} newPath
 * @return {boolean}
 */
const isAbsPath = newPath => !!newPath.match(/^\//);

/**
 * @param {string} newPath
 * @return {boolean} True if directory is within project
 */
const isWithinProj = newPath => !!newPath.match(new RegExp(`^` + rootPath));

/**
 * Build list of all directories in given inode
 * @param {string} dirPath
 * @return {string[]}
 */
const buildLs = dirPath =>
    fs.readdirSync(dirPath).map(inode => (isDir(inode) ? `[D]  ${inode}` : `     ${inode}`));

/**
 * Store current directory
 * WARNING: MUST BE STORED AS MUTABLE VALUE!
 */
let curDir = process.cwd();
console.log("curDir:", curDir);

/**
 *  View content of current directory. Labels directories with [D]
 *  WARNING: MUST BE STORED AS MUTABLE VALUE!
 */
let ls = buildLs(curDir);

// TODO Clean up cd implementation and code it's using
/**
 * Change directory to given path. Prevents exiting project
 * @param {string} newPath Relative or absolute path to chagne directory to
 */
const cd = newPath => {
    // Temp storage of path
    // const curDirTemp = `` + curDir;

    // // Handle absolute vs relative paths appropriately
    // curDir = isAbsPath(newPath) ? newPath : path.join(curDir, newPath);

    // // Prevent navigation out of project directory
    // if (!isWithinProj(curDir)) {
    //     curDir = curDirTemp;
    //     return console.log(`ERROR :: Cannot navigate below project root: ${rootPath}`);
    // }

    // Ensure cd succeeds - roll back stored current directory if it fails
    try {
        process.chdir(newPath);
        curDir = process.cwd();
    } catch (error) {
        // process.chdir(curDir);
        // curDir = curDirTemp;
        return console.log(`Directory ${newPath} doesn't exist:`, error);
    }

    return curDir;

    // // Store new path and path dir contents in appropriate global properties
    // defineMutableProp(r.context, `pwd`, curDir);
    // ls = buildLs(curDir);
    // defineMutableProp(r.context, `ls`, ls);
    // return curDir;
};

/**
 * Output content of file at given relative or absolute path (if possible)
 * @param {string} filePath
 */
const cat = filePath =>
    fs
        .readFileSync(filePath)
        .toString()
        .split(`\n`);

/******************************************** HISTORY *********************************************/
/**
 * Display REPL history. Only include items matching matchInput
 * @param {boolean} showNums If true, display line # beside each command
 *                           e.g. [741] const a = `zz`
 * @param {RegExp|string} [matchInput] Only display items containing the given string
 *                        Excludes bookend quotes, but uses all spaces etc
 *                        between them as the value
 */
const history = (showNums = true) => (matchInput = ``) => {
    const currentHistory = util.inspect.defaultOptions.maxArrayLength;
    util.inspect.defaultOptions.maxArrayLength = null;

    // Get history from the repl history file
    const lines = cat(historyFile).map((hist, idx) => [idx, hist]);

    // Filter non-matching lines out (if filtering is being done)
    const matcher = typeof matchInput === `string` ? new RegExp(matchInput) : matchInput;
    const outLines =
        matchInput && matcher instanceof RegExp
            ? lines.filter(hist => {
                  const matchInHist = hist[1];
                  return typeof matchInHist === 'string' && matcher.test(matchInHist);
              })
            : lines;

    // Display all lines not filtered out
    outLines.forEach(outLine =>
        showNums ? console.log(` [${outLine[0]}]  ${outLine[1]}`) : console.log(`${outLine[1]}`)
    );

    util.inspect.defaultOptions.maxArrayLength = currentHistory;
};

/**
 * Create filterable command history
 * @param {boolean} showNums If true, show history item number beside each line
 *                           e.g. [18] let a = 1
 * @return {Function} With signature: (filter) => void
 */
const filteredHist = function filteredHistNoNum(showNums = true) {
    /**
     * @this {REPLServer}
     * @param {string} filter String to match against
     *                        Only return items containing given string
     */
    return function filteredHist(filter = ``) {
        this.bufferedCommand = ``;
        const cleanFilter = removeSurroundingQuotes(filter);

        /** @type {string} preppedFilter */
        let preppedFilter = cleanFilter;
        if (isRegexString(cleanFilter)) {
            const regxStr = removeSlashesFlagsSurroundingRegexString(cleanFilter);
            const regxFlags = getFlagsFromRegexString(cleanFilter);
            // @ts-ignore
            if (regxStr && regxFlags != null) preppedFilter = new RegExp(regxStr, regxFlags);
        }

        history(showNums)(preppedFilter);
        this.displayPrompt();
    };
};

/************************************** ADD CUSTOM COMMANDS ***************************************/
/**
 * Filtered repl history with numbered lines
 */
// @ts-ignore
r.defineCommand(`hist`, {
    help: oneLine`
        Display all repl history items matching given string (or full history if none
        given), with a line number included to the left of each line e.g. [1852] var i = 14;`,
    action: filteredHist(true)
});

/**
 * Filtered repl history without numbered lines
 */
// @ts-ignore
r.defineCommand(`histnonum`, {
    help: oneLine`Display all repl history items matching given string
                  (or full history if none given), with no line number included`,
    action: filteredHist(false)
});

module.exports = {
    r,
    bindPropsToRepl,
    displayProps,
    inspect,
    keys,
    cd,
    ls,
    cat,
    history,
};
