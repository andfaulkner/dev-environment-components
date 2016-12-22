/**************************************************************************************************/
/****************** INCREMENTORS: ORDER OF VALUE AND OPERATOR : ++VAL VS. VAL++ *******************/
/**************************************************************************************************/
//*   ++val   : increment the value of the variable, THEN use it in the current
//              statement / expression.

//*   val++   : use the variable in the current statement / expression, THEN increment the value
//              of the variable

//### Example
//Starting with the following:
     let myArray = ['a', 'b', 'c', 'd', 'e', 'f'];
     let idx = 1;

//If we use val++ in the next step:

     myArray[idx++]
     // => 'b'
     myArray[idx]
     // => 'c'

//...whereas if we had instead used ++val:
     myArray[++idx]
        // => 'c'
     myArray[idx]
        // => 'c'


/**************************************************************************************************/
/***************************************** Object.create ******************************************/
/**************************************************************************************************/
// Example use of Object.create

        const User = function(firstName, lastName, password) {
                this.firstName = firstName;
                this.lastName = lastName;
            this.password = password;
        };

        User.prototype.getFullName = function getFullName() {
                return this.firstName + ' ' + this.lastName;
        };

        const Meeka = new User('meeka', 'faulkner', 'woofwoof');
        console.log(Meeka.getFullName());
        // => meeka faulkner

        const AdminUser = function(firstName, lastName, password, secret) {
            User.call(this, firstName, lastName, password);
            this.secret = secret;
        };

        AdminUser.prototype = Object.create(User.prototype);
        AdminUser.prototype.constructor = AdminUser;

        const CallieAdmin = new AdminUser('callie', 'peeke', 'arfarf', 'I ate one of the cats');

        console.log(CallieAdmin.getFullName());
        // => callie peeke

        console.log(CallieAdmin.secret);
        // => I ate one of the cats

        User.prototype.getFullName = function() {
            const fNameCap = this.firstName.charAt(0).toUpperCase() +
                             this.firstName.slice(1).toLowerCase();
            const lNameCap = this.lastName.charAt(0).toUpperCase() +
                             this.lastName.slice(1).toLowerCase();
            return 'Woofdog ' + fNameCap + ' ' + lNameCap;
        }

        /**
         * Below, notice that getFullName now not only capitalizes the names for instances of the
         * User object (as expected, since where the prototype was actually modified), but also for
         * instances of the AdminUser object (class?). This is because AdminUser.prototype actually
         * stores a *reference to* User.prototype, rather than a *copy of* User.prototype. Thus,
         * modifying a value on User.prototype results in automatically modifying that same value
         * on AdminUser at the same time.
        */
        console.log(Meeka.getFullName());
        // => 'Woofdog Meeka Faulkner'

        console.log(CallieAdmin.getFullName());
        // => 'Woofdog Callie Peeke'

/**************************************************************************************************/
/********************* DOM API - DOM NODE MANIPULATION / GETTING AND SETTING **********************/
/**************************************************************************************************/
// document.getElementById

// For the following examples, assume this DOM Node is present:
//      <div id="some-id" class="ok">Hello DOM Node grabbers</div>

// Get a DOM node
const myDOMNode = document.getElementById('some-id')

// return the HTML contained between the start and end tag of a DOM node
console.log(document.getElementById('some-id').innerHTML);
// => Hello DOM Node grabbers

// Replace a DOM Node's contents with a string
document.getElementById('some-id').innerHTML = 'My new value';
    // The DOM node defined above now contains 'My new value' rather than 'Hello DOM Node grabbers'

// Get the name of a DOM Node tag (i.e. the tag type, as a string)
console.log(document.getElementById('some-id').nodeName);
// => "DIV"

console.log(document.getElementById('some-id').nodeName);
// => "DIV"

/************************************** DOM NODE ATTRIBUTES ***************************************/
// get a list of all attributes on a DOM Node
console.log(document.getElementById('some-id').attributes);
// => {0: id, 1: class, length: 2}   << type NamedNodeMap
//    At position 0, we find an object for the attribute itself, of type Attr

