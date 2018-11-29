import fs from 'fs';

/**
 * Is the given inode a directory?
 */
const isDir = (inode: string): boolean => fs.lstatSync(inode).isDirectory();

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

/**
 *  View content of current directory. Labels directories with [D]
 *  WARNING: MUST BE STORED AS MUTABLE VALUE!
 */
export let ls = buildLs(curDir);
