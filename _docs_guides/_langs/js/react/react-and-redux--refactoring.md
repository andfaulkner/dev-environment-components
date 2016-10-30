REFACTORING
===========

*   ALWAYS REMEMBER: REDUX OFFERS LOTS OF ROOM FOR PERSONAL STYLE!
    *   There's no "100% right" way
        *   (although there definitely are some 'wrong' ways)

Set of rules for how components, etc. should be defined: robust workflow for real-life Redux apps
-------------------------------------------------------------------------------------------------
*   [Robust workflow for real-life redux apps][1]

current logged-in user, theme info, internationalization and localization
*   Rules:
    *   no view logic in smart components - only place in dumb components
    *   Use dumb components to render *everything*
    *   Smart components should always access state through selectors
        *   selector: pure fn that takes the global state as an arg & returns 
                      some transformation over it.  Tightly coupled to reducers.
        *   Passing state through a selector allows us to confine refactoring to the reducer only
            if we decide to change the internal state structure
        *   example selectors:
                export function getTopicsByUrl(state) {
                  return state.topics.topicsByUrl;
                }
                export function getTopicsUrlArray(state) {
                  return _.keys(state.topics.topicsByUrl);
                }
    *   Use smart components to generate action creators
    *   Place all business logic inside action handlers (thunks), selectors and reducers
    *   Treat app state like a first class citizen and structure it like an in-memory database.
    *   Don’t use context to pass your model data through components
        *   Context should be used solely for true globals e.g.
            *   current logged-in user, theme info, internationalization and localization
    *   [Use setState as little as possible, or even not at all][4]

Rules for application state setup and design
--------------------------------------------
*   [Avoiding accidental complexity when structuring your app state (redux store state)][2]

*   Rules:
    *   don't model data after server API
        *   servers have different concerns, in particular response paging if arrays are used
        *    you really don't want to use arrays.
    *   use maps almost everywhere - virtually never use arrays
    *   don't model state after what views like to consume
        *   views have different concerns: views don't care about keeping state minimal, since it
            must be laid out for the user's sake.
    *   don't hold derived data in the state
        *   instead use selectors, and memoize selector results
    *   normalize nested objects

*   Excellent app state examples:
    *   1:

        {
          "productsById": {
            "88cd7621-d3e1-42b7-b2b8-8ca82cdac2f0": {
              "title": "Blue Shirt",
              "price": 9.99
            },
            "aec17a8e-4793-4687-9be4-02a6cf305590": {
              "title": "Red Hat",
              "price": 7.99
            }
          },
          "ordersById": {
            "14e743f8-8fa5-4520-be62-4339551383b5": {
              "customer": "John Smith",
              "products": {
                "88cd7621-d3e1-42b7-b2b8-8ca82cdac2f0": {
                  "giftWrap": true,
                  "notes": "It's a gift, please remove price tag"
                }
              },
              "totalPrice": 9.99
            }
          }
        }

Organizing redux projects
-------------------------
*   [Organizing redux projects][3]

*   organize the code by UI components vs. Redux, then by data vs. UI. E.g.
        components/
          users/
            user-ui.html
            users-ui.html
            ...
          groups/
            group-ui.html
            group-members-ui.html
            groups-ui.html
            ...
          ...
        redux/
          data/
            users/
              action-types.html
              actions.html
              reducers.html
              selectors.html
            groups/
              action-types.html
              actions.html
              reducers.html
              selectors.html
            reducers.html
          ui/
            users/
              action-types.html
              actions.html
              reducers.html
              selectors.html
            groups/
              action-types.html
              actions.html
              reducers.html
              selectors.html 
            reducers.html
          reducers.html
          redux-store.html



[1]: https://hackernoon.com/redux-step-by-step-a-simple-and-robust-workflow-for-real-life-apps-1fdf7df46092#.sexx9lxea
[2]: https://hackernoon.com/avoiding-accidental-complexity-when-structuring-your-app-state-6e6d22ad5e2a
[3]: https://medium.com/collaborne-engineering/organizing-redux-projects-7f12483f761a#.onxcgbadd
[4]: https://medium.com/@mweststrate/3-reasons-why-i-stopped-using-react-setstate-ab73fc67a42e#.xw0bvpoo7
