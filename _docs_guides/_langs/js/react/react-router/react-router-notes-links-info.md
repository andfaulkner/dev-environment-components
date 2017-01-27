Links
=====

*   [Upgrading to React Router 4](http://rants.broonix.ca/upgrading-to-react-router-v4/)
    *   Describes the total rewrite of React Router and how to use the new version
    *   Acts as a migration guide for moving from React Router 3 to 4

*   [React Router 4 official quickstart guide](https://react-router.now.sh/quick-start)
    *   Also explains basic principles, etc.

*   [Using React Router 4 with React Native](https://medium.com/@jschloer/react-router-v4-with-react-native-5f2005ab2a72#.jweqqkgn3)

*   [React Router 4 tutorial - Paul Sherman](http://www.pshrmn.com/tutorials/react/react-router/)
    *   Another good walkthrough explaining how to use React Router 4

*   [Highlights of React Router 3 -> 4 rewrite](https://www.sigient.com/blog/getting-rowdy-with-react-router)
    *   They completely rewrote the library in their upgrade to version 3.
    *   This outlines the most interesting and major changes, and explains the overall
        architecture, aim, and philosophy of the new version

*   [Creating a movie listings app with React Router 4](https://www.sigient.com/blog/movie-listings-application-with-react-router-v-4)
    *   Note that they use create-react-app, so it'll be easy to follow along

*   [Extensive React Router 4 tutorial at Turing School of Software and Design](http://frontend.turing.io/lessons/react-router-4.html)
    *   Seems to be an actual lesson in a frontend development training program

*   [Intro to React Router (4)](https://speakerdeck.com/guilh/introduction-to-react-router)

*   [Live React Router 4 example](https://react-router.now.sh/basic)


Notes
=====
"Match" component
    matches the pattern specified in props with the current location/window.pathname

Concepts
========
Locations objects
-----------------
*   allow the React Router components to determine which components should currently be rendered
*   they use a subset of Location properties to describe a URL, with some additional properties

### Example location object
const url = 'http://www.example.com/page?foo=bar#test';
const location = {
    /*
     * The pathname describes the path to the resource on the server,
     * relative to the root.
     */
    pathname: '/page',
    /*
     * If the URL includes a query string, it will be provided using
     * the search property of the location object. This will be an empty
     * string when there is no query string.
     */
    search: '?foo=bar',
    /*
     * The query string will also be parsed and turned into an object.
     * If there is no query string, this value will be null.
     */
    query: {
        foo: 'bar'
    },
    /*
     * The hash property contains the hash from the URL.
     */
    hash: '#test',
    /*
     * If there is any additional information that you want to include
     * in a location, you can pass it using the state property.
     */
    state: {
        next: '/other-page'
    }
};

History
-------
*   used to track and update the URL of a webpage
*   history object maintains a stack of locations
*   three methods for navigation:
        push:    adds a new location to the stack
        replace: replaces current location with new one
        go:      move forward or back a given number of positions
*   does not actually maintain the stack of locations when it doesn't have to
    *   relies on the browser whenever possible



Components
==========
Routers
-------
*   used on the client side of web applications and make use of the browser's History interface.
### <HashRouter>
*   hash urls

### <BrowserRouter>
*   provides more traditional URLs, but requires server config to recognize routes

### <MemoryRouter>
*   React Native-only

### <ServerRouter>
*   Render an application on the server

<Match />
---------
*   used to determine whether its component should be rendered
    *   uses the same matching mechanism as Express.
        *   both use the path-to-regex module to compare the pattern to a location
        *   pattern can include variables, which are prefixed with a colon

*   Basic example:
    <Match pattern='/page' />

*   Exact matches:

    <Match exactly pattern='/page' />

*   Render the "Yay" item in children on match, and the "Nay" item on non-match:

    <Match pattern='/page' children={
        ({matched}) => (
            <p>{
                (matched) ? 'Yay' : 'Nay'
            }</p>
        )
    } />  

*   Render the items inside render on match:

    <Match pattern='/page' render={
        () => <h1>Page</h1>
    } />

*   Render the component inside component on match:

    <Match pattern='/page' component={Page

<Link />
--------
*   used to navigate between locations


project
<Redirect />
------------
*   location matches a component, but you don't want the component to be rendered for the user.
*   common use case: use not logged in

    <Redirect to={ { pathname: '/' } } />
