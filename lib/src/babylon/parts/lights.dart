part of Babylon;

// ### Light ##############################


/// Base class of all the lights in Babylon. It groups all the generic information about lights.
/// Lights are used, as you would expect, to affect how meshes are seen, in terms of both illumination and colour.
/// All meshes allow light to pass through them unless shadow generation is activated. The default number of lights allowed is four but this can be increased.
@JS()
abstract class Light extends Node {
	external Light(String name, Scene scene):super(name,scene);

	// ### Member Fields ##############################

	/// Diffuse gives the basic color to an object.
	external Color3 get diffuse;
	external void set diffuse(Color3 val);

	/// Sets the layer id use to find what meshes are not impacted by the light.
	/// Inactive if 0
	external num get excludeWithLayerMask;
	external void set excludeWithLayerMask(num val);

	/// Sets the meshes not impacted by this light.
	external List<AbstractMesh> get excludedMeshes;
	external void set excludedMeshes(List<AbstractMesh> val);

	/// Defines the falloff type for this light. This lets overrriding how punctual light are
	/// falling off base on range or angle.
	/// This can be set to any values in Light.FALLOFF_x.
	external num get falloffType;
	external void set falloffType(num val);

	/// Sets the layer id use to find what meshes are impacted by the light.
	/// Inactive if 0
	external num get includeOnlyWithLayerMask;
	external void set includeOnlyWithLayerMask(num val);

	/// Sets the only meshes impacted by this light.
	external List<AbstractMesh> get includedOnlyMeshes;
	external void set includedOnlyMeshes(List<AbstractMesh> val);

	/// Strength of the light.
	/// Note: By default it is define in the framework own unit.
	/// Note: In PBR materials the intensityMode can be use to chose what unit the intensity is defined in.
	external num get intensity;
	external void set intensity(num val);

	/// Sets the photometric scale used to interpret the intensity.
	/// This is only relevant with PBR Materials where the light intensity can be defined in a physical way.
	external num get intensityMode;
	external void set intensityMode(num val);

	/// Sets the lightmap mode of this light (should be one of the constants defined by Light.LIGHTMAP_x)
	external num get lightmapMode;
	external void set lightmapMode(num val);

	/// sets the light radius used by PBR Materials to simulate soft area lights.
	external num get radius;
	external void set radius(num val);

	/// Defines how far from the source the light is impacting in scene units.
	/// Note: Unused in PBR material as the distance light falloff is defined following the inverse squared falloff.
	external num get range;
	external void set range(num val);

	/// Defines the rendering priority of the lights. It can help in case of fallback or number of lights
	/// exceeding the number allowed of the materials.
	external num get renderPriority;
	external void set renderPriority(num val);

	/// Sets wether or not the shadows are enabled for this light. This can help turning off/on shadow without detaching
	/// the current shadow generator.
	external bool get shadowEnabled;
	external void set shadowEnabled(bool val);

	/// Specular produces a highlight color on an object.
	/// Note: This is note affecting PBR materials.
	external Color3 get specular;
	external void set specular(Color3 val);

	// ### Member Methods ##############################

	/// Specifies if the light will affect the passed mesh.
	external bool canAffectMesh(AbstractMesh mesh);

	/// Returns a new Light object, named "name", from the current one.
	external Light clone(String name);

	/// Returns a Vector3, the absolute light position in the World.
	external Vector3 getAbsolutePosition();

	/// Returns the intensity scaled by the Photometric Scale according to the light type and intensity mode.
	external num getScaledIntensity();

	/// Returns the Light associated shadow generator if any.
	external IShadowGenerator getShadowGenerator();

	/// Returns the light type ID (integer).
	external num getTypeID();

	/// Prepares the list of defines specific to the light type.
	external void prepareLightSpecificDefines(dynamic defines, num lightIndex);

	/// Serializes the current light into a Serialization object.
	external dynamic serialize();

	/// Converts the light information to a readable string for debug purpose.
	external String toString([bool fullDetails]);

	/// Sets the passed Effect "effect" with the Light information.
	external Light transferToEffect(Effect effect, String lightIndex);

	// ### Static Fields ##############################

	/// Falloff Default: light is falling off following the material specification:
	/// standard material is using standard falloff whereas pbr material can request special falloff per materials.
	external static num get FALLOFF_DEFAULT;

	/// Falloff gltf: light is falling off as described in the gltf moving to PBR document
	/// to enhance interoperability with other engines.
	external static num get FALLOFF_GLTF;

	/// Falloff Physical: light is falling off following the inverse squared distance law.
	external static num get FALLOFF_PHYSICAL;

	/// Falloff Standard: light is falling off like in the standard material
	/// to enhance interoperability with other materials.
	external static num get FALLOFF_STANDARD;

