process.setMaxListeners(0);
require('events').EventEmitter.prototype._maxListeners = 100;
require('rootpath')();

var _ = require('lodash');
var gulp = require('gulp');
var ts = require('gulp-typescript');

var PATHS = {
  typescript: './docs_guides/src_typescript/**/*.ts',
  js_build:   './docs_guides/build_js'
};

var tsConfig = {
  target:                     'ES5',
  noImplicitAny:              false,
  experimentalDecorators:     true,
  experimentalAsyncFunctions: true,
  allowJs:                    true
  // experimentalAsyncFunctions: true,
  // allowJS:                    true
};

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
