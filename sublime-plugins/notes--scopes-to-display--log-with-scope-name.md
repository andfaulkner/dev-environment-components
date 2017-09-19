Display the contents of the following scope collections
=======================================================

Classes
=======

Names - class pieces
--------------------
*  Class name:
Scope:                         source.tsx
                               meta.class.tsx
                               entity.name.type.class.tsx

*   Name of "bound" class method attached to arrow function :: someMethod = () => { }
Scope:
                               meta.class.tsx
                               meta.field.declaration.tsx
                               meta.definition.property.tsx
                               entity.name.function.tsx

*   Name of "bound" class method attached to standard function (named or nameless) :: someMethod = function(){ }
Scope:                         source.tsx
                               meta.class.tsx
                               meta.field.declaration.tsx
                               meta.definition.property.tsx
                               entity.name.function.tsx

*   Name of named function "bound" to a class prop :: someMethod = function nameHere(){ }
Scope:                         source.tsx
                               meta.class.tsx
                               meta.field.declaration.tsx
                               meta.function.expression.tsx
                               meta.definition.function.tsx
                               entity.name.function.tsx

*   Class method name :: someMethod() { }
Scope:                         source.tsx
                               meta.class.tsx
                               meta.method.declaration.tsx
                               meta.definition.method.tsx
                               entity.name.function.tsx

*   Constructor "name" (always "constructor"):
Scope:                         source.tsx
                               meta.class.tsx
                               meta.method.declaration.tsx
                               storage.type.tsx

// DON'T MATCH
*   Name of class property not bound to a method:
Scope:                         source.tsx
                               meta.class.tsx
                               meta.field.declaration.tsx
                               meta.definition.property.tsx
                               variable.object.property.tsx

Scopes - class pieces
---------------------
*   Inside class :: class SomeClass { /* HERE */ }
Scope:                         source.tsx
                               meta.class.tsx

*   Inside arrow function "bound" to class prop :: class SomeClass { SomeMethod = () => { /* HERE */ } }
Scope:                         source.tsx
                               meta.class.tsx
                               meta.field.declaration.tsx
                               meta.arrow.tsx
                               meta.block.tsx

*   Inside standard function "bound" to class prop :: class SomeClass { SomeMethod = function(){ /* HERE */ } }
Scope:                         source.tsx
                               meta.class.tsx
                               meta.field.declaration.tsx
                               meta.function.expression.tsx
                               meta.block.tsx

*   Inside constructor or standard method :: class SomeClass { someMethod() { /* HERE */ } }
Scope:                         source.tsx
                               meta.class.tsx
                               meta.method.declaration.tsx
                               meta.block.tsx

*   After "=" in class prop not bound to a function :: class SomeClass { someProp = "someVal" }
Scope:                         source.tsx
                               meta.class.tsx
                               meta.field.declaration.tsx


Functions
=========
Names - functions (standalone)
------------------------------
*   Name of const/let/var storing function (arrow or standard) ::  const nameHere = () => "hello hello";
Scope:                         source.tsx
                               meta.var.expr.tsx
                               meta.var-single-variable.expr.tsx
                               meta.definition.variable.tsx
                               entity.name.function.tsx

*   Standard function name: function nameHere() { }
Scope:                         source.tsx
                               meta.function.tsx
                               meta.definition.function.tsx
                               entity.name.function.tsx

Scopes - functions (standalone)
------------------------------
*   In arrow function stored in const/let/var ::  const nameHere = () => "hello hello";
Scope:                         source.tsx
                               meta.var.expr.tsx
                               meta.arrow.tsx
                               meta.block.tsx

*   In standard function stored in const/let/var ::  const n = function() { /* HERE */ return 1  }
Scope:                         source.tsx
                               meta.var.expr.tsx
                               meta.function.expression.tsx
                               meta.block.tsx

*   In standard named function :: function name: function nameHere() { }
Scope:                         source.tsx
                               meta.function.tsx
                               meta.block.tsx



Object literals
===============
Names - object literal pieces
-----------------------------
*   Object literal name: const someObjLiteral = { }
Scope:                         source.tsx
                               meta.var.expr.tsx
                               meta.var-single-variable.expr.tsx
                               meta.definition.variable.tsx
                               variable.other.readwrite.tsx

*   Name of object literal key w function (any type): const SomeObj = { funcName: () => "out" }
Scope:                         source.tsx
                               meta.var.expr.tsx
                               meta.objectliteral.tsx
                               meta.object.member.tsx
                               meta.object-literal.key.tsx
                               entity.name.function.tsx

*   Name of named function at object literal key: const SomeObj = { key: funcName() { return "1" } }
Scope:                         source.tsx
                               meta.var.expr.tsx
                               meta.objectliteral.tsx
                               meta.object.member.tsx
                               meta.function.expression.tsx
                               meta.definition.function.tsx
                               entity.name.function.tsx

// DON'T MATCH
*   Object literal key (name) not mapped to a function: const SomeObj = { key: "val" }
Scope:                         source.tsx
                               meta.var.expr.tsx
                               meta.objectliteral.tsx
                               meta.object.member.tsx
                               meta.object-literal.key.tsx

Scopes - object literal pieces
-----------------------------
*   In object literal: const someObjLiteral = { /* HERE */ }
Scope:                         source.tsx
                               meta.var.expr.tsx
                               meta.objectliteral.tsx

*   In arrow function (any type) attached to object literal key: const SomeObj = { funcName: () => { /* HERE */ } }
Scope:                         source.tsx
                               meta.var.expr.tsx
                               meta.objectliteral.tsx
                               meta.object.member.tsx
                               meta.arrow.tsx
                               meta.block.tsx

*   In non-arrow function (any type) attached to object literal key: const SomeObj = { funcName: () => { /* HERE */ } }
Scope:                         source.tsx
                               meta.var.expr.tsx
                               meta.objectliteral.tsx
                               meta.object.member.tsx
                               meta.function.expression.tsx
                               meta.block.tsx

// DON'T MATCH
*   Object literal key (name) not mapped to a function: const SomeObj = { key: "val" }

