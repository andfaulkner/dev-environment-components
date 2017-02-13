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

'development' = 'development' || 'development'
==============================================
*   Check your Webpack value 'injector' plguins
    *   They sometimes inject values on the right side of the =

Redis isn't returning anything!
===============================
*   Are you using the prefix? Remember that most redis clients auto-include a prefix before all
    keys.

Component changing uncontrolled input type to be controlled (or vice versa)
===========================================================================
Full error:
    Warning: A component is changing an uncontrolled input of type text to be controlled. Input elements should not switch from uncontrolled to controlled (or vice versa). Decide between using a controlled or uncontrolled input element for the lifetime of the component

Cause and solution:
*   if you initially pass undefined or null as the value prop, the component starts life as an "uncontrolled" component.
*   Once you interact with the component (namely setting a value), React will change it to a "controlled" component
    *   at this point it issues the warning
*   solution: pass '' into value instead of undefined or null
    *   often caused by passing an undefined variable to a React component's value prop.

Example: React component:
```tsx
    const address;
    //...
    // inside a react component:
    state = {
        email: address
    }

    changeEmail = (data) => {
        this.setState({ email: data });
    }
    //...
    // in render function of same component:
    <input value={this.state.email} type="text" name="email" onChange={changeEmail}/>
```
*   the above will trigger the error as soon as you attempt to type in the input box, because
    initially setting prop value to undefined (since const state.email is undefined) results
    in React considering the component "uncontrolled". Then as soon as you change it, React
    begins considering it controlled, which React considers bad practice.

Cannot convert Symbol to [whatever]
===================================
*   ensure you're not using the arguments keyword - it's now deprecated.

Routes are not longer resolving correctly, when they were prior to some innocuous change
========================================================================================
*   If the change involved adding a module, and the module has ../../../etc paths, check to
    see if the module is now resolving to a slightly different directory in the build
    *   sometimes the build resolution 'path' changes based on the present or non-presence of
        modules at certain paths / in subdirectories.
        *   This mainly has to do with depth of directory
        *   you may have to change the output directory
            *   HOWEVER...careful with this. This can have other side effects

React-router 4 refuses to return anything - With 'Element type is invalid message'
==================================================================================
Full error: 
    Element type is invalid: expected a string (for built-in components) or a class/function but
    got: object  
        OR
    Element type is invalid: expected a string (for built-in components) or a class/function but got: undefined

*   make sure you import BrowserRouter and Router, and Link from 'react-router-dom' 
    *   it actually doesn't work from react-router, no matter what it resolves to.

Error: Could not locate the bindings file -when running 
========================================================

    npm uninstall -g node-gyp
    npm install -g node-gyp
    npm uninstall node-gyp
    npm install node-gyp

*   if any individual packages showed up in the error list: (example):

    npm uninstall argon2
    npm install argon2

*   reason: you need to reinstall the C++ / native bindings - something messed them up. Annoyingly,
    this seems to happen easily.

In compilation: Conflicting versions of an 3rd-party uninstalled module when npm link'ing pkgs
==============================================================================================
*   install an explicit version of the package in both repos
*   it seems to occur an @types package has another @types as a dependency, in cases where the
    given @types module is installed in both projects (the module and the one it's being linked to).
*   npm link'ed scenarios: where one package is doing npm link to include another.
*   example offender: https://www.npmjs.com/package/@types/express-serve-static-core

In compilation: npm link'ing: 1000000 type errors when project included
=======================================================================
*   enter the offending compilation step's tsconfig.json
*   explicitly exclude folders in the link'ed module
*   this is a horrible, painful, slow fix, but it will work
*   there is (as of Feb 11th, 2017), no known elegant solution
    *   https://github.com/Microsoft/TypeScript/issues/10250
    *   http://www.typescriptlang.org/docs/handbook/tsconfig-json.html
    *   https://github.com/ReactiveX/rxjs/issues/1858

