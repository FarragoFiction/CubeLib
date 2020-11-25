
// A version of ShaderMaterial which allows an alpha testing texture to be passed to the DepthRenderer
// Normally ShaderMaterials are treated as fully solid, which frankly kinda sucks, so I added this.
BABYLON.ShaderMaterialWithAlphaTestTexture = class extends BABYLON.ShaderMaterial {
    constructor(name, scene, shaderPath, options, alphaTexture) {
        super(name, scene, shaderPath, options);

        this.extension_alphaTestTexture = alphaTexture;
    }

    getAlphaTestTexture() {
        return this.extension_alphaTestTexture;
    }
}

// A version of Vector2 with a callback, called when the x or y values change
// Good for keeping track of changes in owner classes
BABYLON.Vector2WithCallback = class extends BABYLON.Vector2 {
    constructor(x,y) {
        super(x,y);
        this.extension_callback = null;
    }

    extension_setCallback(callback) {
        this.extension_callback = callback;
    }

    extension_call() {
        if (this.extension_callback != null) {
            this.extension_callback(this);
        }
    }

    get x() { return super.x; }
    set x(val) { super.x = val; this.extension_call(); }

    get y() { return super.y; }
    set y(val) { super.y = val; this.extension_call(); }

    addInPlace(otherVector) { super.addInPlace(otherVector); this.extension_call(); return this; }
    divideInPlace(otherVector) { super.divideInPlace(otherVector); this.extension_call(); return this; }
    multiplyInPlace(otherVector) { super.multiplyInPlace(otherVector); this.extension_call(); return this; }
    negateInPlace() { super.negateInPlace(); this.extension_call(); return this; }
    scaleInPlace(scale) { super.scaleInPlace(scale); this.extension_call(); return this; }
    subtractInPlace(otherVector) { super.subtractInPlace(otherVector); this.extension_call(); return this; }

}