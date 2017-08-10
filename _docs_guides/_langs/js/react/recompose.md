Adding state to a stateless functional component
------------------------------------------------
### Example:

```Typescript
/**
 * Provide name & setName properties from app store.
 */
const InjectNameProps = Component => inject(({ appState }: StoreProps) => ({
    name:    appState.name,
    setName: appState.setName,
}))(Component);

/**
 * Add "state" counter, and handler "setCounter".
 */
const addToggleNameModal = compose(
    withState('counter', 'setCounter', 0),
    withHandlers({
        increment: ({ setCounter }) => () => setCounter(n => n + 1),
        decrement: ({ setCounter }) => () =>  setCounter(n => n - 1),
        reset: ({ setCounter }) => () => setCounter(0)
    })
);

const enhance = compose(
    InjectNameProps,
    addToggleNameModal
);

//
// Apply to the stateless functional component
//

/**
 * Injected properties are included here for autocompletion.
 */
interface AccountSettingsProps {
    name: string
    setName: (name: string) => void
    setCounter: (updateFn: (n: number) => number) => void
    decrement: () => void
    increment: () => void
    reset: () => void
}

// Use the injected methods to:
//   Change the name every time the input contents change.
//   Change the counter by clicking the buttons.
export const AccountSettingsContainer = enhance((props: AccountSettingsProps) => {
    return (
        <div>
            <div>
                The user's name is: {props.name}
            </div>
            <input onChange={props.setName} />
            <div>
                The counter's value is: {props.name}
            </div>
            <button onClick={props.increment}>Increment counter by 1</button>
            <button onClick={props.decrement}>Decrement counter by 1</button>
            <button onClick={props.reset}>Reset counter to 0</button>
        </div>
    );
});
```