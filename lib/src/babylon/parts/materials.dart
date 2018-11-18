part of Babylon;

@JS()
abstract class PushMaterial extends Material {
	PushMaterial(String name, Scene scene, [bool doNotAdd]):super(name,scene,doNotAdd);
}

// ### Material ##############################


/// Base class for the main features of a material in Babylon.js
@JS()
class Material {
	external Material(String name, Scene scene, [bool doNotAdd]);

	// ### Member Fields ##############################

	/// Gets the alpha value of the material
	external num get alpha;

	/// Gets the value of the alpha mode
	external num get alphaMode;

	/// Stores the animations for the material
	external List<Animation> get animations;
	external void set animations(List<Animation> val);

	/// Gets the back-face culling state
	external bool get backFaceCulling;

	/// Specifies if the ready state should be checked on each call
	external bool get checkReadyOnEveryCall;
	external void set checkReadyOnEveryCall(bool val);

	/// Specifies if the ready state should be checked once
	external bool get checkReadyOnlyOnce;
	external void set checkReadyOnlyOnce(bool val);

	/// Specifies if depth writing should be disabled
	external bool get disableDepthWrite;
	external void set disableDepthWrite(bool val);

	/// Specifies if the material should be serialized
	external bool get doNotSerialize;
	external void set doNotSerialize(bool val);

	/// Sets the material fill mode
	external num get fillMode;
	external void set fillMode(num val);

	/// Gets the value of the fog enabled state
	external bool get fogEnabled;

	/// Specifies if depth writing should be forced
	external bool get forceDepthWrite;
	external void set forceDepthWrite(bool val);

	/// Callback triggered to get the render target textures
	external Function get getRenderTargetTextures;
	external void set getRenderTargetTextures(Function val);

	/// Gets a boolean indicating that current material needs to register RTT
	external bool get hasRenderTargetTextures;

	/// The ID of the material
	external String get id;
	external void set id(String val);

	/// Specifies if updates for the material been locked
	external bool get isFrozen;
	external void set isFrozen(bool val);

	/// Gets or sets user defined metadata
	external dynamic get metadata;
	external void set metadata(dynamic val);

	/// The name of the material
	external String get name;
	external void set name(String val);

	/// Gets the depth pre-pass value
	external bool get needDepthPrePass;

	/// Called during a bind event
	external Function get onBind;
	external void set onBind(Function val);

	/// An event triggered when the material is bound
	external Observable<AbstractMesh> get onBindObservable;

	/// Callback triggered when the material is compiled
	external Function get onCompiled;
	external void set onCompiled(Function val);

	/// Called during a dispose event
	external Function get onDispose;
	external void set onDispose(Function val);

	/// An event triggered when the material is disposed
	external Observable<Material> get onDisposeObservable;

	/// Callback triggered when an error occurs
	external Function get onError;
	external void set onError(Function val);

	/// An event triggered when the material is unbound
	external Observable<Material> get onUnBindObservable;

	/// Stores the size of points
	external num get pointSize;
	external void set pointSize(num val);

	/// Sets the state of point cloud mode
	external bool get pointsCloud;
	external void set pointsCloud(bool val);

	/// For internal use only. Please do not use.
	external dynamic get reservedDataStore;
	external void set reservedDataStore(dynamic val);

	/// Specifies if there should be a separate pass for culling
	external bool get separateCullingPass;
	external void set separateCullingPass(bool val);

	/// Stores the value for side orientation
	external num get sideOrientation;
	external void set sideOrientation(num val);

	/// The state of the material
	external String get state;
	external void set state(String val);

	/// Gets or sets the unique id of the material
	external num get uniqueId;
	external void set uniqueId(num val);

	/// Sets the state of wireframe mode
	external bool get wireframe;
	external void set wireframe(bool val);

	/// Stores the z offset value
	external num get zOffset;
	external void set zOffset(num val);

	// ### Member Methods ##############################

	/// Binds the material to the mesh
	external void bind(Matrix world, [Mesh mesh]);

	/// Binds the submesh to the material
	external void bindForSubMesh(Matrix world, Mesh mesh, SubMesh subMesh);

	/// Binds the world matrix to the material
	external void bindOnlyWorldMatrix(Matrix world);

	/// Binds the scene's uniform buffer to the effect.
	external void bindSceneUniformBuffer(Effect effect, UniformBuffer sceneUbo);

	/// Binds the view matrix to the effect
	external void bindView(Effect effect);

	/// Binds the view projection matrix to the effect
	external void bindViewProjection(Effect effect);

	/// Makes a duplicate of the material, and gives it a new name
	external Material clone(String name);

	/// Disposes the material
	external void dispose([bool forceDisposeEffect, bool forceDisposeTextures, bool notBoundToMesh]);

	/// Force shader compilation
	external void forceCompilation(AbstractMesh mesh, [Function onCompiled, Object options]);

	/// Force shader compilation
	external Promise<Null> forceCompilationAsync(AbstractMesh mesh, [Object options]);

	/// Locks updates for the material
	external void freeze();

	/// Gets the active textures from the material
	external List<BaseTexture> getActiveTextures();

	/// Gets the texture used for the alpha test
	external BaseTexture getAlphaTestTexture();

	/// Gets the meshes bound to the material
	external List<AbstractMesh> getBindedMeshes();

	/// Gets the class name of the material
	external String getClassName();

	/// Returns the material effect
	external Effect getEffect();

	/// Returns the current scene
	external Scene getScene();

	/// Specifies if the material uses a texture
	external bool hasTexture(BaseTexture texture);

	/// Specifies if the material is ready to be used
	external bool isReady([AbstractMesh mesh, bool useInstances]);

	/// Specifies that the submesh is ready to be used
	external bool isReadyForSubMesh(AbstractMesh mesh, BaseSubMesh subMesh, [bool useInstances]);

	/// Marks a define in the material to indicate that it needs to be re-computed
	external void markAsDirty(num flag);

	/// Marks the material to indicate that it needs to be re-calculated
	external void markDirty();

	/// Specifies if the material will require alpha blending
	external bool needAlphaBlending();

	/// Specifies if the mesh will require alpha blending
	external bool needAlphaBlendingForMesh(AbstractMesh mesh);

	/// Specifies if this material should be rendered in alpha test mode
	external bool needAlphaTesting();

	/// Serializes this material
	external dynamic serialize();

