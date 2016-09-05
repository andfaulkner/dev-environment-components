DEFINITIONS
===========
##Container Component (React + Redux)
*   a container component is just a React component that uses store.subscribe() to read a part of
    the redux state tree, and supply props to the presentational component it renders.
*   can be generated with Redux's connect() function, which also benefits performance
*   see http://redux.js.org/docs/basics/UsageWithReact.html
*   Create using a special mapStateToProps function.


##Store enhancer
*   higher-order function that composes a store creator to return a new, enhanced store creator
*   similar to middleware: lets you alter a store interface composably
*    same concept as higher-order components in React
     *   higher-order components in React are basically “React component enhancers”; whereas these
         are the corollary in Redux: i.e. "Redux store enhancers".
*   examples: Redux middleware implementation, the one provided by Redux dev tools
*   note: you'll probably never write one.

##Transducer
*   A reducer run on a reducer
*   I.E. a function that transforms a function used for transforming
*   A transformation on a reducer
*   A reducer being the function passed to reduce to collapse a set of values into one
*   think:
    List -> reducer -> (singular output made up of all items on the list)
        ...throw in a transducer...
    List -> (reducer -> transducer -> altered reducer) -> (single output made of all items in list)

##Selectors (in the context of Redux)
*   A way to query data from the module state
*   