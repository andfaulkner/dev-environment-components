React component lifecycle
=========================

   componentWillMount      [1] - Only use: app config in root component. No DOM access. No setState.
           ⬇
    componentDidMount      [2] - Do all component setup requiring DOM.
           ┃┃                    Start data fetching - AJAX requests should always go here.
           ┃┃                    -- setState allowed
           \/
componentWillReceiveProps  [3] - componentWillReceiveProps(nextProps)
           ┃┃                    Runs when new props arrive.
           ┃┃                    Both next & current props available here: next props as 1st
           ┃┃                    arg to this method; current props as this.props.
           ┃┃                    Act on specific prop changes here to trigger state transitions.
           ┃┃                    * e.g. Redrawing a progress loader on receiving a new load % value
           ┃┃                    -- setState allowed
           \/
  shouldComponentUpdate    [4] - shouldComponentUpdate(nextProps, nextState)
           ┃┃                    If this method exists, component only updates if it returns true.
           ┃┃                    Use to control component re-rendering (e.g. for a game loop).
           ┃┃                    -- setState not allowed
           \/
   componentWillUpdate     [5] - componentWillUpdate(nextProps, nextState).
           ┃┃                    Use if using shouldComponentUpdate AND you need to do something
           ┃┃                    when the props change. Otherwise akin to componentWillReceiveProps
           ┃┃                    -- setState not allowed
           \/
         render            [6] - render the component
           ⬇
   componentDidUpdate      [7] - componentDidUpdate(prevProps, prevState)
           ┃┃                    Update the DOM in response to prop or state changes.
           ┃┃                    Like componentDidMount, but runs after each update (vs just mount).
           ┃┃                    -- setState allowed
           \/
  componentWillUnmount     [8] - Cleanup. e.g.:
                                 * cancel outgoing network requests
                                 * remove all event listeners associated w/ the component
                                 -- setState not allowed


Sources
-------
https://engineering.musefind.com/react-lifecycle-methods-how-and-when-to-use-them-2111a1b692b1
https://facebook.github.io/react/docs/react-component.html#componentdidmount
https://tylermcginnis.com/react-interview-questions/
    *   (See "In which lifecycle event do you make AJAX requests and why?" question)
