
#Container component
*   a container component is just a React component that uses store.subscribe() to read a part of
    the redux state tree, and supply props to the presentational component it renders.
*   can be generated with Redux's connect() function, which also benefits performance
*   see http://redux.js.org/docs/basics/UsageWithReact.html

Using connect
-------------
###Define special 'mapStateToProps' function
*   tells how to transform current Redux state into props to pass to a presentational component
*   receives state and 

###Define special 'mapDispatchToProps' function
*   receives dispatch method
*   returns callback props that you want to inject into the presentational component

To create a new part of state
=============================
1.  Create a new action:

        export const TEST_SWITCH_STATE = 'TEST_SWITCH_STATE';


2.  Create a new actionCreator:

        export const testSwitchState_AC = (newState: boolean): Action<{testStateProperty: boolean}> => ({
          type: TEST_SWITCH_STATE,
          payload: {
            testStateProperty: newState
          }
        });


3.  Define an initialState value:

        const initialState: AppStoreState = {
          // *** SECTION TO ADD ***
          testStateProperty: false,
          // **** END OF SECTION TO ADD ***
        };


4.  Modify store interface to include typing for new variable:

        interface AppStoreState {
          // *** SECTION TO ADD ***
          testStateProperty: boolean;
          // **** END OF SECTION TO ADD ***
        };


5.  Create a new reducer (or rather, a new reducer 'case') [[note: ensure it consumes the new initialState]]:

        export const reducers = (state: AppStoreState = initialState,
                                 action: Action<{testStateProperty: boolean}>) => {
          switch (action.type) {
            // *** SECTION TO ADD ***
            case TEST_SWITCH_STATE:
              return Object.assign({}, state, { testStateProperty: action.payload.testStateProperty });
            // **** END OF SECTION TO ADD ***
            default:
              return state;
          }
        };


6.  Wire in components that "read" from the new property via mapStateToProps:

        const mapStateToProps = (state) => (
          // *** SECTION TO ADD ***
          { testStateProperty: state.testStateProperty }
          // **** END OF SECTION TO ADD ***
        );


7.  Wire in components that "write" to the new property via mapDispatchToProps:

        const mapDispatchToProps = (dispatch) => ({
          // *** SECTION TO ADD ***
          onClick: newState => {         // any name is OK. newState received from call to dispatch
            dispatch(testSwitchState_AC(newState));
          }
          // **** END OF SECTION TO ADD ***
        });


8.  Add newly wired in properties into the interface defining the props the component accepts:

        interface MyComponentProps {
          spriteSize: number;
          // *** SECTION TO ADD FOR PROPS THAT ALLOW 'WRITING' TO STORE ***         
          onClick: Function;
          // *** END OF SECTION TO ADD FOR PROPS THAT ALLOW 'WRITING' TO STORE ***         
          // *** SECTION TO ADD FOR PROPS THAT ALLOW 'READING' FROM STORE ***         
          testStateProperty: boolean;
          // *** END OF SECTION TO ADD FOR PROPS THAT ALLOW 'READING' FROM STORE ***         
        };

    *   8a) Ensure the interface defining the props are used in the React.Component generic
            used when defining the component:

        class MyComponentUnwrapped extends React.Component<MyComponentProps, MyComponentState> {


9.  Wrap components that access the store in any way in 'connect' higher order function:

        export const MyComponent: any = connect(
          mapStateToProps,
          mapDispatchToProps
        )(MyComponentUnwrapped as any);      // the 'as any' is key, or it won't work


10. Read from the store within components that have been wired in, where needed:

        someMethod = (someParam) => {
          console.log('testStateProperty: ', this.props.testStateProperty);
        };


11. Write to the store within components that have been wired in, where needed:

        someOtherMethod = (someArg) => {
          this.props.onClick(true)
        };