// get the key-value pair containing the full data of an attribute on a DOM Node
document.getElementById('some-id').attributes.id
// => id="some-id"

// get the value of an attribute on a DOM Node
document.getElementById('some-id').attributes.id
// => "some-id"

// get the name of an attribute on a DOM Node
document.getElementById('some-id').attributes[0].name
// => "id"
//    This works too, but is pretty redundant: document.getElementById('some-id').id.name

/**************************************** DOM NODE CLASSES ****************************************/
// Get a list of all classes in the DOM Node, as a DOMTokenList
document.getElementById('some-id').classList

// Get a list of all classes in the DOM Node, as a string
document.getElementById('some-id').classList.value
// => "ok"

/*************************************** DOM NODE CHILDREN ****************************************/
// get a collection of all children of a DOM Node
document.getElementById('some-id').childNodes

// get a collection of all children of a DOM Node that are themselves DOM Nodes
document.getElementById('some-id').children

// get the first child of a DOM Node
document.getElementById('some-id').firstChild

// get the last child of a DOM Node
document.getElementById('some-id').lastChild

// get the first child of a DOM Node that is itself a DOM Node (excludes plain text children)
document.getElementById('some-id').firstElementChild

// get the last child of a DOM Node that is itself a DOM Node (excludes plain text children)
document.getElementById('some-id').lastElementChild

/**************************************** DOM NODE EVENTS *****************************************/
const myDOMNode = document.getElementById('some-id')

myDOMNode.onSelect = function(e) { /* do things here */ }
myDOMNode.onerror    // = ...
myDOMNode.oninput    // = ...
myDOMNode.onclick    // = ...
myDOMNode.ondblclick // = ...
myDOMNode.onblur     // = ...
myDOMNode.ondrag     // = ...
myDOMNode.ondragend  // = ...
myDOMNode.oncopy     // = ...
myDOMNode.onpaste    // = ...
/// .... etc ...
/// There are mountains and mountains of native events that can be assigned to a
/// DOM Node - the above examples only scratch the surface
/// 


/**************************************************************************************************/
/******* ASYNC RESOLUTION ORDER: PROMISES VS. CALLBACKS VS. TASKS VS. NEXTTICKS & TIMEOUTS ********/
/**************************************************************************************************/
// General order of execution:
// *   1) Initial script execution task. In other words, the currently executing script must reach
//        the bottom for this stage to complete. Any promise callbacks, etc. get added to the microtask
//        queue when the point of execution passes over them.
// *   2) Microtasks: all process.nextTick statements, all Promise callbacks, and all actions
//        triggered by a mutation observer (e.g. MutationObserver, Object.Observe...most likely
//        MobX's @observe statements...)
//        2a) Microtasks triggered by microtasks. In terms of promises, this refers to any function
//            passed to the second then statement in the chain. 
//              -- Rinse and repeat 2a until the entire promise chain has resolved
//                  *** note: returning undefined from a promise automatically queues up the
//                  next then statement as a microtasks
// *   3) The next task queued up from execution (if there is one). This means any setTimeout,
//        setInterval, or setImmediate statements run at this point. The same rules apply as to
//        execution of the initial script. Thus, any microtasks defined within a block passed to
//        setImmediate (or setInterval etc.) will only run after the block itself executes - they
//        do not get scheduled until the first 2 steps have completed.
//        
// Example execution order:

console.log('script start');        // [ 1 ]

setTimeout(function() {
    console.log('setTimeout');      // [ 5 ]
    Promise.resolve().then(() => {
        console.log('promise3');    // [ 6 ]
    });
}, 0);

Promise.resolve().then(() => {
    console.log('promise1');        // [ 3 ]
}).then(function() {
    console.log('promise2');        // [ 4 ]
});

console.log('script end');          // [ 2 ]


// Sources:
//  https://jakearchibald.com/2015/tasks-microtasks-queues-and-schedules/       <<<< AMAZING
//  https://blog.risingstack.com/node-js-at-scale-understanding-node-js-event-loop/
//  https://developer.mozilla.org/en/docs/Web/API/MutationObserver#Example_usage << Mutation Observers
