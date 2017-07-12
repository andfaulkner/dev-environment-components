process.setMaxListeners(0);
require('events').EventEmitter.prototype._maxListeners = 100;
require('rootpath')();
var postcssPropertyLookup = require('postcss-property-lookup');

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
const rerunOnChange = (() => {
  gulp.watch(PATHS.typescript, ['typescript']);
});

/**
 * Build the app
 */
gulp.task('default', ['typescript'], function() {
  return rerunOnChange();
});

function funcOk () {

}

const constOk = () => {

}

let letOk = () => {

}

let varOk = () => {

}

const funcConstOk = function() {

}

let funcLetOk = function() {

}

let funcVarOk = function() {

}
// js:
//     source.js
//     meta.function.declaration.js
//     variable.other.readwrite.js
//     entity.name.function.js
// ts:
// 
const constFuncOk = function() {

}

class ClassOk {
    constructor () {
        super();
        'first to run in a class';
    }
    asdfasdfasdf = () => {

    }
    render() {

    }
    ok = 'okokokok'
    ok = 123

    // source.tsx
    // meta.class.tsx
    // meta.field.declaration.tsx
    // meta.definition.property.tsx
    // variable.object.property.tsx
}