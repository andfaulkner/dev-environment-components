import fs from 'fs';

/******************************************** HELPERS *********************************************/
/**
 * Is the given inode a directory?
 */
const isDir = (inode: string): boolean => fs.lstatSync(inode).isDirectory();

/**
 * Is the given path an absolute path?
 */
const isAbsPath = (newPath: string): boolean => !!newPath.match(/^\//);

/**
 * Build list of all directories in given inode
 */
const buildLs = (dirPath: string): string[] =>
    fs.readdirSync(dirPath).map(inode => (isDir(inode) ? `[D]  ${inode}` : `     ${inode}`));

/**
 * Store current directory
 * WARNING: MUST BE STORED AS MUTABLE VALUE!
 */
let curDir = process.cwd();

/********************************************* EXPORT *********************************************/
/**
 *  View content of current directory
 *  Labels directories with [D]
 *  WARNING: MUST BE STORED AS MUTABLE VALUE!
 */
export let ls = buildLs(curDir);

/**
 * Change directory to given path. Prevents exiting project
 * @param {string} newPath Relative or absolute path to chagne directory to
 */
export const cd = (newPath: string) => {
    // Temp storage of path
    const curDirTemp = `` + curDir;

    // Handle absolute vs relative paths appropriately
    curDir = isAbsPath(newPath) ? newPath : path.join(curDir, newPath);

    // Prevent navigation out of project directory
    if (!isWithinProj(curDir)) {
        curDir = curDirTemp;
        return console.log(`ERROR :: Cannot navigate below project root: ${rootPath}`);
    }

    // Ensure cd succeeds - roll back stored current directory if it fails
    try {
        process.chdir(curDir);
    } catch {
        curDir = curDirTemp;
        return console.log(`Directory ${curDir} doesn't exist`);
    }

    // Store new path and path dir contents in appropriate global properties
    defineMutableProp(r.context, `pwd`, curDir);
    ls = buildLs(curDir);
    defineMutableProp(r.context, `ls`, ls);
    return curDir;
};