	/// Returns a string representation of the current material
	external String toString([bool fullDetails]);

	/// Unbinds the material from the mesh
	external void unbind();

	/// Unlocks updates for the material
	external void unfreeze();

	// ### Static Fields ##############################

	/// The all dirty flag value
	external static num get AllDirtyFlag;

	/// The dirty attribute flag value
	external static num get AttributesDirtyFlag;

	/// Returns the clock-wise side orientation
	external static num get ClockWiseSideOrientation;

	/// Returns the counter clock-wise side orientation
	external static num get CounterClockWiseSideOrientation;

	/// The dirty fresnel flag value
	external static num get FresnelDirtyFlag;

	/// The dirty light flag value
	external static num get LightDirtyFlag;

	/// Returns the line list draw mode
	external static num get LineListDrawMode;

	/// Returns the line loop draw mode
	external static num get LineLoopDrawMode;

	/// Returns the line strip draw mode
	external static num get LineStripDrawMode;

	/// The dirty misc flag value
	external static num get MiscDirtyFlag;

	/// Returns the point fill mode
	external static num get PointFillMode;

	/// Returns the point list draw mode
	external static num get PointListDrawMode;

	/// The dirty texture flag value
	external static num get TextureDirtyFlag;

	/// Returns the triangle fan draw mode
	external static num get TriangleFanDrawMode;

	/// Returns the triangle fill mode
	external static num get TriangleFillMode;

	/// Returns the triangle strip draw mode
	external static num get TriangleStripDrawMode;

	/// Returns the wireframe mode
	external static num get WireFrameFillMode;

	// ### Static Methods ##############################

	/// Creates a material from parsed material data
	external static dynamic Parse(dynamic parsedMaterial, Scene scene, String rootUrl);

	/// Creates a MultiMaterial from parsed MultiMaterial data.
	external static MultiMaterial ParseMultiMaterial(dynamic parsedMultiMaterial, Scene scene);
}

// ### StandardMaterial ##############################


/// This is the default material used in Babylon. It is the best trade off between quality
/// and performances.
/// 
/// 
/// see
/// http://doc.babylonjs.com/babylon101/materials
@JS()
class StandardMaterial extends PushMaterial {
	external StandardMaterial(String name, Scene scene);

	// ### Member Fields ##############################

	/// Defines the alpha limits in alpha test mode.
	external num get alphaCutOff;
	external void set alphaCutOff(num val);

	/// The color of the material lit by the environmental background lighting.
	external Color3 get ambientColor;
	external void set ambientColor(Color3 val);

	/// AKA Occlusion Texture in other nomenclature, it helps adding baked shadows into your material.
	external BaseTexture get ambientTexture;
	external void set ambientTexture(BaseTexture val);

	/// Bump mapping is a technique to simulate bump and dents on a rendered surface.
	/// These are made by creating a normal map from an image. The means to do this can be found on the web, a search for 'normal map generator' will bring up free and paid for methods of doing this.
	external BaseTexture get bumpTexture;
	external void set bumpTexture(BaseTexture val);

	/// The color grading curves provide additional color adjustmnent that is applied after any color grading transform (3D LUT).
	/// They allow basic adjustment of saturation and small exposure adjustments, along with color filter tinting to provide white balance adjustment or more stylistic effects.
	/// These are similar to controls found in many professional imaging or colorist software. The global controls are applied to the entire image. For advanced tuning, extra controls are provided to adjust the shadow, midtone and highlight areas of the image;
	/// corresponding to low luminance, medium luminance, and high luminance areas respectively.
	external ColorCurves get cameraColorCurves;
	external void set cameraColorCurves(ColorCurves val);

	/// Sets wether the color curves effect is enabled.
	external bool get cameraColorCurvesEnabled;
	external void set cameraColorCurvesEnabled(bool val);

	/// Gets wether the color grading effect is enabled.
	external bool get cameraColorGradingEnabled;

	/// Sets the Color Grading 2D Lookup Texture.
	external BaseTexture get cameraColorGradingTexture;
	external void set cameraColorGradingTexture(BaseTexture val);

	/// Sets The camera contrast used on this material.
	external num get cameraContrast;
	external void set cameraContrast(num val);

	/// The camera exposure used on this material.
	/// This property is here and not in the camera to allow controlling exposure without full screen post process.
	/// This corresponds to a photographic exposure.
	external num get cameraExposure;
	external void set cameraExposure(num val);

	/// Sets wether tonemapping is enabled or not
	external bool get cameraToneMappingEnabled;
	external void set cameraToneMappingEnabled(bool val);

	/// Custom callback helping to override the default shader used in the material.
	external Function get customShaderNameResolve;
	external void set customShaderNameResolve(Function val);

	/// The basic color of the material as viewed under a light.
	external Color3 get diffuseColor;
	external void set diffuseColor(Color3 val);

	/// Define the diffuse fresnel parameters of the material.
	external FresnelParameters get diffuseFresnelParameters;
	external void set diffuseFresnelParameters(FresnelParameters val);

	/// The basic texture of the material as viewed under a light.
	external BaseTexture get diffuseTexture;
	external void set diffuseTexture(BaseTexture val);

	/// Does lights from the scene impacts this material.
	/// It can be a nice trick for performance to disable lighting on a fully emissive material.
	external bool get disableLighting;
	external void set disableLighting(bool val);

	/// Define the color of the material as if self lit.
	/// This will be mixed in the final result even in the absence of light.
	external Color3 get emissiveColor;
	external void set emissiveColor(Color3 val);

	/// Define the emissive fresnel parameters of the material.
	external FresnelParameters get emissiveFresnelParameters;
	external void set emissiveFresnelParameters(FresnelParameters val);

	/// Define texture of the material as if self lit.
	/// This will be mixed in the final result even in the absence of light.
	external BaseTexture get emissiveTexture;
	external void set emissiveTexture(BaseTexture val);

	/// Sets the Default image processing configuration used either in the this material.
	external ImageProcessingConfiguration get imageProcessingConfiguration;
	external void set imageProcessingConfiguration(ImageProcessingConfiguration val);

	/// In case of refraction, define the value of the indice of refraction.
	external num get indexOfRefraction;
	external void set indexOfRefraction(num val);

	/// If sets to true, x component of normal map value will invert (x = 1.0 - x).
	external bool get invertNormalMapX;
	external void set invertNormalMapX(bool val);

