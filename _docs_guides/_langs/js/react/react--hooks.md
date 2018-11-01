----------------------------------------------------------------------------------------------------
# React hooks
----------------------------------------------------------------------------------------------------
Basic info
==========
Definition
----------
Functions that let you "hook into" React state & lifecycle features from SFCs,
to let you use React features without classes (e.g. state)

### More info
Because they're regular JavaScript functions, you can combine React's built-in
Hooks to make your own "custom hooks"

They apply the React philosophy (explicit data flow & composition) inside a
component (SFC), rather than just between the components.

Hooks provide access to imperative escape hatches and don’t require use of
complex functional or reactive programming techniques.

### GOTCHAS
*   They don’t work inside classes (since they let you use React without classes)

The problem
-----------
*   Components have to render UI, which makes them inconvenient for sharing
    non-visual logic
*   Functions are convenient for code reuse, but can't have React local state in them
    *   Prevents extracting certain behaviour
        *   e.g.:
            *   watch window size and update the state
            *   animate a value over time" from a class component
        *   ...without restructuring code or adding an abstraction like Observables
        *   Hooks solve this problem

Purpose
-------
*   Reuse of stateful logic between components
*   Ability to break down complex components
*   Use of numerous React features previously requiring classes
*   Easier AST traversal

Benefits
--------
*   No introduction of unnecessary nesting in the component tree (like HOCs)
*   No drawbacks of mixins
*   Lets you always use functions (if you want) instead of having to constantly
    switch between functions, classes, higher-order components, & render props

Impact
------
*   Increases React only by approximately 1.5kB
*   Shrinks build output: code using Hooks tends to minify better than equivalent code using classes
*   No breaking changes


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
Usage
=====
General syntax of hook usage:

    import {someHook} from 'react';

    function SomeComponent() {
        // Use someHook here
    }

State hook
----------
Hook name: `useState`

### Syntax
    const [currentState, setCurrentState] = useState(initialStateValue);

### Usage
*   Call inside a function component to add some local state to it
*   Preserves this state between re-renders
*   Returns a "pair" (array with 2 items):
    *   The current state value [0]
    *   A function that lets you update it [1]
        *   Can call from an event handler or elsewhere
        *   Similar to setState but doesn't merge old & new state together
*   Takes 1 argument: the initial state
    *   Can be any type: object, number, etc
    *   Initial state only used during the 1st render

### Example:
```
import {useState} from 'react';

function SomeComponent() {
    // Make new state variable (we'll it call "count") & set initial state to 0
    const [count, setCount] = someHook(0);
    return (
        <div>
            <p>You clicked {count} times</p>
            <button onClick={() => setCount(count + 1)}>Click me</button>
        </div>
    );
}
```

----------------------------------------------------------------------------------------------------
TODO: Finish this mini-guide - it is currently a WIP.
TODO: complete tutorial as https://reactjs.org/docs/hooks-intro.html
----------------------------------------------------------------------------------------------------
