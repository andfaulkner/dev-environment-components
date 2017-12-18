React component lifecycle
=========================
----------------------------------------------------------------------------------------------------
INITIAL RENDER
--------------
      constructor          [1] - constructor(props)
           ┃┃                    Initialize state here - e.g.: this.state = { name: props.name };
           ┃┃                        |--> Careful: state won't be up-to-date with any props update.
           ┃┃                        ┗--> It's better to 'lift' state instead.
           ┃┃                    Note: instantiation starts at the top element in the UI tree & works down
           \/
   componentWillMount      [2] - Mainly for pre-render app config. No DOM access. No setState. [not that useful]
           ┃┃                    Uses:
           ┃┃                      ┃-> App config in root component (MAIN USE)
           ┃┃                      ┃-> Registering to global events such as a Flux store
           ┃┃                      ┗-> Handlers for cmp to respond to global Native UI events (e.g. window resizing, focus changes)
           ┃┃                    Runs:
           ┃┃                      ┃-> NOT after new props arrive
           ┃┃                      ┃-> immediately after component mounted (ONLY EVER CALLED ONCE!)
           ┃┃                      ┗-> on server rendering (only lifecycle hook called on server rendering)
           \/
         render            [3] - render the component
           ┃┃                    Returns the needed component markup
           ┃┃                    Props and state values are interpreted to create the correct output.
           ┃┃                    Neither props nor state should should be modified inside this function
           ┃┃                    -- The render function has to be pure
           ┃┃                    -- NEVER CALL this.setState HERE!!!           
           \/
       {children}          [3.x] 
           ┃┃                    Runs:
           ┃┃                      ┃-> 
           ┃┃                      ┗-> on server rendering (only lifecycle hook called on server rendering)
           ┃┃                    
           \/
    componentDidMount      [4] - componentDidMount()
                                 Note: starts at the bottom element in the UI tree & works up
                                 Runs:
                                   ┃-> NOT after new props arrive
                                   ┗-> once all children Elements/Components are mounted (NOTE: ONLY CALLED ONCE)
                                 Uses:
                                   ┃-> Start data fetching - AJAX requests should always go here
                                   ┃   ┗->> i.e. start AJAX calls to load in data for your component
                                   ┃-> Add event listeners
                                   ┃-> Set up subscriptions
                                   ┃-> Do all component setup requiring DOM (& all DOM interactions in general)
                                   ┃-> Draw on a <canvas> element (which you just rendered)
                                   ┗-> Initialize a "masonry" grid layout from a collection of elements
                                 Available:
                                   ┃-> setState. Calling it here triggers extra render,
                                   ┃             but intermediate state won't be shown
                                   ┗-> this.props (will contain prev props)

----------------------------------------------------------------------------------------------------
PROPS UPDATE
------------
componentWillReceiveProps  [1] - componentWillReceiveProps(nextProps)
           ┃┃                    Runs:
           ┃┃                      ┃-> when new props arrive
           ┃┃                      ┃-> NOT when state changes
           ┃┃                      ┗-> NOT after component mounted
           ┃┃                    Uses: (examples)
           ┃┃                      ┃-> Act on specific prop changes here to trigger state transitions.
           ┃┃                      ┃   ┗->> e.g. this.setState({ name: props.name });
           ┃┃                      ┃-> react to prop changes before render by updating state w/ setState()
           ┃┃                      ┗-> Redraw progress loader on getting new "% loaded" val
           ┃┃                    Available:
           ┃┃                      ┃-> setState (calling it here won't trigger additional render)
           ┃┃                      ┃-> this.props (will contain prev props)
           ┃┃                      ┗-> "next" props (in signature)
           ┃┃                      NOTE: Just because this was called doesn't mean the val of props has changed
           \/
  shouldComponentUpdate    [2] - shouldComponentUpdate(nextProps, nextState)
           ┃┃                    Runs:
           ┃┃                      ┃-> when new props arrive
           ┃┃                      ┃-> when state changes
           ┃┃                      ┗-> NOT after component mounted
           ┃┃                    If this method exists, component only updates if it returns true.
           ┃┃                    Uses: (examples)
           ┃┃                      ┗-> Lets component exit update lifecycle if no reason to apply new render
           ┃┃                          ┗->> i.e. for performance optimization, to prevent unneeded rerenders
           ┃┃                    Use to control component re-rendering (e.g. for a game loop).
           ┃┃                    -- setState not available
           \/
   componentWillUpdate     [3] - componentWillUpdate(nextProps, nextState).
           ┃┃                    Runs:
           ┃┃                      ┃-> when new props arrive (if shouldComponentUpdate returned true or doesn't exist)
           ┃┃                      ┃-> when state changes (if shouldComponentUpdate returned true or doesn't exist)
           ┃┃                      ┗-> NOT after component mounted
           ┃┃                    Use if using shouldComponentUpdate AND you need to do something
           ┃┃                    when the props change; otherwise akin to componentWillReceiveProps
           ┃┃                    -- setState not available
           \/
         render            [4] - render the component (see above)
           ⬇
   componentDidUpdate      [5] - componentDidUpdate(prevProps, prevState)
                                 Update the DOM in response to prop or state changes.
                                 Like componentDidMount, but runs after each update (vs just mount).
                                 -- setState available

----------------------------------------------------------------------------------------------------
ON VIEW REMOVAL / UNMOUNTING
----------------------------
  componentWillUnmount     [1] - Cleanup. e.g.:
                                 * cancel outgoing network requests
                                 * remove all event listeners associated w/ the component
                                 -- setState not available
----------------------------------------------------------------------------------------------------

Sources
-------
https://engineering.musefind.com/react-lifecycle-methods-how-and-when-to-use-them-2111a1b692b1
https://facebook.github.io/react/docs/react-component.html#componentdidmount
https://tylermcginnis.com/react-interview-questions/
    *   (See "In which lifecycle event do you make AJAX requests and why?" question)
https://developmentarc.gitbooks.io/react-indepth/content/life_cycle/introduction.html
http://busypeoples.github.io/post/react-component-lifecycle/

https://developmentarc.gitbooks.io/react-indepth/content/life_cycle/birth/post_mount_with_component_did_mount.html

React lifecycle cheatsheet :: https://gist.github.com/bvaughn/923dffb2cd9504ee440791fade8db5f9