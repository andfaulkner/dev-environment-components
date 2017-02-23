Concepts
========
*   ship components without styles
*   treat styles as an injectable dependency
*   theme: set of related classname objects for different components
    *   makes sense to group them together into a single object and move it through the component
        tree via a context
*   you can provide a theme to a component either via context, hoc, or props


React-css-themr parts
---------------------
1.  Provider:  sets the context theme
2.  Decorator: adds to your components the logic to figure out:
    *   which theme should be used
    *   how the theme should be composed, depending on config, context, and props

Sources for the component
-------------------------
There are 3. Sorted by priority:
    1.  context
    2.  configuration
    3.  props

*   any can be missing
*   If multiple themes exist, you can compose the final classnames object in 3 different ways:
    1.  Override:       theme object with the highest priority is used
    2.  Softly merging: theme objects are merged. If a key exists in more than 1 object, val is
                        grabbed from highest priority theme.
    3.  Deeply merging: theme objects are merged. If a key exists in more than 1 object, the values
                        for each object are concatenated. This is the default.

Example
-------
*   goal: make a Button object themeable.
*   Pass unique name ID to themr decorator to retrieve its theme from context in case it's present:

        // Button.js
        import React, { Component } from 'react';
        import { themr } from 'react-css-themr';

        // ********  \/-- UNIQUE NAME IDENTIFIER   ******** //
        @themr('MyThemedButton')
        class Button extends Component {
          render() {
            const { theme, icon, children } = this.props;
            return (
              <button className={theme.button}>
                { icon ? <i className={theme.icon}>{icon}</i> : null}
                <span className={theme.content}>{children}</span>
              </button>
            )
          }
        }

        export default Button;

Above, theme may have come from props, context, or configuration
