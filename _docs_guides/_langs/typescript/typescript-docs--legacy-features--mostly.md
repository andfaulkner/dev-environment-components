Legacy features (mostly)
========================
-   Avoid using these if possible
    -   They've been replaced by better features, and/or are problematic in some way.
-

Namespaces
----------
-   Mostly eliminate
    -   USUALLY REPLACEABLE WITH MODULES
    -   Others: class static, function property, or reexported module

-   If you're considering using namespaces for code organization:
    -   Don't. Modules have subsumed that role.

-   If you need functionality that only namespaces can provide:
    -   Do, but check that it's not equally expressive to express the concept without one
        -   e.g., with a class static or function property, or reexported module

-   It is also bad style to mix namespaces and modules in the same project
    -   It just feels off, since one of the major features of namespaces in the
        traditional sense is cross-file scope merging, which doesn't occur across
        modules (since, as I said, the module itself is actually a namespace).

Enums
-----
-   They're just confusing and weird

-   Instead, use:
    -   Union types with string values e.g.:

            type Fruits = 'APPLE' | 'POMEGRANATE' | 'PERSIMMON';

    -   String arrays marked "as const" e.g.:

            const fruits = ['APPLE', 'POMEGRANATE', 'PERSIMMON'] as const;
            export type Fruits = typeof fruits[number];
            // type Fruits is now 'APPLE' | 'POMEGRANATE' | 'PERSIMMON';

Notes
-----
-   Typescript anti-patterns:
    http://ducin.it/typescript-anti-patterns
