export enum Material {
  Wood, Stone, Brick, Steel, Clay, Concrete, Cement, Marble
}

export class Building {
  mainMaterial: Material;
  materialsUsed: Material[];
  constructor(mainMaterial: Material, ...otherMaterials: Material[]) {
    this.mainMaterial = mainMaterial;
    this.materialsUsed = otherMaterials;
  }
}

export class Shed extends Building {
  constructor(public mainItemStored: string, mainMaterial: Material, ...otherMaterials: Material[]) {
    super(mainMaterial, ...otherMaterials);
  }
}

export let fishingShed = new Shed('fish', Material.Wood);
