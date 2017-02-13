Common mistakes
===============

1.  Overusing state is a terrible idea. Try to basically always avoid this.setState.

2.  Never store components in another component's state.

3.  Do not store values on an instance of a component. I.E. never store values in
    this.someVar from within a method in a React Component..

4.  Everything that can possibly be a stateless functional component should be a stateless
    functional component. In any case where it's an viable option, it's basically always the
    best choice. It is near-universally a mistake to create a more complex component when
    a stateless functional component is all that is needed.

5.  Don't store application state in a React object. React is for VIEWS, not for state. If it's
    not view state, it doesn't belong in React at all.

6.  Don't forget about React and Redux's amazing dev tools. They're seriously half of the
    advantage of using this framework. The React Developer Tools and Redux DevTools Chrome
    plugins should be your goto for bug handling, they are insanely powerful.

7.  Never forget that setState is asynchronous. If you set state than look at it you'll still see
    the old state. It is extremely easy to end up using old data if setState is used.

8.  Never manipulate the DOM directly manually. Using jQuery to manipulate the DOM is the worst
    fucking idea ever.

9.  Don't do 'imperative' style programming with React. React is declarative. Describe what you
    want, but not how to do it. (Philosophical, but important for how you think about it). If you
    find yourself giving intensive detail to React about how to do things, there's a good
    chance you're thinking about it incorrectly (unless you're dealing with the 'model' or
    'controller' part of the app...in which case you shouldn't be doing whatever you're doing
    directly in React at all). Tell React *what* you want, not *how* to give you what you want..

10. Don't write gigantic components! Split them up continuously. Having lots of little ones is
    the idea. God objects are fucking evil in React. They should be focused.

11. Don't pass things from children to parents almost ever. If you're relying on this it's a total
    fucking disaster.

12. Do not have a shared mutable state anywhere, especially not your data stores. Make everything
    you can immutable. Use Immutable.js, it's your friend for this. Also, Redux has your back here:
    a Redux data store is immutable - changes in current app state are instead implemented by
    passing objects ("actions") that describe how the data should be different from the last state.
    No state along the way is ever lost: all previous "states" are always accessible simply by
    "rewinding" actions);

13. Do not create deeply nested state objects, they become unmanageable in React and Redux.
    And when you receive deeply nested objects e.g. from APIs, flatten them before putting them
    anywhere near a data store.

14. Don't neglect client-side routing. You are going to need it at some point, to some extent,
    the alternative is basically spaghetti. Use React-Router for this:
    https://github.com/reactjs/react-router

15. Always synchronize your router state with your app's (Redux) data store. You want to
    preserve single-source-of-truth for state data: all state data in a React (Redux) app
    should be in the app's data store. Use react-router-redux for this: 
      https://github.com/reactjs/react-router-redux

    *   This example is also helpful:
        *   https://github.com/reactjs/react-router-redux/tree/master/examples/basic

16. Don't overcomplicate the process of binding Redux to components. ES6 takes care of you here.
    E.g. this is valid:

        export default connect(
          state => ({ number: state.count.number }),
          { increase, decrease }
        )(Home)

    *   See the full example here: https://github.com/reactjs/react-router-redux/blob/master/examples/basic/components/Home.js

17. Don't use mixins. See https://medium.com/@dan_abramov/mixins-are-dead-long-live-higher-order-components-94a0d2f9e750

    *   instead, use higher-order components, where you basically compose a new component from an
        original one and extend its behaviour. E.g.

            PassData({ foo: 'bar' })(MyComponent)  

18. Don't neglect file size. There are simple things you can do to keep the app small e.g.
    using tree-shaking, or importing individual modules from a monolith library (e.g. lodash)
    rather than the whole thing all at once. See e.g. https://lacke.mn/reduce-your-bundle-js-file-size/

19. Avoid passing new closures to subcomponents.
          <input
              type="text"
              value={model.name}
              // onChange={(e) => { model.name = e.target.value }} // << Not this. Use the below:
              onChange={this.handleChange}
              placeholder="Your Name"
          />
    *   above, every time the parent component renders, a new function is created and passed
        to the input.
        *   If the input were a React component, this would automatically trigger it to re-render,
            regardless of whether its other props have actually changed

Often forgotten info
====================
1.  Changing Component state via this.setState will always trigger a re-render, even if the state
    had nothing to do with UI and didn't actually affect what the view itself shows. If you really
    need to use state, be aware of this, and use shouldComponentUpdate to prevent re-renders when
    setState is used.

Worth considering
=================
1.  Perhaps create global helper functions for direct use in JSX. Such helpers are placed in a 
    separate file, imported, & invoked via {h.nameOfMethod()} syntax within JSX. Example helper 
    that outputs the current date properly formatted for display:

    var h =  {
      getTime: function() {
         var month = ["jan", "feb", "march"]; // …. and so on
         var d = new Date();
         var mon = month[d.getMonth()];
         var day = d.getDate();
         var year = d.getFullYear();
         var dateAll = mon + " " + day + ", " + year;
         return dateAll;
      }
    };


Further reading
---------------
https://camjackson.net/post/9-things-every-reactjs-beginner-should-know
https://blog.risingstack.com/react-js-best-practices-for-2016/
