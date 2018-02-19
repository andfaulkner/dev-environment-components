π/**************************************************************************************************/
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
