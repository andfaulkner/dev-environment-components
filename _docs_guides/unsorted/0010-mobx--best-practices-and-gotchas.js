/**************************************************************************************************
*
*      MobX - best practices
*
*/

// 1.   Use @observer on all components that render @observable's
// 
// 2.   Use computed values for any value deried from store values
// 
// 3.   Have a single store, just like redux.
//
// 4.   Do not mutate the store from anywhere besides an action.
//
// 5.   Text of the list item here
//


/**************************************************************************************************
*
*      MobX - gotchas
*
*/

// 1.   Don't try to observe primitives. It won't work.
//
// 2.   @observer ONLY observes the render method of a react component.
// 
// 3.   If you don't use class property assignment syntax, and this doesn't get bound, the
//      properties will sometimes display, but act like they're frozen. Switch to property
//      assignment syntax if this happens. Relevant to MobX since mutating these is the essence
//      of using it as a state store.
//      
