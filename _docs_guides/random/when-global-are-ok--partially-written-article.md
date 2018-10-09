When globals are OK in JS

I almost universally avoid global variables and strongly agree with the reasons why it's a good idea to do so:
- issues with variable clobbering
- difficulty tracing changes (if they're not deep-frozen) and high potential for "action-at-a-distance" effects
- the need for ever-increasing variable lengths if commonly using them
- tight coupling and difficulty safely changing them (since the entire application effectively inherits from them)
- increased unit testing complexity
 
However, I've run into a small number of scenarios where any solution but a single global variable becomes incredibly unwieldy to work with.

For example, passing deep-frozen config objects (it's 1-layer deep) injected by the server (translation strings) that are used by separate sections of the application (i.e. from separate script tags) - e.g. 

    <script>
    // The below key comes from an isomorphic config object, so it's
    // guaranteed to stay in sync between this script tag & others using it,
    // and never needs to be referenced directly
     window[
        '____POLYGLOT_TRANSLATIONS_MANAGER_INSTANCE___HYDRATED_WITH_CURRENT_LOCALE_DATA____'
    ] = Object.freeze({
        about: 'About',
        ...etc...
    });
    </script>

Then later, in module-bundled code file `get-translations.ts`:
    
    export const translate = new Polyglot(config.translationsNamespace);

And in any module where it's needed:

    import {translate} from `@myOrgNamespace/core-imports`; // <- Long story

    const aboutValue = translate(`about`);

For a variety of reasons, the server needs to inject it dynamically, but the only file it has safe, simple access to is the HTML root.

Using any here but a global ends up being incredibly messy and overly complicated.

# Alternatives, and why they're even more problematic
## Inject into the main JS bundle
We could also solve this by allowing the server to access to the main JS bundle, and include a static injection point in a comment.
However, this is an extremely error-prone approach, for several reasons:

1) If anyone even slightly changes the comment, the injection will no longer occur, with no indicator as to the reason why, or any advance warning

2) Performance. An entire file must be loaded into memory and scanned with a regex to inject a string, which has considerably less overhead with a small 1-5kb HTML text file than a 500kb+ JS bundle. 

3) Safety. There's far greater potential for erratic behaviour in a large, complex webpack bundle than in a small HTML file. For example, if the injection comment gets reused in another file, the JS object string could easily end up injected into the wrong location.

## Inline import the translation JSON file in an import tag, allowing Webpack to bundle it in
This has significant performance overhead, because there's no way for the app to know which language to grab unless we build multiple bundles for different languages (that's actually an option too). All languages' JSON files would get imported in this scenario, greatly (and needlessly) increasing the bundle size

##
