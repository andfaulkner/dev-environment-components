process.setMaxListeners(0);
require('events').EventEmitter.prototype._maxListeners = 100;
require('rootpath')();

var _ = require('lodash');
var gulp = require('gulp');
var ts = require('gulp-typescript');
var path = require('path');

var PATHS = {
  typescript: ['./docs_guides/src_typescript/**/*.ts', './docs_guides/src_typescript/**/*.tsx'],
  js_build:   './docs_guides/build_js'
};

var tsConfig = require(path.join(__dirname, 'tsconfig.json')).compilerOptions;

/**
 * Render typescript files to javascript - for NodeJS-only (non-browser) code
 */
gulp.task('typescript', () => {
  return gulp.src(PATHS.typescript)
    .pipe(ts(tsConfig))
    .pipe(gulp.dest(PATHS.js_build));
});

/**
 * Watch for changes
 */
var rerunOnChange = (() => {
  gulp.watch(PATHS.typescript, ['typescript']);
});

/**
 * Build the app
 */
gulp.task('default', ['typescript'], function() {
  return rerunOnChange();
});
