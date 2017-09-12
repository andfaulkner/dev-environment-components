React component lifecycle
=========================

      constructor          [0] - constructor(props)
           ┃┃                    Initialize state here - e.g.: this.state = { name: props.name };
           ┃┃                        |--> Careful: state won't be up-to-date with any props update.
           ┃┃                        ┗--> It's better to 'lift' state instead.
           ┃┃
           \/
   componentWillMount      [1] - Only use: app config in root component. No DOM access. No setState.
           ⬇
    componentDidMount      [2] - componentDidMount()
           ┃┃                    Do all component setup requiring DOM.
           ┃┃                    Start data fetching - AJAX requests should always go here.
           ┃┃                    -- setState available
           \/
componentWillReceiveProps  [3] - componentWillReceiveProps(nextProps)
           ┃┃                    Runs when new props arrive, but NOT on initial mount.
           ┃┃                    Act on specific prop changes here to trigger state transitions.
           ┃┃                       ┗-> e.g. this.setState({ name: props.name });
           ┃┃                    e.g. uses: redraw progress loader on getting new "% loaded" val
           ┃┃                    -- setState available
           ┃┃                       ┗-> Calling it here won't trigger additional render
           ┃┃                    -- this.props available (prev props)
           ┃┃                    -- "next" props available
           ┃┃                    -- Runs only on new props received (not on first mount)
           \/
  shouldComponentUpdate    [4] - shouldComponentUpdate(nextProps, nextState)
           ┃┃                    If this method exists, component only updates if it returns true.
           ┃┃                    Use to control component re-rendering (e.g. for a game loop).
           ┃┃                    -- setState not available
           \/
   componentWillUpdate     [5] - componentWillUpdate(nextProps, nextState).
           ┃┃                    Use if using shouldComponentUpdate AND you need to do something
           ┃┃                    when the props change. Otherwise akin to componentWillReceiveProps
           ┃┃                    -- setState not available
           \/
         render            [6] - render the component
           ⬇
   componentDidUpdate      [7] - componentDidUpdate(prevProps, prevState)
           ┃┃                    Update the DOM in response to prop or state changes.
           ┃┃                    Like componentDidMount, but runs after each update (vs just mount).
           ┃┃                    -- setState available
           \/
  componentWillUnmount     [8] - Cleanup. e.g.:
                                 * cancel outgoing network requests
                                 * remove all event listeners associated w/ the component
                                 -- setState not available


Sources
-------
https://engineering.musefind.com/react-lifecycle-methods-how-and-when-to-use-them-2111a1b692b1
https://facebook.github.io/react/docs/react-component.html#componentdidmount
https://tylermcginnis.com/react-interview-questions/
    *   (See "In which lifecycle event do you make AJAX requests and why?" question)
https://developmentarc.gitbooks.io/react-indepth/content/life_cycle/introduction.html
