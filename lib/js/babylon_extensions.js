
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