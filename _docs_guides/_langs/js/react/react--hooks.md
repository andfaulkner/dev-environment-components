---
# React hooks
---

---

# Basic info

## Definition

They let SFCs act like classes, and make state-based logic reusable.

Functions that let you "hook into" React state & lifecycle features from SFCs,
to let you use React features without classes (e.g. state).

### More info

They're regular JavaScript functions, so you can combine React's built-in hooks
to make "custom hooks."

Hooks apply the React philosophy (explicit data flow & composition) inside a
component (SFC), rather than just between the components.

Hooks provide access to imperative escape hatches and don’t require use of
complex functional or reactive programming techniques.

### GOTCHAS

-   They don’t work inside classes (since they let you use React without classes)

---

## The problem

-   Components have to render UI, which makes them inconvenient for sharing
    non-visual logic.
-   Functions are convenient for code reuse, but can't have React local state in them.
    -   Prevents extracting certain behaviour:
        -   e.g.:
            -   Watch window size and update the state.
            -   Animate a value over time from a class component.
        -   ...without restructuring code or adding an abstraction like Observables.
        -   Hooks solve this problem.

---

## Purpose

-   Reuse of stateful logic between components.
-   Ability to break down complex components.
-   Use of numerous React features previously requiring classes.
-   Easier AST traversal.

---

## Benefits

-   No introduction of unnecessary nesting in the component tree (like HOCs).
-   No drawbacks of mixins.
-   Lets you always use functions (if you want) instead of constantly switching
    between functions, classes, HOCs, & render props.

---

## Impact

-   Increases React only by approximately 1.5kB.
-   Shrinks build output: code using Hooks tends to minify better than
    equivalent code using classes.
-   No breaking changes.

---

---

---

# Usage

## General syntax of hook usage

    import {someHook} from 'react';

    function SomeComponent() {
        // Use someHook here
    }

---

## State hook

Hook name: `useState`

Provides local state to an SFC.

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

---

## Effect hook

Hook name: `useEffect`.

Perform side effects from an SFC.

Serves the same purpose as the following React class lifecycle methods:

-   `componentDidMount`
-   `componentDidUpdate`
-   `componentWillUnmount`

### Usage

-   When you call useEffect, you’re telling React to run your "effect" function
    after flushing changes to the DOM.
-   Effects have access to an SFC's props & state, since they're declared
    inside the SFC.
-   Runs the effects after every render, including the first render.
-   Can optionally specify how to "clean up" after them by returning a function.
-   Can use more than one in an SFC.

-   Lets you organize side effects in an SFC by what pieces are related (e.g.
    adding & removing a subscription), rather than forcing a split based on
    lifecycle methods.

### Sample uses

From within React SFCs:

-   Perform data fetching.
-   Subscribe (to...uh...subscriptions).
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

        // Optional "clean up" behaviour run on SFC unmount
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

---

## Context hook

Hook name: `useContext`.

-   When the provider updates, this Hook will trigger a rerender with the latest context value

### Example

```
import {useState, useEffect} from 'react';

function SomeComponent() {
    const context = useContext(Context);
}
```

---

---

---

# Rules of hooks

1.  Always use Hooks at the top level of your React SFC

2.  Don't call Hooks inside loops, conditions, or nested functions.

    -   Easier if always used at the top level of an SFC.
        -   Why? Ensures Hooks are called in the same order each time an SFC renders.
            -   It breaks the state if they're not called in the same order each time.
            -   IMPORTANT: React relies on the order in which Hooks are called.

3.  Related: DO NOT make hook calls conditional.

4.  Don’t call Hooks from regular JavaScript functions - only call them from:

    -   React SFCs
    -   Custom hooks

5.  Don't call Hooks from React classes.

---

TODO: Finish this mini-guide - it is currently a WIP.
TODO: complete tutorial as https://reactjs.org/docs/hooks-intro.html

---
