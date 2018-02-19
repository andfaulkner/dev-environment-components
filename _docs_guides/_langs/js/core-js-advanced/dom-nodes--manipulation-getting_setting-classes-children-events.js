/**************************************************************************************************/
/********************* DOM API - DOM NODE MANIPULATION / GETTING AND SETTING **********************/
/**************************************************************************************************/
// document.getElementById

// For the following examples, assume this DOM Node is present:
//      <div id="some-id" class="ok">Hello DOM Node grabbers</div>

// Get a DOM node
const myDOMNode = document.getElementById('some-id')

// Return the HTML contained between the start and end tag of a DOM node:
console.log(document.getElementById('some-id').innerHTML);
// => Hello DOM Node grabbers

// Replace a DOM Node's contents with a string:
document.getElementById('some-id').innerHTML = 'My new value';
// The DOM node defined above now contains 'My new value' rather than 'Hello DOM Node grabbers'

// Get the name of a DOM Node tag (i.e. the tag type, as a string):
console.log(document.getElementById('some-id').nodeName);
// => "DIV"

console.log(document.getElementById('some-id').nodeName);
// => "DIV"

/************************************** DOM NODE ATTRIBUTES ***************************************/
// Get a list of all attributes on a DOM Node:
console.log(document.getElementById('some-id').attributes);
// => {0: id, 1: class, length: 2}   << type NamedNodeMap
//    At position 0, we find an object for the attribute itself, of type Attr

// Get the key-value pair containing the full data of an attribute on a DOM Node:
document.getElementById('some-id').attributes.id
// => id="some-id"

// Get the value of an attribute on a DOM Node:
document.getElementById('some-id').attributes.id
// => "some-id"

// Get the name of an attribute on a DOM Node:
document.getElementById('some-id').attributes[0].name
// => "id"
//    This works too, but is pretty redundant: document.getElementById('some-id').id.name

/**************************************** DOM NODE CLASSES ****************************************/
// Get a list of all classes in the DOM Node, as a DOMTokenList:
document.getElementById('some-id').classList

// Get a list of all classes in the DOM Node, as a string:
document.getElementById('some-id').classList.value
// => "ok"

/*************************************** DOM NODE CHILDREN ****************************************/
// Get a collection of all children of a DOM Node:
document.getElementById('some-id').childNodes

// Get a collection of all children of a DOM Node that are themselves DOM Nodes:
document.getElementById('some-id').children

// Get the first child of a DOM Node:
document.getElementById('some-id').firstChild

// Get the last child of a DOM Node:
document.getElementById('some-id').lastChild

// Get the first child of a DOM Node that is itself a DOM Node (excludes plain text children):
document.getElementById('some-id').firstElementChild

// Get the last child of a DOM Node that is itself a DOM Node (excludes plain text children):
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