	/// If sets to true, y component of normal map value will invert (y = 1.0 - y).
	external bool get invertNormalMapY;
	external void set invertNormalMapY(bool val);

	/// Invert the refraction texture alongside the y axis.
	/// It can be useful with procedural textures or probe for instance.
	external bool get invertRefractionY;
	external void set invertRefractionY(bool val);

	/// Complex lighting can be computationally expensive to compute at runtime.
	/// To save on computation, lightmaps may be used to store calculated lighting in a texture which will be applied to a given mesh.
	external BaseTexture get lightmapTexture;
	external void set lightmapTexture(BaseTexture val);

	/// If true, some kind of energy conservation will prevent the end result to be more than 1 by reducing
	/// the emissive level when the final color is close to one.
	external bool get linkEmissiveWithDiffuse;
	external void set linkEmissiveWithDiffuse(bool val);

	/// Defines the maximum number of lights that can be used in the material
	external num get maxSimultaneousLights;
	external void set maxSimultaneousLights(num val);

	/// Define the opacity fresnel parameters of the material.
	external FresnelParameters get opacityFresnelParameters;
	external void set opacityFresnelParameters(FresnelParameters val);

	/// Define the transparency of the material from a texture.
	/// The final alpha value can be read either from the red channel (if texture.getAlphaFromRGB is false)
	/// or from the luminance or the current texel (if texture.getAlphaFromRGB is true)
	external BaseTexture get opacityTexture;
	external void set opacityTexture(BaseTexture val);

	/// Apply a scaling factor that determine which "depth" the height map should reprensent. A value between 0.05 and 0.1 is reasonnable in Parallax, you can reach 0.2 using Parallax Occlusion.
	external num get parallaxScaleBias;
	external void set parallaxScaleBias(num val);

	/// Define the reflection fresnel parameters of the material.
	external FresnelParameters get reflectionFresnelParameters;
	external void set reflectionFresnelParameters(FresnelParameters val);

	/// Define the texture used to display the reflection.
	external BaseTexture get reflectionTexture;
	external void set reflectionTexture(BaseTexture val);

	/// Define the refraction fresnel parameters of the material.
	external FresnelParameters get refractionFresnelParameters;
	external void set refractionFresnelParameters(FresnelParameters val);

	/// Define the texture used to display the refraction.
	external BaseTexture get refractionTexture;
	external void set refractionTexture(BaseTexture val);

	/// Helps to define how blurry the reflections should appears in the material.
	external num get roughness;
	external void set roughness(num val);

	/// Define how the color and intensity of the highlight given by the light in the material.
	external Color3 get specularColor;
	external void set specularColor(Color3 val);

	/// Defines how sharp are the highlights in the material.
	/// The bigger the value the sharper giving a more glossy feeling to the result.
	/// Reversely, the smaller the value the blurrier giving a more rough feeling to the result.
	external num get specularPower;
	external void set specularPower(num val);

	/// Define how the color and intensity of the highlight given by the light in the material.
	external BaseTexture get specularTexture;
	external void set specularTexture(BaseTexture val);

	/// If sets to true and backfaceCulling is false, normals will be flipped on the backside.
	external bool get twoSidedLighting;
	external void set twoSidedLighting(bool val);

	/// Does the transparency come from the diffuse texture alpha channel.
	external bool get useAlphaFromDiffuseTexture;
	external void set useAlphaFromDiffuseTexture(bool val);

	/// If true, the emissive value is added into the end result, otherwise it is multiplied in.
	external bool get useEmissiveAsIllumination;
	external void set useEmissiveAsIllumination(bool val);

	/// Defines if the glossiness/roughness of the material should be read from the specular map alpha channel
	external bool get useGlossinessFromSpecularMapAlpha;
	external void set useGlossinessFromSpecularMapAlpha(bool val);

	/// In case of light mapping, define whether the map contains light or shadow informations.
	external bool get useLightmapAsShadowmap;
	external void set useLightmapAsShadowmap(bool val);

	/// In case the depth buffer does not allow enough depth precision for your scene (might be the case in large scenes)
	/// You can try switching to logarithmic depth.
	external bool get useLogarithmicDepth;
	external void set useLogarithmicDepth(bool val);

	/// Allows using an object space normal map (instead of tangent space).
	external bool get useObjectSpaceNormalMap;
	external void set useObjectSpaceNormalMap(bool val);

	/// Is parallax enabled or not.
	external bool get useParallax;
	external void set useParallax(bool val);

	/// Is parallax occlusion enabled or not.
	/// If true, the outcome is way more realistic than traditional Parallax but you can expect a performance hit that worthes consideration.
	external bool get useParallaxOcclusion;
	external void set useParallaxOcclusion(bool val);

	/// If true automatically deducts the fresnels values from the material specularity.
	external bool get useReflectionFresnelFromSpecular;
	external void set useReflectionFresnelFromSpecular(bool val);

	/// Specifies that the material will keeps the reflection highlights over a transparent surface (only the most limunous ones).
	/// A car glass is a good exemple of that. When the street lights reflects on it you can not see what is behind.
	external bool get useReflectionOverAlpha;
	external void set useReflectionOverAlpha(bool val);

	/// Specifies that the material will keep the specular highlights over a transparent surface (only the most limunous ones).
	/// A car glass is a good exemple of that. When sun reflects on it you can not see what is behind.
	external bool get useSpecularOverAlpha;
	external void set useSpecularOverAlpha(bool val);

	// ### Member Methods ##############################

	/// Builds the material UBO layouts.
	/// Used internally during the effect preparation.
	external void buildUniformLayout();

	/// Get the list of animatables in the material.
	external List<IAnimatable> getAnimatables();

	// ### Static Fields ##############################

	/// Are ambient textures enabled in the application.
	external static bool get AmbientTextureEnabled;

	/// Are bump textures enabled in the application.
	external static bool get BumpTextureEnabled;

	/// Are color grading textures enabled in the application.
	external static bool get ColorGradingTextureEnabled;

	/// Are diffuse textures enabled in the application.
	external static bool get DiffuseTextureEnabled;

	/// Are emissive textures enabled in the application.
	external static bool get EmissiveTextureEnabled;

	/// Are fresnels enabled in the application.
	external static bool get FresnelEnabled;