	/// Each light type uses the default quantity according to its type:
	/// point/spot lights use luminous intensity
	/// directional lights use illuminance
	external static num get INTENSITYMODE_AUTOMATIC;

	/// lux (lm/m^2)
	external static num get INTENSITYMODE_ILLUMINANCE;

	/// nit (cd/m^2)
	external static num get INTENSITYMODE_LUMINANCE;

	/// candela (lm/sr)
	external static num get INTENSITYMODE_LUMINOUSINTENSITY;

	/// lumen (lm)
	external static num get INTENSITYMODE_LUMINOUSPOWER;

	/// If every light affecting the material is in this lightmapMode,
	/// material.lightmapTexture adds or multiplies
	/// (depends on material.useLightmapAsShadowmap)
	/// after every other light calculations.
	external static num get LIGHTMAP_DEFAULT;

	/// material.lightmapTexture as only lighting
	/// no light calculation from this light
	/// only adds dynamic shadows from this light
	external static num get LIGHTMAP_SHADOWSONLY;

	/// material.lightmapTexture as only diffuse lighting from this light
	/// adds only specular lighting from this light
	/// adds dynamic shadows
	external static num get LIGHTMAP_SPECULAR;

	/// Light type const id of the directional light.
	external static num get LIGHTTYPEID_DIRECTIONALLIGHT;

	/// Light type const id of the hemispheric light.
	external static num get LIGHTTYPEID_HEMISPHERICLIGHT;

	/// Light type const id of the point light.
	external static num get LIGHTTYPEID_POINTLIGHT;

	/// Light type const id of the spot light.
	external static num get LIGHTTYPEID_SPOTLIGHT;

	// ### Static Methods ##############################

	/// Sort function to order lights for rendering.
	external static num CompareLightsPriority(Light a, Light b);

	/// Creates a new typed light from the passed type (integer) : point light = 0, directional light = 1, spot light = 2, hemispheric light = 3.
	/// This new light is named "name" and added to the passed scene.
	external static Function GetConstructorFromName(num type, String name, Scene scene);

	/// Parses the passed "parsedLight" and returns a new instanced Light from this parsing.
	external static Light Parse(dynamic parsedLight, Scene scene);
}

// ### DirectionalLight ##############################


/// A directional light is defined by a direction (what a surprise!).
/// The light is emitted from everywhere in the specified direction, and has an infinite range.
/// An example of a directional light is when a distance planet is lit by the apparently parallel lines of light from its sun. Light in a downward direction will light the top of an object.
/// Documentation: https://doc.babylonjs.com/babylon101/lights
@JS()
class DirectionalLight extends ShadowLight {
	external DirectionalLight(String name, Vector3 direction, Scene scene):super(name,scene);

	// ### Member Fields ##############################

	/// Automatically compute the projection matrix to best fit (including all the casters)
	/// on each frame.
	external bool get autoUpdateExtends;
	external void set autoUpdateExtends(bool val);

	/// Specifies a fix frustum size for the shadow generation.
	external num get shadowFrustumSize;
	external void set shadowFrustumSize(num val);

	/// Sets the shadow projection scale against the optimal computed one.
	/// 0.1 by default which means that the projection window is increase by 10% from the optimal size.
	/// This does not impact in fixed frustum size (shadowFrustumSize being set)
	external num get shadowOrthoScale;
	external void set shadowOrthoScale(num val);

}

// ### PointLight ##############################


/// A point light is a light defined by an unique point in world space.
/// The light is emitted in every direction from this point.
/// A good example of a point light is a standard light bulb.
/// Documentation: https://doc.babylonjs.com/babylon101/lights
@JS()
class PointLight extends ShadowLight {
	external PointLight(String name, Vector3 position, Scene scene):super(name,scene);

	// ### Member Fields ##############################

	/// Setter: In case of direction provided, the shadow will not use a cube texture but simulate a spot shadow as a fallback
	/// This specifies what angle the shadow will use to be created.
	external num get shadowAngle;
	external void set shadowAngle(num val);

}

// ### ShadowLight ##############################


/// Base implementation IShadowLight
/// It groups all the common behaviour in order to reduce dupplication and better follow the DRY pattern.
@JS()
class ShadowLight extends Light {
	external ShadowLight(String name, Scene scene):super(name,scene);

	// ### Member Fields ##############################

	/// Callback defining a custom Projection Matrix Builder.
	/// This can be used to override the default projection matrix computation.
	external Function get customProjectionMatrixBuilder;
	external void set customProjectionMatrixBuilder(Function val);

	/// In 2d mode (needCube being false), sets the direction used to cast the shadow.
	/// Also use as the light direction on spot and directional lights.
	external Vector3 get direction;
	external void set direction(Vector3 val);

	/// Sets the position the shadow will be casted from. Also use as the light position for both
	/// point and spot lights.
	external Vector3 get position;
	external void set position(Vector3 val);

