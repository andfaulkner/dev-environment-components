Verbose Debug Information: Node 94 (NullKeyword) was unexpected
===============================================================
*   Cause: you can't attach (property) decorators to properties of type null, even
    if null is merely one allowed type in a union type

Example 1
    Offending line:     `@format("Hello, %s") greeting: string | null;`
    Fix:                `@format("Hello, %s") greeting: string;`

Example 2
    Offending line:     `@observable somethingToWatch: null;`
    Fix:                `@observable somethingToWatch: any;`

Cause
-----
*   observables cannot examine "null"
*   in fact, you simply can't put a decorator on null


Warning: getDefaultProps is only used on classic React.createClass definitions
==============================================================================
Full error:
    Warning: getDefaultProps is only used on classic React.createClass definitions. Use a static property named `defaultProps` instead.

Cause
-----
*   usually seems to come from either: 
    1) having 2 copies of React in the page, or
    2) loading a module that relies on the presence of React before React is loaded

Solution
--------
*   examine your CDN loads, your Webpack externals, and your webpack-dll bundle


Module *some-module* was resolved to *something*.js, but --allowJs is not set
=============================================================================
Causes
------
*   allowJs setting must be a boolean true, not a string "true"
*   it's "allowJs", not "allowJS"
*   resolution of tsconfig used for a file: the most local tsconfig.json file - i.e. the one
    that's the fewest directories "up"
*   inheritance of a base tsconfig actually does work in the IDE - it should be configured
    correctly in there.

Cannot read property 'compilerOptions' of undefined
===================================================
*   Check that your tsconfig.json file is well-formed
    *   most commonly: ensure there's no trailing comma, that all keys are surrounded by quotes,
        that all quotes are double, and that all opening braces have a matching closing brace


Module parse failed: /a/file.ts Unexpected token (16:8). You may need an appropriate loader...
==============================================================================================
    Module parse failed: /a/file.ts Unexpected token (16:8). You may need an appropriate loader to handle this file type.

    Causes:
    Often simply due to an import pointing to a location where no file is present.
    Ensure your import / require paths are all correct.
        *   Note that you may need to look at consumers of the file showing errors rather than the
            file itself

Glut of errors in Webpack build, centered around invalid (S)CSS or (S)CSS lacking needed whitespace
===================================================================================================
Do not wrap your @import statements in css or scss files with :global { }
    *   This double-defines the imports as global
    *   Result is things like :global :global :global :global appHeader { /* things */ }
        *   this snowballs into recursion if there are circular imports, resulting in a
            monstrously large error output
Solution: Format your SCSS files like this:
    @import 'my-import.scss';
    @import 'my-second-import.scss';
    /** Etc. - all the rest of the file's imports go here */

    :global {
        .my-style { /** css code here */ }
        .another-style-here { /** more css code */ }
        /** Etc. - all the rest of the file's code goes in here */
    }

Project styles not showing up in the frontend at all
====================================================
If css-loader's modules option is set to true:
    options: {
        modules: true,
    }
...then anything not loaded with :global { } will only be available directly in the consuming module.
    * If modules are on, the default scope is local.
    * Any non-consumed local styles simply disappear.
        * You must set an owner (React component or .[jt]s(x?) file?) or declare modules global to keep them in the build.
    *  Place everything you need to be global inside the :global {} tags in the .scss files (see above)
    *  e.g.
        :global {
            .my-style { /** css code here */ }
            .another-style-here { /** more css code */ }
            /** Etc. - all the rest of the file's code goes in here */
        }
...but remember - DO NOT put @import statements within the :global{ } block.