	/// Are lightmap textures enabled in the application.
	external static bool get LightmapTextureEnabled;

	/// Are opacity textures enabled in the application.
	external static bool get OpacityTextureEnabled;

	/// Are reflection textures enabled in the application.
	external static bool get ReflectionTextureEnabled;

	/// Are refraction textures enabled in the application.
	external static bool get RefractionTextureEnabled;

	/// Are specular textures enabled in the application.
	external static bool get SpecularTextureEnabled;

}

// ### ShaderMaterial ##############################


/// The ShaderMaterial object has the necessary methods to pass data from your scene to the Vertex and Fragment Shaders and returns a material that can be applied to any mesh.
/// 
/// This returned material effects how the mesh will look based on the code in the shaders.
/// 
/// see
/// http://doc.babylonjs.com/how_to/shader_material
@JS()
class ShaderMaterial extends Material {
	external ShaderMaterial(String name, Scene scene, dynamic shaderPath, [IShaderMaterialOptions options]);

	// ### Member Methods ##############################

	/// Set a vec2 array in the shader from a number array.
	external ShaderMaterial setArray2(String name, List<num> value);

	/// Set a vec3 array in the shader from a number array.
	external ShaderMaterial setArray3(String name, List<num> value);

	/// Set a vec3 in the shader from a Color3.
	external ShaderMaterial setColor3(String name, Color3 value);

	/// Set a vec3 array in the shader from a Color3 array.
	external ShaderMaterial setColor3Array(String name, List<Color3> value);

	/// Set a vec4 in the shader from a Color4.
	external ShaderMaterial setColor4(String name, Color4 value);

	/// Set a float in the shader.
	external ShaderMaterial setFloat(String name, num value);

	/// Set an array of floats in the shader.
	external ShaderMaterial setFloats(String name, List<num> value);

	/// Set a int in the shader.
	external ShaderMaterial setInt(String name, num value);

	/// Set a mat4 in the shader from a Matrix.
	external ShaderMaterial setMatrix(String name, Matrix value);

	/// Set a mat2 in the shader from a Float32Array.
	external ShaderMaterial setMatrix2x2(String name, Float32List value);

	/// Set a mat3 in the shader from a Float32Array.
	external ShaderMaterial setMatrix3x3(String name, Float32List value);

	/// Set a texture in the shader.
	external ShaderMaterial setTexture(String name, Texture texture);

	/// Set a texture array in the shader.
	external ShaderMaterial setTextureArray(String name, List<Texture> textures);

	/// Set a vec2 in the shader from a Vector2.
	external ShaderMaterial setVector2(String name, Vector2 value);

	/// Set a vec3 in the shader from a Vector3.
	external ShaderMaterial setVector3(String name, Vector3 value);

	/// Set a vec4 in the shader from a Vector4.
	external ShaderMaterial setVector4(String name, Vector4 value);

}

// ### BackgroundMaterial ##############################


/// Background material used to create an efficient environement around your scene.
@JS()
class BackgroundMaterial extends PushMaterial {
	external BackgroundMaterial(String name, Scene scene);

	// ### Member Fields ##############################

	/// The color grading curves provide additional color adjustmnent that is applied after any color grading transform (3D LUT).
	/// They allow basic adjustment of saturation and small exposure adjustments, along with color filter tinting to provide white balance adjustment or more stylistic effects.
	/// These are similar to controls found in many professional imaging or colorist software. The global controls are applied to the entire image. For advanced tuning, extra controls are provided to adjust the shadow, midtone and highlight areas of the image;
	/// corresponding to low luminance, medium luminance, and high luminance areas respectively.
	external ColorCurves get cameraColorCurves;
	external void set cameraColorCurves(ColorCurves val);

	/// Sets wether the color curves effect is enabled.
	external bool get cameraColorCurvesEnabled;
	external void set cameraColorCurvesEnabled(bool val);

	/// Gets wether the color grading effect is enabled.
	external bool get cameraColorGradingEnabled;

	/// Sets the Color Grading 2D Lookup Texture.
	external BaseTexture get cameraColorGradingTexture;
	external void set cameraColorGradingTexture(BaseTexture val);

	/// Sets The camera contrast used on this material.
	external double get cameraContrast;
	external void set cameraContrast(double val);

	/// The camera exposure used on this material.
	/// This property is here and not in the camera to allow controlling exposure without full screen post process.
	/// This corresponds to a photographic exposure.
	external double get cameraExposure;
	external void set cameraExposure(double val);

	/// Sets wether tonemapping is enabled or not
	external bool get cameraToneMappingEnabled;
	external void set cameraToneMappingEnabled(bool val);

	/// Diffuse Texture used in the material.
	/// Should be author in a specific way for the best result (refer to the documentation).
	external BaseTexture get diffuseTexture;
	external void set diffuseTexture(BaseTexture val);

	/// This helps reducing the banding effect that could occur on the background.
	external bool get enableNoise;
	external void set enableNoise(bool val);

	/// The current fov(field of view) multiplier, 0.0 - 2.0. Defaults to 1.0. Lower values "zoom in" and higher values "zoom out".
	/// Best used when trying to implement visual zoom effects like fish-eye or binoculars while not adjusting camera fov.
	/// Recommended to be keep at 1.0 except for special cases.
	external num get fovMultiplier;
	external void set fovMultiplier(num val);

	/// Sets the Default image processing configuration used either in the this material.
	external ImageProcessingConfiguration get imageProcessingConfiguration;
	external void set imageProcessingConfiguration(ImageProcessingConfiguration val);

	/// Number of Simultaneous lights allowed on the material.
	external int get maxSimultaneousLights;
	external void set maxSimultaneousLights(int val);

	/// This helps specifying that the material is falling off to the sky box at grazing angle.
	/// This helps ensuring a nice transition when the camera goes under the ground.
	external bool get opacityFresnel;
	external void set opacityFresnel(bool val);

	/// Key light Color (multiply against the environement texture)
	external Color3 get primaryColor;
	external void set primaryColor(Color3 val);

	/// Defines the level of the highliights (highlight area of the reflection map) in order to help scaling the colors.
	/// The primary color is used at the level chosen to define what the white area would look.
	external double get primaryColorHighlightLevel;
	external void set primaryColorHighlightLevel(double val);

