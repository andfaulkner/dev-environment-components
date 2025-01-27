React component lifecycle
=========================
----------------------------------------------------------------------------------------------------
INITIAL RENDER
----------- ---
        constructor             [1] - constructor(props)
            ┃┃                         Initialize state here - e.g.: this.state = { name: props.name };
            ┃┃                             |--> Careful: state won't be up-to-date with any props update.
            ┃┃                             ┗--> It's better to 'lift' state instead.
           \  /                         Note: instantiation starts at the top element in the UI tree & works down
            \/
static getDerivedStateFromProps [2] - getDerivedStateFromProps(nextProps)
            ┃┃                         Runs:
            ┃┃                           ┃-> after a component is instantiated
            ┃┃                           ┃-> when it receives new props
            ┃┃                           ┗-> NOT when state changes
            ┃┃                         Uses: (examples)
            ┃┃                           ┃-> Act on specific prop changes here to trigger state transitions.
            ┃┃                           ┗->
           \  /                         Intentionally static to prevent reading & writing instance variables
            \/
  UNSAFE_componentWillMount     [3] - UNSAFE_componentWillMount()
            ┃┃                         Mainly for pre-render app config. No DOM access. No setState. [not that useful]
            ┃┃                         Uses:
            ┃┃                           ┃-> App config in root component (MAIN USE)
            ┃┃                           ┃-> Registering to global events such as a Flux store
            ┃┃                           ┗-> Handlers for cmp to respond to global Native UI events (e.g. window resizing, focus changes)
            ┃┃                         Runs:
            ┃┃                           ┃-> NOT after new props arrive
            ┃┃                           ┃-> immediately after component mounted (ONLY EVER CALLED ONCE!)
           \  /                           ┗-> on server rendering (only lifecycle hook called on server rendering)
            \/
          render                [4] - render(): void  << No arguments or return val
            ┃┃                         Render the component
            ┃┃                         Returns the needed component markup
            ┃┃                         Props and state values are interpreted to create the correct output.
            ┃┃                         Neither props nor state should should be modified inside this function
            ┃┃                         -- The render function has to be pure
           \  /                         -- NEVER CALL this.setState HERE!!!
            \/
        {children}              [4.x] - triggers initial render of child components to current component
            ┃┃                         All components' children recursively rendered until entire UI tree covered
            ┃┃                         Child components rendering follows the normal initial render lifecycle
            ┃┃                            (starting w/ constructor -- see above)
            ┃┃                         Runs:
            ┃┃                           ┃-> In the course of a component's render method.
            ┃┃                           ┗-> Before ANY components call componentDidMount!
            ┃┃                               -- All children (entire UI) renders first
            ┃┃                         Uses:
           \  /                           ┗-> WIP -- TODO write-up children uses [children are one of the most useful aspects of React, so this will be a large section]
            \/
  [UPDATES DOM and REFS]
            ┃┃
           \  /
            \/
     componentDidMount          [5] - componentDidMount()
     / useLayoutEffect                Note : starts at the bottom element in the UI tree & works up
            ┃┃                        Runs:
            ┃┃                          ┃-> NOT after new props arrive
            ┃┃                          ┗-> once all children Elements/Components are mounted (NOTE: ONLY CALLED ONCE)
            ┃┃                        Uses:
            ┃┃                          ┃-> Start data fetching - AJAX requests should always go here
            ┃┃                          ┃   ┗->> i.e. start AJAX calls to load in data for your component
            ┃┃                          ┃-> Add event listeners
            ┃┃                          ┃-> Set up subscriptions
            ┃┃                          ┃-> Do all component setup requiring DOM (& all DOM interactions in general)
            ┃┃                          ┃-> Draw on a <canvas> element (which you just rendered)
            ┃┃                          ┗-> Initialize a "masonry" grid layout from a collection of elements
            ┃┃                        Available:
            ┃┃                          ┃-> setState. Calling it here triggers extra render,
            ┃┃                          ┃             but intermediate state won't be shown
            ┃┃                          ┗-> this.props (will contain prev props)
            ┃┃                        Hooks equivalent:
            ┃┃                          useLayoutEffect(fn, [])
           \  /
            \/
        useEffect               [6] [HOOKS ONLY] Runs slightly after when componentDidMount would run


[NOTE: see below for notes on decorators - they are not yet included in the above lifecycle flow]

----------------------------------------------------------------------------------------------------
PROPS UPDATE
------------
UNSAFE_componentWillReceiveProps
            OR
