/**************************************************************************************************
 *
 *     @file ./touchdeep.js
 *
 *     Create new empty file(s) like bash's standard 'touch' command,
 *     recursively creating all directories on the way
 *
 *     Examples:
 *
 *         touchdeep abc/def/new_file.ext
 *         - If file already exists at ./abc/def/new_file.ext, exits
 *         - If not already present, creates ./abc and ./abc/def
 *         - Creates empty file (new_file.ext) at path ./abc/def/new_file.ext
 *
 *         touchdeep abc/def/new_file.ext ./ghi/jkl/new_file2.ext2
 *         - Performs steps in previous example at both:
 *             ./abc/def/new_file.ext
 *             ./ghi/jkl/new_file2.ext2
 *
 */

/******************************************** IMPORTS *********************************************/
const path = require('path');
const fs = require('fs');

/*************************************** ARGUMENT HANDLING ****************************************/
// Show usage and exit with error if too few arguments given
if (process.argv.length < 3) {
    console.log(`Requires at least 1 argument.`);
    console.log(`Usage:`);
    console.log(`    touchdeep path/to/create/file.at`);
    console.log(`    touchdeep path/to/create/file.at ./2nd/path/new_file.ext`);
    process.exit(1);
}

// Get all paths to create file at
const pathArgs = process.argv.slice(2);

// Add all paths file creation failed at here
const failedPaths = [];

/****************************************** BUILD FILES *******************************************/
/**
 * Create new file at given path
 * @param {string} newFilePath
 */
function nodePlus(newFilePath) {
    // Exit immediately if file at path already exists
    if (fs.existsSync(newFilePath)) return;

    // Get full list of sub-paths (directories and files)
    const newINodes = newFilePath.split(path.sep);

    // Becomes true if any dirs in the path are already a file (an error condition)
    let fileFoundInDirList = false;

    // If needed, create new directories recursively
    if (newINodes.length > 0) {
        const newDirs = newINodes.slice(0, -1);

        newDirs.reduce((prevPath, curDir, idx) => {
            if (fileFoundInDirList) return;

            const curPath = path.join(prevPath, curDir, path.sep);

            // Ensure directory to create isn't already a file
            // End reduce & mark this path as an error
            if (idx < newDirs.length && fs.existsSync(curPath)) {
                const isFile = fs
                    .lstatSync(curPath.replace(new RegExp(path.sep, `g`), ``))
                    .isFile();
                if (isFile) fileFoundInDirList = true;
                return;
            }

            if (!fs.existsSync(curPath)) fs.mkdirSync(curPath);
            return curPath;
        }, ``);
    }

    // If given path is a directory, push path into failedPaths array & return
    if (fileFoundInDirList || (fs.existsSync(newFilePath) && !fs.lstatSync(newFilePath).isFile())) {
        failedPaths.push(newFilePath);
        return;
    }

    // Create new file
    fs.writeFileSync(newFilePath, ``);
}

// Run file creation for all given pathArgs
pathArgs.forEach(nodePlus);

// If file creation fails for any given path, display failed path & return error code
if (failedPaths.length > 0) {
    console.log(`Failed for paths:`);
    failedPaths.forEach(failedPath => console.log(`  ${failedPath}`));
    process.exit(1);
}

// Return success code if successfully created all files
else {
    process.exit(0);
}