	/// Defines the level of the shadows (dark area of the reflection map) in order to help scaling the colors.
	/// The color opposite to the primary color is used at the level chosen to define what the black area would look.
	external double get primaryColorShadowLevel;
	external void set primaryColorShadowLevel(double val);

	/// This specifies the weight of the reflection against the background in case of reflection Fresnel.
	external num get reflectionAmount;
	external void set reflectionAmount(num val);

	/// Reflection Texture level of blur.
	external double get reflectionBlur;
	external void set reflectionBlur(double val);

	/// This helps specifying the falloff radius off the reflection texture from the sceneCenter.
	/// This helps adding a nice falloff effect to the reflection if used as a mirror for instance.
	external num get reflectionFalloffDistance;
	external void set reflectionFalloffDistance(num val);

	/// This helps specifying that the material is falling off from diffuse to the reflection texture at grazing angle.
	/// This helps adding a mirror texture on the ground.
	external bool get reflectionFresnel;
	external void set reflectionFresnel(bool val);

	/// This specifies the weight of the reflection at grazing angle.
	external num get reflectionReflectance0;
	external void set reflectionReflectance0(num val);

	/// This specifies the weight of the reflection at a perpendicular point of view.
	external num get reflectionReflectance90;
	external void set reflectionReflectance90(num val);

	/// Sets the reflection reflectance fresnel values according to the default standard
	/// empirically know to work well :-)
	external num get reflectionStandardFresnelWeight;
	external void set reflectionStandardFresnelWeight(num val);

	/// Reflection Texture used in the material.
	/// Should be author in a specific way for the best result (refer to the documentation).
	external BaseTexture get reflectionTexture;
	external void set reflectionTexture(BaseTexture val);

	/// In case of opacity Fresnel or reflection falloff, this is use as a scene center.
	/// It is usually zero but might be interesting to modify according to your setup.
	external Vector3 get sceneCenter;
	external void set sceneCenter(Vector3 val);

	/// Helps adjusting the shadow to a softer level if required.
	/// 0 means black shadows and 1 means no shadows.
	external double get shadowLevel;
	external void set shadowLevel(double val);

	/// Specify the list of lights casting shadow on the material.
	/// All scene shadow lights will be included if null.
	external List<IShadowLight> get shadowLights;
	external void set shadowLights(List<IShadowLight> val);

	/// Due to a bug in iOS10, video tags (which are using the background material) are in BGR and not RGB.
	/// Setting this flag to true (not done automatically!) will convert it back to RGB.
	external bool get switchToBGR;
	external void set switchToBGR(bool val);

	/// Enable the FOV adjustment feature controlled by fovMultiplier.
	external bool get useEquirectangularFOV;
	external void set useEquirectangularFOV(bool val);

	/// Helps to directly use the maps channels instead of their level.
	external bool get useRGBColor;
	external void set useRGBColor(bool val);

	// ### Member Methods ##############################

	/// Build the uniform buffer used in the material.
	external void buildUniformLayout();

	// ### Static Fields ##############################

	/// Standard reflectance value at parallel view angle.
	external static num get StandardReflectance0;

	/// Standard reflectance value at grazing angle.
	external static num get StandardReflectance90;

}

// ### MultiMaterial ##############################


/// A multi-material is used to apply different materials to different parts of the same object without the need of
/// separate meshes. This can be use to improve performances.
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/multi_materials
@JS()
class MultiMaterial extends Material {
	external MultiMaterial(String name, Scene scene);

	// ### Member Fields ##############################

	/// Gets or Sets the list of Materials used within the multi material.
	/// They need to be ordered according to the submeshes order in the associated mesh
	external List<Material> get subMaterials;
	external void set subMaterials(List<Material> val);

	// ### Member Methods ##############################

	/// Function used to align with Node.getChildren()
	external List<Material> getChildren();

	/// Get one of the submaterial by its index in the submaterials array
	external Material getSubMaterial(num index);

}

// ### PBRBaseMaterial ##############################


/// The Physically based material base class of BJS.
/// 
/// This offers the main features of a standard PBR material.
/// For more information, please refer to the documentation :
/// http://doc.babylonjs.com/extensions/Physically_Based_Rendering
@JS()
class PBRBaseMaterial extends PushMaterial {
	external PBRBaseMaterial(String name, Scene scene);

	// ### Member Fields ##############################

	/// Sets the transparency mode of the material.
	external num get transparencyMode;
	external void set transparencyMode(num val);

	/// Enabled the use of logarithmic depth buffers, which is good for wide depth buffers.
	external bool get useLogarithmicDepth;
	external void set useLogarithmicDepth(bool val);

	// ### Member Methods ##############################

	/// Initializes the uniform buffer layout for the shader.
	external void buildUniformLayout();

	/// Returns the animatable textures.
	external List<IAnimatable> getAnimatables();

	/// Specifies if the material uses metallic roughness workflow.
	external bool isMetallicWorkflow();

	// ### Static Fields ##############################

	/// PBRMaterialLightFalloff gltf: light is falling off as described in the gltf moving to PBR document
	/// to enhance interoperability with other engines.
	external static num get LIGHTFALLOFF_GLTF;

	/// PBRMaterialLightFalloff Physical: light is falling off following the inverse squared distance law.
	external static num get LIGHTFALLOFF_PHYSICAL;

	/// PBRMaterialLightFalloff Standard: light is falling off like in the standard material
	/// to enhance interoperability with other materials.
	external static num get LIGHTFALLOFF_STANDARD;

}

// ### PBRBaseSimpleMaterial ##############################


/// The Physically based simple base material of BJS.
/// 
/// This enables better naming and convention enforcements on top of the pbrMaterial.
/// It is used as the base class for both the specGloss and metalRough conventions.
@JS()
class PBRBaseSimpleMaterial extends PBRBaseMaterial {
	external PBRBaseSimpleMaterial(String name, Scene scene);

	// ### Member Fields ##############################

	/// Defines the alpha limits in alpha test mode.
	external num get alphaCutOff;
	external void set alphaCutOff(num val);

	/// If sets to true, disables all the lights affecting the material.
	external bool get disableLighting;
	external void set disableLighting(bool val);

	/// If sets to true and backfaceCulling is false, normals will be flipped on the backside.
	external bool get doubleSided;
	external void set doubleSided(bool val);

	/// Emissivie color used to self-illuminate the model.
	external Color3 get emissiveColor;
	external void set emissiveColor(Color3 val);

