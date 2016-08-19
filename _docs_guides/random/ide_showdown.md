#Not really an IDE showdown.

##### TODO COMPLETE THIS

Sublime text
------------
###Pros
*   fast fast fast
*   ultra-high-speed search
*   awesome snippet handling and creation. Has very good regular expression support that makes
    Sublime snippets remarkably flexible and powerful, which saves a lot of time
*   Great plugin selection
*   Fantastic, extremely lightweight package manager
*   Relatively customizable

###Neutral
*   plugins written in Python. Easy to read, but unless you know Python, tricky to write or edit
*   few batteries included

###Cons
*   autocompletion for anything without snippets already defined is basically useless
*   very poor code exploration tools - even with plugins
*   useless static analysis
*   configuring linting is a pain in the ass
*   idiotic project handling, including a quirky and flawed file navigation sidebar (even with
    plugins used), and a confusing and overcomplicated method of making new projects

Atom
----
###Pros

###Neutral

###Cons


Visual Studio Code
------------------
###Pros

###Neutral

###Cons


Eclipse
-------
###Pros
*   Fantastic Java autocompletion
*   Excellent Java design-time debugging
*   Lots of great plugins
*   Awesome code exploration tools
*   Incredible tools for code navigation
*   Very good static analysis
*   Logging directly in the app is very good
*   Highly flexible layout customization

###Neutral
*   Workspaces.
    *   Very good for separation of project concerns and easier coding of intertwined projects
    *   Very bad for Eclipse responsiveness and speed. This can render it unusable or very painful
        to use depending on project size
*   Eclipse package management system. Slow and requires some overcomplicated annoying
    configuration to get going, but mostly does the job

###Cons
*   molasses slow
*   weird and complicated to customize
*   irritating snippets
*   somewhat CLI-adverse
*   it really wants you to do everything in Eclipse
    *   ...but makes certain things nearly impossible to do in Eclipse, then refuses to play nice
        with your outside solution without fighting kicking and screaming
        *   e.g. eGit
*   loves to crash
*   terrible for scripting languages - using it for scripting basically negates all advantages of
    scripting
*   total disdain for Javascript, almost actively fighting you every step of the way if you're
    writing it in Eclipse
*   Has a deeply flawed and outdated build mechanism built in that it strongarms you into using
    unless you fight with configuration and plugins, then accept that it will occasionally pop up
    again. Build tools are based on Ant, so configuring builds with code is unnecessarily verbose
    and inflexible unless you're an expert with it. However, doing it through the UI (which it deeply
    encourages) is very frustrating and needlessly complicated.
*   hell to import dependencies into projects
*   nightmarish and extremely time-consuming to initially configure
*   agonizing to work on a project with anyone not also using Eclipse as their IDE...and vice versa
    (thanks to how it bullies you into using its build system)
*   memory leaks like a sieve, requiring intermittent restarts that are extremely time-consuming

Vim
---
###Pros
*   highly configurable, perhaps rivalled only by Emacs
*   blazing fast
*   available absolutely everywhere
*   fantastic plugin community
*   "modal" editing has a lot of interesting advantages, and is virtually unique to vim

###Neutral
*   absolutely no batteries included

###Cons
*   Vimscript is a horrible language
*   autocompletion is really difficult to set up, and very flaky
*   snippet insertion and creation is unintuitive, complicated, and seems to mostly not be worth
    the effort
*   disdain for mice, even when it's the best tool for a certain job
*   copying text between files, or out of vim to another editor is extremely annoying
