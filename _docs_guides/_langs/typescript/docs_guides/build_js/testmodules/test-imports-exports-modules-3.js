"use strict";
(function (Material) {
    Material[Material["Wood"] = 0] = "Wood";
    Material[Material["Stone"] = 1] = "Stone";
    Material[Material["Brick"] = 2] = "Brick";
    Material[Material["Steel"] = 3] = "Steel";
    Material[Material["Clay"] = 4] = "Clay";
    Material[Material["Concrete"] = 5] = "Concrete";
    Material[Material["Cement"] = 6] = "Cement";
    Material[Material["Marble"] = 7] = "Marble";
})(exports.Material || (exports.Material = {}));
var Material = exports.Material;
class Building {
    constructor(mainMaterial, ...otherMaterials) {
        this.mainMaterial = mainMaterial;
        this.materialsUsed = otherMaterials;
    }
}
exports.Building = Building;
class Shed extends Building {
    constructor(mainItemStored, mainMaterial, ...otherMaterials) {
        super(mainMaterial, ...otherMaterials);
        this.mainItemStored = mainItemStored;
    }
}
exports.Shed = Shed;
exports.fishingShed = new Shed('fish', Material.Wood);