	/// Emissivie texture used to self-illuminate the model.
	external BaseTexture get emissiveTexture;
	external void set emissiveTexture(BaseTexture val);

	/// Environment Texture used in the material (this is use for both reflection and environment lighting).
	external BaseTexture get environmentTexture;
	external void set environmentTexture(BaseTexture val);

	/// If sets to true, x component of normal map value will invert (x = 1.0 - x).
	external bool get invertNormalMapX;
	external void set invertNormalMapX(bool val);

	/// If sets to true, y component of normal map value will invert (y = 1.0 - y).
	external bool get invertNormalMapY;
	external void set invertNormalMapY(bool val);

	/// Stores the pre-calculated light information of a mesh in a texture.
	external BaseTexture get lightmapTexture;
	external void set lightmapTexture(BaseTexture val);

	/// Number of Simultaneous lights allowed on the material.
	external num get maxSimultaneousLights;
	external void set maxSimultaneousLights(num val);

	/// Normal map used in the model.
	external BaseTexture get normalTexture;
	external void set normalTexture(BaseTexture val);

	/// Occlusion Channel Strenght.
	external num get occlusionStrength;
	external void set occlusionStrength(num val);

	/// Occlusion Texture of the material (adding extra occlusion effects).
	external BaseTexture get occlusionTexture;
	external void set occlusionTexture(BaseTexture val);

	/// If true, the light map contains occlusion information instead of lighting info.
	external bool get useLightmapAsShadowmap;
	external void set useLightmapAsShadowmap(bool val);

}

// ### PBRMaterial ##############################


/// The Physically based material of BJS.
/// 
/// This offers the main features of a standard PBR material.
/// For more information, please refer to the documentation :
/// http://doc.babylonjs.com/extensions/Physically_Based_Rendering
@JS()
class PBRMaterial extends PBRBaseMaterial {
	external PBRMaterial(String name, Scene scene);

	// ### Member Fields ##############################

	/// AKA Diffuse Color in other nomenclature.
	external Color3 get albedoColor;
	external void set albedoColor(Color3 val);

	/// AKA Diffuse Texture in standard nomenclature.
	external BaseTexture get albedoTexture;
	external void set albedoTexture(BaseTexture val);

	/// Defines the alpha limits in alpha test mode.
	external num get alphaCutOff;
	external void set alphaCutOff(num val);

	/// The color of a material in ambient lighting.
	external Color3 get ambientColor;
	external void set ambientColor(Color3 val);

	/// AKA Occlusion Texture in other nomenclature.
	external BaseTexture get ambientTexture;
	external void set ambientTexture(BaseTexture val);

	/// Defines how much the AO map is occluding the analytical lights (point spot...).
	/// 1 means it completely occludes it
	/// 0 mean it has no impact
	external num get ambientTextureImpactOnAnalyticalLights;
	external void set ambientTextureImpactOnAnalyticalLights(num val);

	/// AKA Occlusion Texture Intensity in other nomenclature.
	external num get ambientTextureStrength;
	external void set ambientTextureStrength(num val);

	/// Stores surface normal data used to displace a mesh in a texture.
	external BaseTexture get bumpTexture;
	external void set bumpTexture(BaseTexture val);

	/// The color grading curves provide additional color adjustmnent that is applied after any color grading transform (3D LUT).
	/// They allow basic adjustment of saturation and small exposure adjustments, along with color filter tinting to provide white balance adjustment or more stylistic effects.
	/// These are similar to controls found in many professional imaging or colorist software. The global controls are applied to the entire image. For advanced tuning, extra controls are provided to adjust the shadow, midtone and highlight areas of the image;
	/// corresponding to low luminance, medium luminance, and high luminance areas respectively.
	external ColorCurves get cameraColorCurves;
	external void set cameraColorCurves(ColorCurves val);

	/// Sets wether the color curves effect is enabled.
	external bool get cameraColorCurvesEnabled;
	external void set cameraColorCurvesEnabled(bool val);

	/// Gets wether the color grading effect is enabled.
	external bool get cameraColorGradingEnabled;

	/// Sets the Color Grading 2D Lookup Texture.
	external BaseTexture get cameraColorGradingTexture;
	external void set cameraColorGradingTexture(BaseTexture val);

	/// Sets The camera contrast used on this material.
	external num get cameraContrast;
	external void set cameraContrast(num val);

	/// The camera exposure used on this material.
	/// This property is here and not in the camera to allow controlling exposure without full screen post process.
	/// This corresponds to a photographic exposure.
	external num get cameraExposure;
	external void set cameraExposure(num val);

	/// Sets wether tonemapping is enabled or not
	external bool get cameraToneMappingEnabled;
	external void set cameraToneMappingEnabled(bool val);

	/// Intensity of the direct lights e.g. the four lights available in your scene.
	/// This impacts both the direct diffuse and specular highlights.
	external num get directIntensity;
	external void set directIntensity(num val);

	/// Debug Control allowing disabling the bump map on this material.
	external bool get disableBumpMap;
	external void set disableBumpMap(bool val);

	/// If sets to true, disables all the lights affecting the material.
	external bool get disableLighting;
	external void set disableLighting(bool val);

	/// The color emitted from the material.
	external Color3 get emissiveColor;
	external void set emissiveColor(Color3 val);

	/// Intensity of the emissive part of the material.
	/// This helps controlling the emissive effect without modifying the emissive color.
	external num get emissiveIntensity;
	external void set emissiveIntensity(num val);

	/// Stores the emissive values in a texture.
	external BaseTexture get emissiveTexture;
	external void set emissiveTexture(BaseTexture val);

	/// Enables specular anti aliasing in the PBR shader.
	/// It will both interacts on the Geometry for analytical and IBL lighting.
	/// It also prefilter the roughness map based on the bump values.
	external bool get enableSpecularAntiAliasing;
	external void set enableSpecularAntiAliasing(bool val);

	/// A fresnel is applied to the alpha of the model to ensure grazing angles edges are not alpha tested.
	/// And/Or occlude the blended part.
	external BaseTexture get environmentBRDFTexture;
	external void set environmentBRDFTexture(BaseTexture val);

	/// Intensity of the environment e.g. how much the environment will light the object
	/// either through harmonics for rough material or through the refelction for shiny ones.
	external num get environmentIntensity;
	external void set environmentIntensity(num val);

