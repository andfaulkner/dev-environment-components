
1.  DEFAULT BINDING. if a function is called via standalone invocation (i.e just ` funcName(); `),
    'this' within the called function will be the global object. This even occurs if the function
    is invoked from within another function. It also occurs if the function is actually defined
    within another function e.g.

        function fn1() {
          function fn2() {
            console.log(this);
          }
          fn2();
        } 
        fn1(); // => window ()

    *   'this' isn't bound to a fn until the fn is invoked. Thus, to find ‘this’ you should
        pay attention to how the fn is called or invoked rather than where

    a.  However, if 'use strict' mode is on, 'this' will resolve to 'undefined' in default binding cases

2.  IMPLICIT BINDING. When a function is invoked with an object reference preceding it, it's that
    object (the directly preceding obj) that should be used for the fn call’s ‘this’ binding. e.g.

    obj1.someFn();       //<<< 'this' value in someFn is obj1
    obj1.obj2.someFn();  //<<< 'this' value in someFn is obj2

3.  IIFEs BIND 'this' TO THE GLOBAL OBJECT REGARDLESS OF WHERE THEY ARE INVOKED. Even if the
    surrounding location a IIFE is declared has a different 'this' value, the IIFE still gets its
    this value assigned to the global object.

    a.  Exception: if the IIFE is declared with an arrow function, in which case this is the same
        as the value of the surrounding context. e.g.

        var arr1 = [1, 2, 3, 4]
        Array.prototype.myCustomFunc = function() {
          console.log(this);   //1
          (() => {
            console.log(this); //2
          })();
        }

        arr1.myCustomFunc();
        // output 

4.  ARROW FUNCTIONS BIND 'this' VALUE OF CURRENT LOCATION IN CODE TO FUNCTION BEING DECLARED.
