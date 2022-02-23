# Links for getting started on Rust
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

High-level info (why Rust?)
===========================
Introduction to Rust + Is Rust Functional? + Rust by the Numbers in 2021
------------------------------------------------------------------------
Links:
-   Introduction to Rust
    -   https://serokell.io/blog/rust-guide
-   Is Rust Functional?
    -   https://www.fpcomplete.com/blog/2018/10/is-rust-functional/
-   Rust by the Numbers: The Rust Programming Language in 2021:
    -   https://thenewstack.io/rust-by-the-numbers-the-rust-programming-language-in-2021/

### Advantages
-   The language's entire MO is to provide both:
    1.  The speed and control of a lower-level language (it actually _is_ technically a lower-level language); and
    2.  The tools, safety, and debugging provided by a high-level language.

-   Creates unusually safe code, which is remarkable given how low-level it is

-   Extremely interesting and unique feature: borrow checker.
    -   Lets you safely handle data with pointers to it
    -   Only one pointer can both read and write data at a time
    -   Any number can read, but only one is allowed to read-write at any given time
        -   The read-writing pointer is said to have "borrowed" access to the data

-   Excellent at concurrency and parallelism
    -   In part thanks to the borrow checker

-   Performance rivals C++
    -   i.e. it's blazing fast
    -   However, this is partly achieved by:
        -   Not having garbage collection
        -   Not having runtime exceptions (!?)
            -   This is actually kind of cool, I'm interested in seeing how this will work in practice.

-   Compiled
    -   Creates CLI applications that immediately execute without spinning up a VM
    -   Can compile to WebAssembly

-   Inspired by functional languages, not really object-oriented
    -   Some ability to sort of hack OOP in using structs and "traits"
        -   No inheritance (GOOD!)
            -   Uses "traits" for polymorphism instead
    -   Has a lot of baked-in functional programming features
        -   map, filter, find, reduce
        -   Defaults to immutability
            -   You have to explicitly use a "move" to do something mutable in Rust
                -   i.e. mutable code ends up being directly marked in the code
                -   Mutability can only be done very deliberately
        -   First-class functions/higher-order functions
            -   i.e. JS' best feature: the ability to pass functions around as values
            -   Lambdas, with clean and straightforward syntax for them
            -   Closures

-   Statically typed
    -   Catches errors at compile time
    -   BUT has a more functional programming based model, rather than a type straightjacket like Java

-   Famously excellent documentation

-   Popularity
    -   It's now a top-20 programming language (on Tiobe)
        -   Also ranked as the most loved programming language in StackOverflow surveys
    -   Highest salaried programming language
    -   In the top 5 most wanted programming languages for hiring
    -   Widely used in production by major tech companies

-   Baked-in package manager!
    -   Cargo

Online Rust book
================
-   https://doc.rust-lang.org/book/