	/// Enforces alpha test in opaque or blend mode in order to improve the performances of some situations.
	external bool get forceAlphaTest;
	external void set forceAlphaTest(bool val);

	/// Force the shader to compute irradiance in the fragment shader in order to take bump in account.
	external bool get forceIrradianceInFragment;
	external void set forceIrradianceInFragment(bool val);

	/// Force normal to face away from face.
	external bool get forceNormalForward;
	external void set forceNormalForward(bool val);

	/// Sets the Default image processing configuration used either in the this material.
	external ImageProcessingConfiguration get imageProcessingConfiguration;
	external void set imageProcessingConfiguration(ImageProcessingConfiguration val);

	/// source material index of refraction (IOR)' / 'destination material IOR.
	external num get indexOfRefraction;
	external void set indexOfRefraction(num val);

	/// If sets to true, x component of normal map value will invert (x = 1.0 - x).
	external bool get invertNormalMapX;
	external void set invertNormalMapX(bool val);

	/// If sets to true, y component of normal map value will invert (y = 1.0 - y).
	external bool get invertNormalMapY;
	external void set invertNormalMapY(bool val);

	/// Controls if refraction needs to be inverted on Y. This could be useful for procedural texture.
	external bool get invertRefractionY;
	external void set invertRefractionY(bool val);

	/// Stores the pre-calculated light information of a mesh in a texture.
	external BaseTexture get lightmapTexture;
	external void set lightmapTexture(BaseTexture val);

	/// This parameters will make the material used its opacity to control how much it is refracting aginst not.
	/// Materials half opaque for instance using refraction could benefit from this control.
	external bool get linkRefractionWithTransparency;
	external void set linkRefractionWithTransparency(bool val);

	/// Number of Simultaneous lights allowed on the material.
	external num get maxSimultaneousLights;
	external void set maxSimultaneousLights(num val);

	/// Specifies the metallic scalar of the metallic/roughness workflow.
	/// Can also be used to scale the metalness values of the metallic texture.
	external num get metallic;
	external void set metallic(num val);

	/// Used to switch from specular/glossiness to metallic/roughness workflow.
	external BaseTexture get metallicTexture;
	external void set metallicTexture(BaseTexture val);

	/// AKA Glossiness in other nomenclature.
	external num get microSurface;
	external void set microSurface(num val);

	/// Used to enable roughness/glossiness fetch from a separate channel depending on the current mode.
	/// Gray Scale represents roughness in metallic mode and glossiness in specular mode.
	external BaseTexture get microSurfaceTexture;
	external void set microSurfaceTexture(BaseTexture val);

	/// Stores the alpha values in a texture.
	external BaseTexture get opacityTexture;
	external void set opacityTexture(BaseTexture val);

	/// Controls the scale bias of the parallax mode.
	external num get parallaxScaleBias;
	external void set parallaxScaleBias(num val);

	/// The color reflected from the material.
	external Color3 get reflectionColor;
	external void set reflectionColor(Color3 val);

	/// Stores the reflection values in a texture.
	external BaseTexture get reflectionTexture;
	external void set reflectionTexture(BaseTexture val);

	/// AKA Specular Color in other nomenclature.
	external Color3 get reflectivityColor;
	external void set reflectivityColor(Color3 val);

	/// AKA Specular texture in other nomenclature.
	external BaseTexture get reflectivityTexture;
	external void set reflectivityTexture(BaseTexture val);

	/// Stores the refracted light information in a texture.
	external BaseTexture get refractionTexture;
	external void set refractionTexture(BaseTexture val);

	/// Specifies the roughness scalar of the metallic/roughness workflow.
	/// Can also be used to scale the roughness values of the metallic texture.
	external num get roughness;
	external void set roughness(num val);

	/// This is a special control allowing the reduction of the specular highlights coming from the
	/// four lights of the scene. Those highlights may not be needed in full environment lighting.
	external num get specularIntensity;
	external void set specularIntensity(num val);

	/// If sets to true and backfaceCulling is false, normals will be flipped on the backside.
	external bool get twoSidedLighting;
	external void set twoSidedLighting(bool val);

	/// If set to true, no lighting calculations will be applied.
	external bool get unlit;
	external void set unlit(bool val);

	/// A fresnel is applied to the alpha of the model to ensure grazing angles edges are not alpha tested.
	/// And/Or occlude the blended part. (alpha is converted to gamma to compute the fresnel)
	external bool get useAlphaFresnel;
	external void set useAlphaFresnel(bool val);

	/// Specifies that the alpha is coming form the albedo channel alpha channel for alpha blending.
	external bool get useAlphaFromAlbedoTexture;
	external void set useAlphaFromAlbedoTexture(bool val);

	/// Specifies if the ambient texture contains the ambient occlusion information in its red channel only.
	external bool get useAmbientInGrayScale;
	external void set useAmbientInGrayScale(bool val);

	/// Specifies if the metallic texture contains the ambient occlusion information in its red channel.
	external bool get useAmbientOcclusionFromMetallicTextureRed;
	external void set useAmbientOcclusionFromMetallicTextureRed(bool val);

	/// In case the reflectivity map does not contain the microsurface information in its alpha channel,
	/// The material will try to infer what glossiness each pixel should be.
	external bool get useAutoMicroSurfaceFromReflectivityMap;
	external void set useAutoMicroSurfaceFromReflectivityMap(bool val);

	/// In order to support the falloff compatibility with gltf, a special mode has been added
	/// to reproduce the gltf light falloff.
	external bool get useGLTFLightFalloff;
	external void set useGLTFLightFalloff(bool val);

	/// This parameters will enable/disable Horizon occlusion to prevent normal maps to look shiny when the normal
	/// makes the reflect vector face the model (under horizon).
	external bool get useHorizonOcclusion;
	external void set useHorizonOcclusion(bool val);

	/// If true, the light map contains occlusion information instead of lighting info.
	external bool get useLightmapAsShadowmap;
	external void set useLightmapAsShadowmap(bool val);

	/// A fresnel is applied to the alpha of the model to ensure grazing angles edges are not alpha tested.
	/// And/Or occlude the blended part. (alpha stays linear to compute the fresnel)
	external bool get useLinearAlphaFresnel;
	external void set useLinearAlphaFresnel(bool val);

