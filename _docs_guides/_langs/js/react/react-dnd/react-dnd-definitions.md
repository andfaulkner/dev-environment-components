Definitions
===========
Item
----
Plain JS object describing what's being dragged.
Examples:
    { fromCell: 'C5', piece: 'queen' }
    { fromIndex: 22, path: '/afaulkner/test-xyz/my-xyz-file.xyz' }

Type
----
String uniquely identifying a whole class of items in your app
-   Example: "row"
-   Types let you specify which drag sources and drop targets are compatible

Monitors
--------
Monitors are tiny wrappers that expose the drag-and-drop state of your application to your components.
In other words, monitors let you update the props of your components in response to the drag and drop state changes.

Collector function / collecting function
-----------------------------------------
A way to transform state from the drag-and-drop system into usable props for your components.

Define one for each component that needs to track the drag-and-drop state.
These retrieve the relevant bits of the drag and drop state from the monitors.

Example:
```
const collect = (monitor) => {
    return {
        highlighted: monitor.canDrop(),
        hovered: monitor.isOver()
    }
}
```
The above will pass up-to-date values of "highlighted" and "hovered"

Connectors
----------
These let you assign one of the predefined roles (drag source, drag preview, or drop target) to the DOM nodes in your render function.
-   A connector is passed as the first argument to the collecting function we described above

Draggable
---------
An item that you can move around and drop on a Droppable.

Droppable
---------
An item that can have things dragged onto it. i.e. a drag target for a Draggable.

1000


 
