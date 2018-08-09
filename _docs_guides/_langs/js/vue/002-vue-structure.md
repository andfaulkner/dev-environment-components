Vue instance
============
All Vue apps start with a Vue instance

    const vm = new Vue({
        // options
    });

It can be provided with a data object:

    const vm = new Vue({
        data: {a: 1, b: 2},
    });

Lifecycle hooks
---------------
On creation - full list
*   beforeCreate
*   [VUE INSTANCE GETS CREATED HERE]
*   created
*   beforeMount
*   [VUE INSTANCE GETS MOUNTED INTO DOM HERE]
*   mounted

On destruction:
*   beforeDestroy
*   [VUE INSTANCE GETS TORN DOWN HERE]
*   destroyed

On data change
*   [DATA CHANGE OCCURS HERE]
*   beforeUpdate
*   [VDOM RE-RENDERS HERE]
*   updated

### beforeCreate
    const vm = new Vue({
        beforeCreate: function () {
            // `this` points to the vm instance
            console.log('a is: ' + this.a + `. Runs before anything else.`);
        },
    });

### Created
    const vm = new Vue({
        created: function () {
            // `this` points to the vm instance
            console.log('a is: ' + this.a + `. Runs after beforeCreate & instance creation.`);
        },
    });

*   Note: don’t use arrow functions on an options property or callback

### Etc
See https://vuejs.org/v2/guide/instance.html#Data-and-Methods for more

Reactivity system
=================
*   When the values of properties in the reactivity system change, the view "reacts," updating to match the new values
*   The data object provided to the Vue instance gets added to this
    *   i.e. when any data in it changes, the view will re-render
    *   However, properties in data are only reactive if they existed when the instance was created