	/// Specifies if the metallic texture contains the metallness information in its blue channel.
	external bool get useMetallnessFromMetallicTextureBlue;
	external void set useMetallnessFromMetallicTextureBlue(bool val);

	/// Specifies if the reflectivity texture contains the glossiness information in its alpha channel.
	external bool get useMicroSurfaceFromReflectivityMapAlpha;
	external void set useMicroSurfaceFromReflectivityMapAlpha(bool val);

	/// Allows using an object space normal map (instead of tangent space).
	external bool get useObjectSpaceNormalMap;
	external void set useObjectSpaceNormalMap(bool val);

	/// Allows using the bump map in parallax mode.
	external bool get useParallax;
	external void set useParallax(bool val);

	/// Allows using the bump map in parallax occlusion mode.
	external bool get useParallaxOcclusion;
	external void set useParallaxOcclusion(bool val);

	/// BJS is using an harcoded light falloff based on a manually sets up range.
	/// In PBR, one way to represents the fallof is to use the inverse squared root algorythm.
	/// This parameter can help you switch back to the BJS mode in order to create scenes using both materials.
	external bool get usePhysicalLightFalloff;
	external void set usePhysicalLightFalloff(bool val);

	/// This parameters will enable/disable radiance occlusion by preventing the radiance to lit
	/// too much the area relying on ambient texture to define their ambient occlusion.
	external bool get useRadianceOcclusion;
	external void set useRadianceOcclusion(bool val);

	/// Specifies that the material will keeps the reflection highlights over a transparent surface (only the most limunous ones).
	/// A car glass is a good exemple of that. When the street lights reflects on it you can not see what is behind.
	external bool get useRadianceOverAlpha;
	external void set useRadianceOverAlpha(bool val);

	/// Specifies if the metallic texture contains the roughness information in its alpha channel.
	external bool get useRoughnessFromMetallicTextureAlpha;
	external void set useRoughnessFromMetallicTextureAlpha(bool val);

	/// Specifies if the metallic texture contains the roughness information in its green channel.
	external bool get useRoughnessFromMetallicTextureGreen;
	external void set useRoughnessFromMetallicTextureGreen(bool val);

	/// Specifies that the material will keep the specular highlights over a transparent surface (only the most limunous ones).
	/// A car glass is a good exemple of that. When sun reflects on it you can not see what is behind.
	external bool get useSpecularOverAlpha;
	external void set useSpecularOverAlpha(bool val);

	// ### Static Fields ##############################

	/// Defines the default value of how much AO map is occluding the analytical lights
	/// (point spot...).
	external static num get DEFAULT_AO_ON_ANALYTICAL_LIGHTS;

	/// PBRMaterialTransparencyMode: Pixels are blended (according to the alpha mode) with the already drawn pixels in the current frame buffer.
	external static num get PBRMATERIAL_ALPHABLEND;

	/// PBRMaterialTransparencyMode: Alpha Test mode, pixel are discarded below a certain threshold defined by the alpha cutoff value.
	external static num get PBRMATERIAL_ALPHATEST;

	/// PBRMaterialTransparencyMode: Pixels are blended (according to the alpha mode) with the already drawn pixels in the current frame buffer.
	/// They are also discarded below the alpha cutoff threshold to improve performances.
	external static num get PBRMATERIAL_ALPHATESTANDBLEND;

	/// PBRMaterialTransparencyMode: No transparency mode, Alpha channel is not use.
	external static num get PBRMATERIAL_OPAQUE;

}

// ### PBRMetallicRoughnessMaterial ##############################


/// The PBR material of BJS following the metal roughness convention.
/// 
/// This fits to the PBR convention in the GLTF definition:
/// https://github.com/KhronosGroup/glTF/tree/2.0/specification/2.0
@JS()
class PBRMetallicRoughnessMaterial extends PBRBaseSimpleMaterial {
	external PBRMetallicRoughnessMaterial(String name, Scene scene);

	// ### Member Fields ##############################

	/// The base color has two different interpretations depending on the value of metalness.
	/// When the material is a metal, the base color is the specific measured reflectance value
	/// at normal incidence (F0). For a non-metal the base color represents the reflected diffuse color
	/// of the material.
	external Color3 get baseColor;
	external void set baseColor(Color3 val);

	/// Base texture of the metallic workflow. It contains both the baseColor information in RGB as
	/// well as opacity information in the alpha channel.
	external BaseTexture get baseTexture;
	external void set baseTexture(BaseTexture val);

	/// Specifies the metallic scalar value of the material.
	/// Can also be used to scale the metalness values of the metallic texture.
	external num get metallic;
	external void set metallic(num val);

	/// Texture containing both the metallic value in the B channel and the
	/// roughness value in the G channel to keep better precision.
	external BaseTexture get metallicRoughnessTexture;
	external void set metallicRoughnessTexture(BaseTexture val);

	/// Specifies the roughness scalar value of the material.
	/// Can also be used to scale the roughness values of the metallic texture.
	external num get roughness;
	external void set roughness(num val);

}

// ### PBRSpecularGlossinessMaterial ##############################


/// The PBR material of BJS following the specular glossiness convention.
/// 
/// This fits to the PBR convention in the GLTF definition:
/// https://github.com/KhronosGroup/glTF/tree/2.0/extensions/Khronos/KHR_materials_pbrSpecularGlossiness
@JS()
class PBRSpecularGlossinessMaterial extends PBRBaseSimpleMaterial {
	external PBRSpecularGlossinessMaterial(String name, Scene scene);

	// ### Member Fields ##############################

	/// Specifies the diffuse color of the material.
	external Color3 get diffuseColor;
	external void set diffuseColor(Color3 val);

	/// Specifies the diffuse texture of the material. This can also contains the opcity value in its alpha
	/// channel.
	external BaseTexture get diffuseTexture;
	external void set diffuseTexture(BaseTexture val);

	/// Specifies the glossiness of the material. This indicates "how sharp is the reflection".
	external num get glossiness;
	external void set glossiness(num val);

	/// Specifies the specular color of the material. This indicates how reflective is the material (none to mirror).
	external Color3 get specularColor;
	external void set specularColor(Color3 val);

	/// Specifies both the specular color RGB and the glossiness A of the material per pixels.
	external BaseTexture get specularGlossinessTexture;
	external void set specularGlossinessTexture(BaseTexture val);

}


