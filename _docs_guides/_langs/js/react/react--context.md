
DON'T USE CONTEXT! IT'S BRITTLE AND HAS A LOT OF UNDEFINED BEHAVIOUR

...but if you have to, the trick is to make it shallowly immutable.

Definitions
===========
childContextTypes
-----------------
*   static property that allows you to declare the structure of the context object being passed to your component’s descendants.
    *   Similar fashion to propTypes but not optional.

getChildContext
---------------
*   prototype method that returns the context object to pass down the component’s hierarchy.
*   Every time the state changes or the component receives new props this method will be called.

SomeComponent.contextTypes
--------------------------
WIP
Example:
    SomeComponent.contextTypes = {
        currentUser: React.PropTypes.object
    };

    *   above, SomeComponent now has access to context.currentUser.

Examples
========
WIP

    class ContextProvider extends React.Component {
        static childContextTypes = {
            currentUser: React.PropTypes.object
        };
        getChildContext() {
            return {currentUser: this.props.currentUser};
        }
        
        render() {
            return(...); 
        }
    }

*   [How to handle React Context](https://medium.com/react-ecosystem/how-to-handle-react-context-a7592dfdcbc#.omj2uv2yg)

this._reactInternalInstance._context
------------------------------------
*   accesses the "global" context. Can do so from any React component.
    *   gets set by top-level providers.

this.context
------------
*   accesses the "local" context