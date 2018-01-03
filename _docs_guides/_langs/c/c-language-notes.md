Keywords
========
Full keyword list
-----------------
### Variable declarations
    void
    char
    float
    short
    long
    double
    int
    signed
    unsigned

### Conditionals
    if
    else
    switch
    case
    break
    default

### Storage classes
    auto
    register
    static
    extern
    typedef

### Loops
    for
    while
    do
    continue

    return

    const
    struct

    enum
    union
    goto
    sizeof
    volatile
    _Packed                              //_ <- [fixes IDE's md issues with unbalanced underscores]

* Note the lack of "var" and "let"



----------------------------------------------------------------------------------------------------
Storage classes
===============
Used to define the scope (visibility) and life time of variables and/or functions
*   See http://web.archive.org/web/20130927234242/http://itee.uq.edu.au/~comp2303/Leslie_C_ref/C/CONCEPT/storage_class.html

keyword: auto
-------------
Default storage class for local variables. Almost *never* needs to be declared

Example - both values below have the same storage class:

    int Date;
    auto int Month;

Variable declaration with auto or no storage class modifier can only be done within functions

keyword: static
---------------
1. A static variable inside a function keeps its value between invocations
2. A static global variable or a function is "seen" only in the file it's declared in
    *   Akin to "local" in other languages.

Example (of usage #1):

    #include <stdio.h>

    void foo() {
        int a = 10;
        static int sa = 10;

        a += 5;
        sa += 5;

        printf("a = %d, sa = %d\n", a, sa);
    }


    int main() {
        int i;
        for (i = 0; i < 4; ++i) foo();
    }

    // OUTPUTS ::
    //    a = 15, sa = 15
    //    a = 15, sa = 20
    //    a = 15, sa = 25
    //    a = 15, sa = 30

keyword: extern
---------------
Defines a global variable that is visible to ALL object modules.
Only relevant when the program consists of multiple source files linked together
*   Relevant when some of the vars defined in one file need to be referenced in another
*   e.g. if a variable in source file file1.c needs to be referenced in e.g. file2.c

When you use 'extern' the var can't be initalized, as all it does is point the var name at a
previously defined storage location.

---------------------------------------------------------------------------------------------------
Variables
=========

Variable declaration vs definition
--------------------------------------------------------------------------
[See this SO question for more info][1]

Summary:
    Declaration: "Somewhere, there exists a foo."
    Definition: "...and here it is!"

### Variable declaration
*   Introduces an identifier and describes its type
*   What the compiler needs to accept references to that identifier
*   Examples:

        extern int bar;
        extern int g(int, int);
        double f(int, double); // extern is omittable for function declarations

*    A var can be declared as often as you want - e.g. this is valid:

        double f(int, double);
        double f(int, double);
        extern double f(int, double); // the same as the two above
        extern double f(int, double);

### Variable definition
*   Actually instantiates/implements a previously declared identifier
*   What the linker needs in order to link references to those entities
*   Examples (corresponding to above declarations):

        int bar;
        int g(int lhs, int rhs) {return lhs*rhs;}
        double f(int i, double d) {return i+d;}

*   A var must be defined exactly once
    *   If you define something more than once, then the linker doesn't know which of the
        definitions to link references to, and thus complains about duplicated symbols


[1]: https://stackoverflow.com/questions/1410563/what-is-the-difference-between-a-definition-and-a-declaration

----------------------------------------------------------------------------------------------------
Function syntax
===============
Declaring functions
-------------------
### Declare function that takes an unspecified number of parameters, and returns nothing
*   Give empty argument list

Example:
    void test() {
        printf("ran");
    }

    int main(void) {
        test();             // => "ran"
        test("something");  // => "ran"
    }

In contrast...(see below):

### Declare a function that truly takes no parameters
*   Use void as the argument

Example:
    void test(void) {
        printf("ran");
    }

    int main(void) {
        test();
        // => "ran"

        test("something");
        // Fails with: 
        //      main.c: In function 'main':
        //      main.c:9:5: error: too many arguments to function 'test'
        //         test("something"); // < FAILURE
        //           ^~~~
        //      main.c:3:6: note: declared here
        //       void test(void) {
        //            ^~~~
        /*}*/
    }

----------------------------------------------------------------------------------------------------
LOOPS
=====

for loops
---------
Basic syntax:

    for (init; condition; increment)

Example:

    for (int i = 0; i < 4; i++) { ... }

More info: https://www.tutorialspoint.com/cprogramming/c_for_loop.htm


Infinite loops
--------------
Loops that run forever until they hit a break

Example:
    for (;; ) {
        ...
        if (someConditionMet) {
            break; // <-- Exits loop. This (and other break statements) is the only way to do so.
        }
    }

----------------------------------------------------------------------------------------------------
Pointers
========
Variable whose value is the address of another variable.
*   i.e. direct address of the memory location.

Pointer declaration
-------------------
Like any var or constant, you must declare it before use - e.g.:

    int    *ip = NULL;    /* pointer to an integer */
    double *dp = NULL;    /* pointer to a double */
    float  *fp = NULL;    /* pointer to a float */
    char   *ch = NULL;    /* pointer to a character */

### NULL pointer
*   Note the NULL assignments above. It's good practice to assign a NULL value to a pointer var at
    the time of var declaration, in case you don't have an exact address to assign.

Basic pointer example
---------------------

    #include <stdio.h>

    int main () {

        int  var = 20;   /* actual variable declaration */
        int  *ip;        /* pointer variable declaration */

        ip = &var;       /* store address of var in pointer variable*/

        printf("Address of var variable: %x\n", &var);
            // OUTPUT :: "Address stored in ip variable: bffd8b3c"

        printf("Address stored in pointer variable (ip): %x\n", ip);
            // OUTPUT :: "Address stored in ip variable: bffd8b3c"

        printf("Value of *ip variable, accessed using the pointer (ip): %d\n", *ip);
            // OUTPUT :: "Value of *ip variable: 20 */"

        return 0;
    }

Pointer arithmetic
------------------
WIP -- see https://www.tutorialspoint.com/cprogramming/c_pointer_arithmetic.htm

Pointers section is WIP
    *   see https://www.tutorialspoint.com/cprogramming/c_pointers.htm#sub-menu


----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
Links
=====
C REPL: https://repl.it/repls/PoliteJuniorAssassinbug

Code examples
-------------
Neovim indent handler:
    github.com/neovim/neovim/blob/c0e45d97b0cbc700cd6f2b9733c15875339262df/src/nvim/indent_c.c
