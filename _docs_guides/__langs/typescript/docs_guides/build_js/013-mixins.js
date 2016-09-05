console.log('----------------------------------------------------------------------------------');
//############################################
//#          EXAMPLE OF MIXIN SETUP          #
//############################################
console.log('***************** EXAMPLE OF MIXIN SETUP *****************');
console.log(" ----- Create 2 classes that will act as mixins -----");
class Disposable {
    dispose() {
        this.isDisposed = true;
    }
}
class Activatable {
    activate() {
        this.isActive = true;
    }
    deactivate() {
        this.isActive = false;
    }
}
console.log(" ----- Create class that 'implements' both mixins and will combine them in -----");
console.log(" ----- Use 'implements Mixin1, Mixin2' to use mixin classes as interfaces, then -----");
console.log(" ----- after that 'mix' the fns in each mixin class into the main class to -----");
console.log(" ----- avoid having to reimplement the fns in each class it's mixing in -----");
console.log(" ----- Main class must have stand-in properties for each method being mixed in -----");
class SmartObject {
    constructor() {
        // Disposable
        this.isDisposed = false;
        // Activatable
        this.isActive = false;
        setInterval(() => console.log(this.isActive + " : " + this.isDisposed), 2500);
    }
    interact() {
        this.activate();
    }
}
////////////////////////////////////////
// In your runtime library somewhere
////////////////////////////////////////
console.log(" ----- Create a method that actually mixes the child classes in -----");
function applyMixins(derivedCtor, baseCtors) {
    baseCtors.forEach(baseCtor => {
        Object.getOwnPropertyNames(baseCtor.prototype).forEach(name => {
            derivedCtor.prototype[name] = baseCtor.prototype[name];
        });
    });
}
console.log(" ----- Mix the mixin classes into the main class -----");
applyMixins(SmartObject, [Disposable, Activatable]);
let smartObj = new SmartObject();
setTimeout(() => smartObj.interact(), 2000);
