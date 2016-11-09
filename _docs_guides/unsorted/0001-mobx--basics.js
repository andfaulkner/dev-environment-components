/**************************************************************************************************
*
*      MobX - concepts
*
*/

// State
//  * data driving app

// Derivations
//  * anything that can be derived from the state without further interaction
//  * forms:
//      1) the UI
//      2) derived data e.g. # of todos left
//      3) backend integrations e.g. sending changes to the server
//  * 2 types of derivations
//      1) computed values. Derived from current observable state via pure function
//      2) reactions: side effects that must happen automatically if state changes.
//         They are needed to achieve I/O.
//         *   note: these tend to be overused

// Actions
//  *  any piece of code that changes the state
//  *  e.g.
//      User events
//      backend data pushes
//      scheduled events
//  *  can be defined explicitly to help you structure code more clearly
//     *   in strict mode, state can't be modified outside actions

/**************************************************************************************************
*
*      Principles
*
*/

// Uni-drectional data flow
// *   actions --> state --> views

// Updates
// *   derivations are updated automatically and atomically on state change
//     *  intermediate states cannot be observed
// *   derivations are updated synchronously. Thus example actions cansafely inspect a computed
//     val directly after altering the state (in contrast to React setState)
// *   computed values: updated lazily.
//     *   Any computed value that is not actively in use will not be updated until it is needed
//        for a side effect (I/O).
//        If a view is no longer in use it will be garbage collected automatically.
//     *  computed values should be pure. They should not ever update state
 

/**************************************************************************************************
*
*      Example
*
*/

//********************************************* STORE *********************************************/
const todoStore = observable({
    // observable state
    todos: [],
    // derived value
    get completedCount() {
        return this.todos.filter(todo => todo.completed).length
    }
});

// function that observes the state
autorun(function() {
    console.log('Completed %d of %d items', todoStore.completedCount, todoStore.todos.length);
});

// **** actions that modify the state ****
// action 1
todoStore.todos[0] = {
    title: "Take a walk",
    completed: false,
};
// -> synchronously prints 'Completed 0 of 1 items'

// action 2
todoStore.todos[0].completed = true;
// -> synchronously prints 'Completed 1 of 1 items'

/**************************************************************************************************
*
*            Main API commands
*
*/

// Autorun
//      Autorun creates a reaction that runs once, and after that automatically re-runs
//      whenever any observable data that was used inside the function changes
//




