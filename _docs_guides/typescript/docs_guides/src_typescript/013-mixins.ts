console.log('----------------------------------------------------------------------------------');
//############################################
//#          EXAMPLE OF MIXIN SETUP          #
//############################################
console.log('***************** EXAMPLE OF MIXIN SETUP *****************');

console.log(" ----- Create 2 classes that will act as mixins -----");
class Disposable {
  isDisposed: boolean;
  dispose() {
    this.isDisposed = true;
  }
}

class Activatable {
  isActive: boolean;
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
class SmartObject implements Disposable, Activatable {
  
  constructor() {
    setInterval(() => console.log(this.isActive + " : " + this.isDisposed), 500);
  }

  interact() {
    this.activate();
  }

  // Disposable
  isDisposed: boolean = false;
  dispose: () => void;

  // Activatable
  isActive: boolean = false;
  activate: () => void;
  deactivate: () => void;
}

applyMixins(SmartObject, [Disposable, Activatable]);

let smartObj = new SmartObject();
setTimeout(() => smartObj.interact(), 1000);

////////////////////////////////////////
// In your runtime library somewhere
////////////////////////////////////////

function applyMixins(derivedCtor: any, baseCtors: any[]) {
    baseCtors.forEach(baseCtor => {
        Object.getOwnPropertyNames(baseCtor.prototype).forEach(name => {
            derivedCtor.prototype[name] = baseCtor.prototype[name];
        });
    });
}