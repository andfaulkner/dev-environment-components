Higher-order components (HOCs)
==============================
Definition: function that takes a component and returns a new component

General syntax of HOC usage:

    const EnhancedComponent = higherOrderComponent(WrappedComponent);

Examples in the wild: Redux's connect, MobX's @observable, Relay's createContainer

Uses
----
### Cross-cutting concerns
*   e.g. logging, internationalization
*   they replace mixins for this purpose

----------------------------------------------------------------------------------------------------
TODO: Finish this mini-guide - it is currently a WIP.
TODO: complete tutorial as https://facebook.github.io/react/docs/higher-order-components.html
----------------------------------------------------------------------------------------------------
