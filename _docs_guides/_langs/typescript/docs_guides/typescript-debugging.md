Verbose Debug Information: Node 94 (NullKeyword) was unexpected
===============================================================
*   Cause: you can't attach (property) decorators to properties of type null, even
    if null is merely one allowed type in a union type

Example 1
    Offending line:     `@format("Hello, %s") greeting: string | null;`
    Fix:                `@format("Hello, %s") greeting: string;`

Example 2
    Offending line:     `@observable somethingToWatch: null;`
    Fix:                `@observable somethingToWatch: any;`

Cause
-----
*   observables cannot examine "null"
*   in fact, you simply can't put a decorator on null