	/// Gets the shadow projection clipping maximum z value.
	external num get shadowMaxZ;

	/// Sets the shadow projection clipping minimum z value.
	external num get shadowMinZ;
	external void set shadowMinZ(num val);

	/// The transformed direction. Direction of the light in world space taking parenting in account.
	external Vector3 get transformedDirection;
	external void set transformedDirection(Vector3 val);

	/// The transformed position. Position of the light in world space taking parenting in account.
	external Vector3 get transformedPosition;
	external void set transformedPosition(Vector3 val);

	// ### Member Methods ##############################

	/// Computes the transformed information (transformedPosition and transformedDirection in World space) of the current light
	external bool computeTransformedInformation();

	/// Forces the shadow generator to recompute the projection matrix even if position and direction did not changed.
	external void forceProjectionMatrixCompute();

	/// Gets the maxZ used for shadow according to both the scene and the light.
	external num getDepthMaxZ(Camera activeCamera);

	/// Gets the minZ used for shadow according to both the scene and the light.
	external num getDepthMinZ(Camera activeCamera);

	/// Return the depth scale used for the shadow map.
	external num getDepthScale();

	/// Returns the light rotation in euler definition.
	external Vector3 getRotation();

	/// Get the direction to use to render the shadow map. In case of cube texture, the face index can be passed.
	external Vector3 getShadowDirection([num faceIndex]);

	/// Returns whether or not the shadow generation require a cube texture or a 2d texture.
	external bool needCube();

	/// Detects if the projection matrix requires to be recomputed this frame.
	external bool needProjectionMatrixCompute();

	/// Sets the ShadowLight direction toward the passed target.
	external Vector3 setDirectionToTarget(Vector3 target);

	/// Sets the shadow projection matrix in parameter to the generated projection matrix.
	external IShadowLight setShadowProjectionMatrix(Matrix matrix, Matrix viewMatrix, List<AbstractMesh> renderList);

}

// ### SpotLight ##############################


/// A spot light is defined by a position, a direction, an angle, and an exponent.
/// These values define a cone of light starting from the position, emitting toward the direction.
/// The angle, in radians, defines the size (field of illumination) of the spotlight's conical beam,
/// and the exponent defines the speed of the decay of the light with distance (reach).
/// Documentation: https://doc.babylonjs.com/babylon101/lights
@JS()
class SpotLight extends ShadowLight {
	external SpotLight(String name, Vector3 position, Vector3 direction, num angle, num exponent, Scene scene):super(name,scene);

	// ### Member Fields ##############################

	/// Sets the cone angle of the spot light in Radians.
	external num get angle;
	external void set angle(num val);

	/// The light decay speed with the distance from the emission spot.
	external num get exponent;
	external void set exponent(num val);

	/// Only used in gltf falloff mode, this defines the angle where
	/// the directional falloff will start before cutting at angle which could be seen
	/// as outer angle.
	external num get innerAngle;
	external void set innerAngle(num val);

	/// Sets the projection texture of the light.
	external BaseTexture get projectionTexture;
	external void set projectionTexture(BaseTexture val);

	/// Sets the far clip of the Spotlight for texture projection.
	external num get projectionTextureLightFar;
	external void set projectionTextureLightFar(num val);

	/// Sets the near clip of the Spotlight for texture projection.
	external num get projectionTextureLightNear;
	external void set projectionTextureLightNear(num val);

	/// Allows reading the projecton texture
	external Matrix get projectionTextureMatrix;
	external void set projectionTextureMatrix(Matrix val);

	/// Sets the Up vector of the Spotlight for texture projection.
	external Vector3 get projectionTextureUpDirection;
	external void set projectionTextureUpDirection(Vector3 val);

	/// Allows scaling the angle of the light for shadow generation only.
	external num get shadowAngleScale;
	external void set shadowAngleScale(num val);

}

// ### HemisphericLight ##############################


/// The HemisphericLight simulates the ambient environment light,
/// so the passed direction is the light reflection direction, not the incoming direction.
@JS()
class HemisphericLight extends Light {
	external HemisphericLight(String name, Vector3 direction, Scene scene):super(name,scene);

	// ### Member Fields ##############################

	/// The light reflection direction, not the incoming direction.
	external Vector3 get direction;
	external void set direction(Vector3 val);

	/// The groundColor is the light in the opposite direction to the one specified during creation.
	/// You can think of the diffuse and specular light as coming from the centre of the object in the given direction and the groundColor light in the opposite direction.
	external Color3 get groundColor;
	external void set groundColor(Color3 val);

	// ### Member Methods ##############################

	/// Sets the HemisphericLight direction towards the passed target (Vector3).
	/// Returns the updated direction.
	external Vector3 setDirectionToTarget(Vector3 target);

}


