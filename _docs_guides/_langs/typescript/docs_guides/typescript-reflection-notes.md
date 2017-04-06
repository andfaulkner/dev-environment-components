What a reflection API should give us
====================================
Examine an unknown object and determine:
*   its name
*   its type
*   what interfaces it implements
*   name & types of the object's properties
*   name & types of object's constructor arguments

Existing reflection in JS
=========================
*   Object.getOwnPropertyDescriptor
*   Object.keys
*   etc.

Metadata reflection API
=======================
*   intended for addition to ES7
*   can be used with a polyfill lib (created by the TS devs)
    *   [reflect-metadata](https://www.npmjs.com/package/reflect-metadata)

reflect-metadata setup
----------------------
*   load Reflect.js
*   set emitDecoratorMetadata to ture in tsconfig
*   add a reference to reflect-metadata.d.ts
*   install reflect-metadata: `yarn add reflect-metadata`

Using reflect-metadata
----------------------
*   implement your own decorators
*   use one of the 3 available reflect-metadata design keys:

### "design:type"
*   Type metadata

### "design:paramtypes"
*   Parameter type metadata

### "design:returntype"
*   Return type metadata

Usage examples
--------------
### Create a property decorator and apply it to properties of a class to get its type

    // Property decorator
    function logType(target: any, key: string) {
        var t = Reflect.getMetadata("design:type", target, key);
        console.log(`${key} type: ${t.name}`);
    }

    // Apply property decorator to a property on a class
    class Demo{ 
        @logType
        public attr1: string;
    }

    //  The logType decorator logs: "attr1 type: String"

