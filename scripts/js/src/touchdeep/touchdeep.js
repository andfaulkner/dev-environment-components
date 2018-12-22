/**************************************************************************************************
 *
 *     @file ./touchdeep.js
 *
 *     Create new file like bash's standard 'touch', recursively creating all
 *     directories on the way
 *
 *     Example:
 *         touchdeep abc/def/new_file.ext
 *         - If file already exists at ./abc/def/new_file.ext, exits
 *         - If not already present, creates ./abc and ./abc/def
 *         - Creates empty file (new_file.ext) at path ./abc/def/new_file.ext
 *
 */


/******************************************** IMPORTS *********************************************/
const path = require('path');
const fs = require('fs');

/*************************************** ARGUMENT HANDLING ****************************************/
if (process.argv.length < 3) {
    console.log(`Too few arguments given (must receive 1)`);
    console.log(`Usage: touchdeep path/to/create/file.at`);
    process.exit(1);
}

const newFilePath = process.argv[2];

// Exit immediately if file at path already exists
if (fs.existsSync(newFilePath)) process.exit(0);

/****************************************** BUILD FILES *******************************************/
// If needed, create new directories recursively
const newINodes = newFilePath.split(path.sep);
if (newINodes.length > 0) {
    const newDirs = newINodes.slice(0, -1);
    newDirs.reduce((prevPath, curDir) => {
       const curPath = path.join(prevPath, curDir, path.sep);
        if (!fs.existsSync(curPath)) fs.mkdirSync(curPath);
        return curPath;
    }, ``);
}

// Create new file
fs.writeFileSync(newFilePath, ``);

process.exit(0);