static getDerivedStateFromProps  [1A] - UNSAFE_componentWillReceiveProps(nextProps)
            ┃┃                           Runs:
            ┃┃                             ┃-> when new props arrive
            ┃┃                             ┃-> NOT when state changes
            ┃┃                             ┗-> NOT after component mounted
            ┃┃                           Uses: (examples)
            ┃┃                             ┃-> Act on specific prop changes here to trigger state transitions.
            ┃┃                             ┃   ┗->> e.g. this.setState({ name: props.name });
            ┃┃                             ┃-> react to prop changes before render by updating state w/ setState()
            ┃┃                             ┗-> Redraw progress loader on getting new "% loaded" val
            ┃┃                           Available:
            ┃┃                             ┃-> setState (calling it here won't trigger additional render)
            ┃┃                             ┃-> this.props (will contain prev props)
            ┃┃                             ┗-> "next" props (in signature)
            ┃┃                             NOTE: Just because this was called doesn't mean the val of props has changed
            ┃┃                             NOTE: Just because this was called doesn't mean the val of props has changed
            ┃┃
            ┃┃                    *PREFERRED ::*
            ┃┃                    [1B] - static getDerivedStateFromProps(nextProps, nextState): Object
            ┃┃                           Allows change of state to occur when new props enter
            ┃┃                           -- setState not available, but value returned from this becomes the new state
            ┃┃                           Runs:
            ┃┃                             ┃-> When new props arrive
            ┃┃                             ┃-> NOT when state changes (confirm this)
            ┃┃                             ┃-> Right before checked whether to render
            ┃┃                             ┗-> after component initially mounted
            ┃┃                           Uses: (examples)
            ┃┃                             ┃-> Recording the current scroll direction based on a changing offset prop
            ┃┃                             ┃-> Loading external data specified by a source prop (e.g containing a URL)
            ┃┃                             ┗-> Use only as a last resort
           \  /                                 ┗->> See https://reactjs.org/docs/react-component.html#static-getderivedstatefromprops
            \/
   shouldComponentUpdate          [2] - shouldComponentUpdate(nextProps, nextState): boolean
            ┃┃                           Runs:
            ┃┃                             ┃-> when new props arrive
            ┃┃                             ┃-> when state changes
            ┃┃                             ┗-> NOT after component mounted
            ┃┃                           If this method exists, component only updates if it returns true.
            ┃┃                           Uses: (examples)
            ┃┃                             ┗-> Lets component exit update lifecycle if no reason to apply new render
            ┃┃                                 ┗->> i.e. for performance optimization, to prevent unneeded rerenders
            ┃┃                           Use to control component re-rendering (e.g. for a game loop).
           \  /                           -- setState not available
            \/
 UNSAFE_componentWillUpdate       [3] - UNSAFE_componentWillUpdate(nextProps, nextState)
            ┃┃                           Runs:
            ┃┃                             ┃-> when new props arrive (if shouldComponentUpdate returned true or doesn't exist)
            ┃┃                             ┃-> when state changes (if shouldComponentUpdate returned true or doesn't exist)
            ┃┃                             ┗-> NOT after component mounted
            ┃┃                           Use if using shouldComponentUpdate AND you need to do something
            ┃┃                           when the props change; otherwise akin to UNSAFE_componentWillReceiveProps
           \  /                           -- setState not available
            \/
          render                  [4] - render the component (see above)
            ⬇
  getSnapshotBeforeUpdate         [5] - Safely read properties from e.g. the DOM before updates are made
            ┃┃                         Lets component get current vals (e.g. scroll pos) before they're potentially changed
           \  /                         Any val it returns gets passed as a param to componentDidUpdate
            \/
   [UPDATES DOM and REFS]
            ┃┃
           \  /
            \/
    componentDidUpdate            [6] - componentDidUpdate(prevProps, prevState)
                                        Update the DOM in response to prop or state changes.
                                        Uses:
                                          ┗-> to perform side effects e.g.:
                                              ┃-> data fetching
                                              ┗-> animation
                                        Uses:
                                        Like componentDidMount, but runs after each update (vs just mount).
                                        -- setState available

----------------------------------------------------------------------------------------------------
ON VIEW REMOVAL / UNMOUNTING
----------------------------
    componentWillUnmount     [1] - componentWillUnmount(): void   << No arguments or return val
                                   Cleanup. e.g.:
                                   * cancel outgoing network requests
                                   * remove all event listeners associated w/ the component
                                   -- setState not available

  function useEffect returns     - useEffect(
                                       () => {
                                           //
                                           // Code here is run after mounting component
                                           //

                                           return () => {
                                               //
                                               // Code in here is run on unmount component
                                               //
                                           };
                                       }
                                   );
----------------------------------------------------------------------------------------------------
ON ERROR THROWN
---------------
    componentDidCatch      [1] - componentDidCatch(error: Error, info: React.ErrorInfo)
                                 Runs:
                                   ┗-> When error thrown:
                                       Any thrown error in the React tree propagates upward until
                                       the 1st component with a componentDidCatch method.
                                       -- Entire React UI tree detaches from the DOM if none found
                                 Uses:
                                   ┗-> For error boundary components to trigger display of a
                                       fallback UI. e.g. via setState:
                                       -- have state.hasError property on component
                                       -- switch it to true in componentDidCatch
                                       -- branch render method so normal UI (or children) renders
                                          if hasError is false, & a fallback UI renders if true.
                                          * fallback UI should (usually) just contain error info
                                 Available:
                                   ┃-> this.setState
                                   ┃-> this.state
                                   ┗-> this.props

----------------------------------------------------------------------------------------------------
Notes on decorators
-------------------
Class decorators run before the constructor (because they wrap the constructor).
*   They essentially either:
    1. modify the constructor of a class (& thus React component) before the constructor is run; or
    2. trigger side effects (e.g. metadata storage, logging) related to the yet-unrendered component

TODO add class decorators to the initial render lifecycle (as a "step 0")
TODO add other types of decorators to the initial render lifecycle
     -> (method decorators, parameter decorators, property decorators)
     -> they may actually run *before* class decorators - more research required

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

### Decorators sources
How I fell in love with JS decorators :: https://cabbageapps.com/fell-love-js-decorators/
TypeScript-Handbook -> Decorators :: https://github.com/Microsoft/TypeScript-Handbook/blob/master/pages/Decorators.md
Understanding decorators :: https://survivejs.com/react/appendices/understanding-decorators/

## Diagrams
React 16 lifecycle: https://user-images.githubusercontent.com/1571667/38441522-dc5242ea-3999-11e8-9223-73ff7b9a6470.png
