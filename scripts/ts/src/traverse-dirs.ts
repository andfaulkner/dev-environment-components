#!/usr/bin/env ts-node

/***************************************************************************************************
 *
 *      @file ./traverse-dirs.ts
 *
 *      List relative paths to all files in current and child directories
 *      For more info, read usage below, or run:
 *         traverse-dirs.ts --usage
 */

declare global {
    interface Array<T> {
        compact: <T = any>(all?: boolean) => T[];
        clone: <T = any>() => T[];
    }
}

Array.prototype.compact = function compact() {
    return this.filter(item => !!item);
};

Array.prototype.clone = function() {
    return this.slice(0);
};

/******************************************** IMPORTS *********************************************/
import fs from 'fs';
import path from 'path';
import yargs from 'yargs';

const argv = (yargs.argv as any) as {
    showHidden: boolean;
    usage: boolean;
    help: boolean;
    h: boolean;
    withPathPrefix: boolean;
    _: string[];
    $0: string;
};

// prettier-ignore
if (argv.usage || argv.help || argv.h) {
    console.log(
`
Display relative paths of all files in current and all child directories.

Usage:
    traverse-dirs

To show hidden files and directories (hidden by default):
    traverse-dirs --show-hidden

To show hidden files and directories (hidden by default):
    traverse-dirs --show-hidden

To show info:
    traverse-dirs -h
    traverse-dirs --help
    traverse-dirs --usage
`
    );
    process.exit(0);
}

/**
 * Store all files found
 */
const allFiles = [];

/******************************************** HELPERS *********************************************/
/**
 * Get all files in the directory at the given relative path [relPath]
 */
const getFiles = (relPath: string) =>
    fs
        .readdirSync(relPath)
        .map(iNode => {
            const curPath = path.join(relPath, iNode);
            return fs.statSync(curPath).isFile() && !iNode.match(/^\./g) && curPath;
        })
        .compact();

/**
 * Non-recursively get all directories and in the directory at the given
 * relative path [relPath]
 */
const getDirs = relPath =>
    fs
        .readdirSync(relPath)
        .map(iNode => {
            const curPath = path.join(relPath, iNode);
            return (
                // Only show directories
                !fs.statSync(curPath).isFile() &&
                // Hide hidden directories
                (argv.showHidden || !iNode.match(/^\./g)) &&
                // Return relative file path
                curPath
            );
        })
        .compact();

/**
 * Recursively get all directories and in the directory at the given relative
 * path [relPath]
 */
const getAllDirs = (relPath: string) => {
    const dirs = getDirs(relPath);
    dirs.forEach(dir => {
        const files = getFiles(dir);
        files.forEach(file => allFiles.push(file));
        getAllDirs(dir);
    });
    return allFiles;
};

const getAllFilesInAllDirs = (rootPath: string) => {
    const files = getFiles(rootPath);
    files.forEach(file => allFiles.push(file));
    const outFiles = getAllDirs(rootPath);
    return outFiles.map(file => file.replace(`${rootPath}/`, ``));
};

/******************************************* RUN SCRIPT *******************************************/
// Run script
const allFilesClean = getAllFilesInAllDirs(process.env.PWD)
    .compact()
    // Filter results of running script
    .filter(file => argv.showHidden || !file.match(/^\./));

// Display results (all unfiltered files in current and child directories)
allFilesClean.forEach(file =>
    console.log((argv.withPathPrefix ? `./` : ``) + file.replace(process.env.PWD + `/`, ``))
);
