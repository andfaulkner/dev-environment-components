---------------------------------------------
# Sublime must-install packages
---------------------------------------------

Project
=======
    Exclude Paths

Code navigation / viewing
=========================
    BracketGuard
    Expand selection to whitespace
    Fold Comments
    Highlight Whitespaces
    JsonTree
    More Layouts

Search
======
    FindResultsApplyChanges
        *   Install from: https://github.com/titoBouzout/FindResultsApplyChanges
            *   Place in "Sublime Text 3/Packages/User"
    Copy from Find Results

Hotkeys
=======
    Chain of Command
        *   Multiple commands in a single hotkey
    Keymaps
    AltUp
        *   Add this hotkey as a corrollary (for alt-down):
              // Navigate downward using alt + down
              { "keys": ["alt+down"], "description": "nav down",
                "command": "chain", "args": {"commands": [
                    ["move", {"by": "lines", "forward": true}],
                    ["move", {"by": "stops", "empty_line": true, "forward": true}],
                    ["move", {"by": "lines", "forward": false}]
                ]}
              },


Previews
========
    Markdown Preview
    View in Browser

Sublime dev plugins
===================
    Plugin Debugger
    ScopeHunter
    ClearConsole

Sidebar
=======
    Focus file on sidebar
    SideBarEnhancements

Linting
=======
    SublimeLinter
    SublimeLinter-contrib-eslint
    SublimeLinter-contrib-tslint
    SublimeLinter-csslint
    SublimeLinter-json
    SublimeLinter-pylint

Completions
===========
    TypescriptCompletion
    Chai Completions
    Javascript Completions
    AutoFileName <<< AMAZING
    Auto Semi-Colon

Snippets
========
## Comments
    DocBlockr
## JS
    Babel Snippets
    Mocha snippets
    Javascript & NodeJS Snippets
    Javascript Snippets
    JS Snippets
    Node Assert Snippets
## HTML
    HTML Boilerplate
    HTML5
    HTMLAttributes


Formatting
==========
    Alignment
    Pretty JSON
        *   JSON cleanup
    JSONComma
        *   Lifesaving if you can't find the broken comma in a JSON file
        *   Add this to your settings:
            "jsoncomma_on_save": true
    JsFormat
        *   Also install:
            npm install -g jsformat
    ESFormatter
        *   Also install:
            npm install -g esformatter
    ESLint
        *   Also install:
            npm install -g eslint
    Javascript beautify
        *   Also install:
            npm install -g js-beautify
    Pretty YAML
    PostCSS Sorting


Languages
=========
    Typescript
    Kotlin
    LESS
    SCSS
    SASS
    Stylus
    Babel
    Gradle_Language
    JavascriptNext - ES6 Syntax
    JSX
    Swift
    Syntax Highlighting for PostCSS
    ToDone
    VimL

Files
=====
    File Rename
    Delete Current File
