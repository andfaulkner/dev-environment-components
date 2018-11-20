/* eslint-disable no-unused-vars */

// 1.  Use const for all references. (note: const is block-scoped)

    const a = 1; 

// 2.  If reassignment is required, use let, not var (let is block-scoped):

    let b = 2;
    b += 1;     // minimize the amount you do this

// 3.  Never use new Object(). Instead use literals:

    const item = {};

// 4.  Use computed property values everywhere you can:

    const keyToTheCity = (k) => `key named ${k}`;
    const obj = {
      id: 5,
      city: 'poop city',
      [keyToTheCity('enabled')]: true // will produce a 'key named enabled' property on the object 
    };

// 5.  Prefer classes over manipulating prototypes directly. They are easier to reason about

    class Queue {
      addToFront() {
        // do things
      }
    }

// 6.  Use extends for inheritance:

    class PeekableQueue extends Queue {
      peek() {
        return this._queue[0];
      }
    }

// 7.  Have methods return 'this' to help with chaining

    class Jedi {
      jump() {
        this.jumping = true;
        return this;
      }

      setHeight(height) {
        this.height = height;
        return this;
      }
    }

// 8. Chain methods like this:

    const luke = new Jedi();

    luke.jump()
      .setHeight(20);   // notice the 2 spaces at the beginning

// 9. Custom toString() methods are OK - just be careful as fuck.

    class SelfDescribingJedi extends Jedi {
      toString() {
        return `Jedi - ${this.getName()}`;
      }
    }

// 10. No empty constructors

    // None of this:   constructor() {}

// 11. Avoid wildcard imports

    // bad
    // import OmNomNomBear from './OmNomNomBear';

    // good
    // import OmNomNomBear from './OmNomNomBear';

// 12. Do not use mutable exports! No exporting var or let. It's super dangerous.
