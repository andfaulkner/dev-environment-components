// *******************************************************************************
// ************************************ REDUX ************************************
// *******************************************************************************
// makes state mutations predictable by imposing restrictions on how & when updates can happen
// 
// 1. SSOT
// The state of your whole application is stored in an object tree within a single store. e.g.
console.log(store.getState())
/* =>
	{
	  visibilityFilter: 'SHOW_ALL',
	  todos: [
	    {
	      text: 'Consider using Redux',
	      completed: true,
	    }, 
	    {
	      text: 'Keep all state in a single tree',
	      completed: false
	    }
	  ]
	} */
==
// 
// The only way to change the state tree is to emit an action, an object describing what happened.
// To specify how the actions transform the state tree, you write pure reducers
// 
// reducers:
// - pure functions with (state, action) => state signature
// e.g.
function counter(state = 0, action) {
  switch (action.type) {
  case 'INCREMENT':
    return state + 1
  case 'DECREMENT':
    return state - 1
  default:
    return state
  }
} // each state returned is the new state of the app.
// shape of the state can be a primitive, an array, an object, an Immutable.js data structure, etc
