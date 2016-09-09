General rules
=============
1.  Organize by feature, not by object type
    *   i.e. don't put all your controllers in a folder, all your views in another, and so on
2.  Don't tightly couple 1 module to the state of another. Specifically...
    *   use selectors taken from the module itself to reference data associated with it.
          Why? Because if the data changes, it's OK, because the selector on the module will
          change with it, and you won't have to run around changing everything that referenced
          the state data
3.  Circular dependencies are evil, even though Node & Webpack stops them from killing us
    *   but they will kill us. You end up with things being unexpectedly 'undefined' as a result

Great example structure
=======================

    todos/
      components/
      actions.js
      actionTypes.js
      constants.js
      index.js
      reducer.js
    index.js
    rootReducer.js
