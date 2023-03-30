---------------------------------------------------------------------------------------------------
# React hooks
---------------------------------------------------------------------------------------------------

Basic info
==========
Definition
----------
-   They let FCs act like classes, and make state-based logic reusable.

-   Functions that let you "hook into" React state & lifecycle features from FCs,
    to let you use React features without classes (e.g. state).

### More info
-   They're regular JavaScript functions, so you can combine React's built-in hooks
    to make "custom hooks."

-   Hooks apply the React philosophy (explicit data flow & composition) inside a
    component (FC), rather than just between the components.

-   Hooks provide access to imperative escape hatches and don’t require use of
    complex functional or reactive programming techniques.

### GOTCHAS
-   They don’t work inside classes (since they let you use React without classes)


The problem
-----------
-   Components have to render UI, which makes them inconvenient for sharing
    non-visual logic.
-   Functions are convenient for code reuse, but can't have React local state in them.
    -   Prevents extracting certain behaviour:
        -   e.g.:
            -   Watch window size and update the state.
            -   Animate a value over time from a class component.
        -   ...without restructuring code or adding an abstraction like Observables.
        -   Hooks solve this problem.


Purpose
-------
-   Reuse of stateful logic between components.
-   Ability to break down complex components.
-   Use of numerous React features previously requiring classes.
-   Easier AST traversal.


Benefits
--------
-   No introduction of unnecessary nesting in the component tree (like HOCs).
-   No drawbacks of mixins.
-   Lets you always use functions (if you want) instead of constantly switching
    between functions, classes, HOCs, & render props.


Impact
------
-   Increases React only by approximately 1.5kB.
-   Shrinks build output: code using Hooks tends to minify better than
    equivalent code using classes.
-   No breaking changes.


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
Usage
=====
General syntax of hook usage
----------------------------
    import {someHook} from 'react';

    function SomeComponent() {
        // Use someHook here
    }


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
Common hooks
============
useState: state hook
--------------------
Provides local state to an FC.

### Syntax

```
const [currentState, setCurrentState] = useState(initialStateValue);
```

### Usage
-   Call inside a function component to add some local state to it.
-   Preserves this state between re-renders.
-   Returns a "pair" (array with 2 items):
    -   The current state value [0].
    -   A function that lets you update it [1].
        -   Can call from an event handler or elsewhere.
        -   Similar to setState but doesn't merge old & new state together.
-   Takes 1 argument: the initial state.
    -   Can be any type: object, number, etc.
    -   Initial state only used during the 1st render.

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
useEffect: effect hook
----------------------
Perform side effects from an FC.

Serves the same purpose as the following React class lifecycle methods:
-   `componentDidMount`
-   `componentDidUpdate`
-   `componentWillUnmount`

### Usage
-   When you call useEffect, you’re telling React to run your "effect" function
    after flushing changes to the DOM.
-   Effects have access to an FC's props & state, since they're declared
    inside the FC.
-   Runs the effects after every render, including the first render.
-   Can optionally specify how to "clean up" after them by returning a function.
-   Can use more than one in an FC.

-   Lets you organize side effects in an FC by what pieces are related (e.g.
    adding & removing a subscription), rather than forcing a split based on
    lifecycle methods.

### Sample uses
From within React FCs:
-   Perform data fetching.
-   Subscribe (to incoming data).
-   Manually change the DOM.

### Example
```
import {useState, useEffect} from 'react';

function SomeComponent() {
    const [count, setCount] = useState(0);

    // Similar to componentDidMount & componentDidUpdate
    useEffect(() => {
        // Update document title using browser API - a side effect
        document.title = `You clicked ${count} times`;

        // Optional "clean up" behaviour run on FC unmount
        return () => {
            console.log(`Run this when component unmounts`)
        }
    });

    return (
        <div>
            <p>You clicked {count} times</p>
            <button onClick={() => setCount(count + 1)}>Click me</button>
        </div>
    );
}
```

----------------------------------------------------------------------------------------------------
useCallback
-----------
Rarely needed - solely required for optimization in extreme scenarios (Issue: adds complexity).
-   Use only when you have a component in which a child is rendering repeatedly without the need for it.

Wrap a regular function with this to prevent components the function is passed to from
re-rendering every time the component containing the function re-renders.

Dependencies are passed in an array given to the second parameter.
If an empty array is passed, the function gets executed only once.

### Example
```
import {useState, useEffect, useCallback} from 'react';

const SomeComponent = () => {
    const [age, setAge] = useState(25);
    const [name, setName] = useState('Joe');

    const incrementAge = useCallback(() => {
        setAge(age + 1);
    }, [age]);

    const changeName = useCallback((newName: string) => {
        setName(newName);
    }, [name]);

    return (
        <div>
            <AgeDisplay age={age} />
            <NameDisplay name={name} />
            // Never re-renders when parent re-renders, thanks to useCallback
            <PlusButton incrementAge={incrementAge} />
            // Also never re-renders when parent re-renders, thanks to useCallback
            <NameInput changeName={changeName} />
        </div>
    )
};
```

----------------------------------------------------------------------------------------------------
useContext: context hook
------------------------
-   When the provider updates, this Hook will trigger a rerender with the latest context value

### Example
```
import {useState, useEffect} from 'react';

function SomeComponent() {
    const context = useContext(Context);
}
```


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
Rules of hooks
==============
1.  Always use hooks at the top level of your React FC

2.  Don't call hooks inside loops, conditions, or nested functions.

    -   Easier if always used at the top level of an FC.
        -   Why? Ensures Hooks are called in the same order each time an FC renders.
            -   It breaks the state if they're not called in the same order each time.
            -   IMPORTANT: React relies on the order in which Hooks are called.

3.  Related: DO NOT make hook calls conditional.

4.  Don’t call hooks from regular JavaScript functions - only call them from:
    -   React FCs
    -   Custom hooks

5.  Don't call hooks from React classes.

---

TODO: Finish this mini-guide - it is currently a WIP.
TODO: complete tutorial as https://reactjs.org/docs/hooks-intro.html

---
