part of Babylon;

// ### BaseTexture ##############################


/// Base class of all the textures in babylon.
/// It groups all the common properties the materials, post process, lights... might need
/// in order to make a correct use of the texture.
@JS()
class BaseTexture {
	external BaseTexture(Scene scene);

	// ### Member Fields ##############################

	/// Define the list of animation attached to the texture.
	external List<Animation> get animations;
	external void set animations(List<Animation> val);

	/// With compliant hardware and browser (supporting anisotropic filtering)
	/// this defines the level of anisotropic filtering in the texture.
	/// The higher the better but the slower. This defaults to 4 as it seems to be the best tradeoff.
	external num get anisotropicFilteringLevel;
	external void set anisotropicFilteringLevel(num val);

	/// Get if the texture can rescale.
	external bool get canRescale;
	external void set canRescale(bool val);

	/// Define the UV chanel to use starting from 0 and defaulting to 0.
	/// This is part of the texture as textures usually maps to one uv set.
	external num get coordinatesIndex;
	external void set coordinatesIndex(num val);

	/// How a texture is mapped.
	external num get coordinatesMode;
	external void set coordinatesMode(num val);

	/// Define the current state of the loading sequence when in delayed load mode.
	external num get delayLoadState;
	external void set delayLoadState(num val);

	/// Define if the texture contains data in gamma space (most of the png/jpg aside bump).
	/// HDR texture are usually stored in linear space.
	/// This only impacts the PBR and Background materials
	external bool get gammaSpace;
	external void set gammaSpace(bool val);

	/// Defines if the alpha value should be determined via the rgb values.
	/// If true the luminance of the pixel might be used to find the corresponding alpha value.
	external bool get getAlphaFromRGB;
	external void set getAlphaFromRGB(bool val);

	/// Define if the texture is having a usable alpha value (can be use for transparency or glossiness for instance).
	external bool get hasAlpha;
	external void set hasAlpha(bool val);

	/// Is Z inverted in the texture (useful in a cube texture).
	external bool get invertZ;
	external void set invertZ(bool val);

	/// Define if the texture is a 3d texture (webgl 2) or if false a 2d texture.
	external bool get is3D;
	external void set is3D(bool val);

	/// Define if the texture is preventinga material to render or not.
	/// If not and the texture is not ready, the engine will use a default black texture instead.
	external bool get isBlocking;
	external void set isBlocking(bool val);

	/// Define if the texture is a cube texture or if false a 2d texture.
	external bool get isCube;
	external void set isCube(bool val);

	/// Gets whether or not the texture contains RGBD data.
	external bool get isRGBD;

	/// Define if the texture is a render target.
	external bool get isRenderTarget;
	external void set isRenderTarget(bool val);

	/// Intensity or strength of the texture.
	/// It is commonly used by materials to fine tune the intensity of the texture
	external num get level;
	external void set level(num val);

	/// With prefiltered texture, defined the offset used during the prefiltering steps.
	external num get lodGenerationOffset;
	external void set lodGenerationOffset(num val);

	/// With prefiltered texture, defined the scale used during the prefiltering steps.
	external num get lodGenerationScale;
	external void set lodGenerationScale(num val);

	/// Gets or sets an object used to store user defined information.
	external dynamic get metadata;
	external void set metadata(dynamic val);

	/// Define the name of the texture.
	external String get name;
	external void set name(String val);

	/// Are mip maps generated for this texture or not.
	external bool get noMipmap;
	external void set noMipmap(bool val);

	/// Callback triggered when the texture has been disposed.
	/// Kept for back compatibility, you can use the onDisposeObservable instead.
	external Function get onDispose;
	external void set onDispose(Function val);

	/// An event triggered when the texture is disposed.
	external Observable<BaseTexture> get onDisposeObservable;

	/// For internal use only. Please do not use.
	external dynamic get reservedDataStore;
	external void set reservedDataStore(dynamic val);

	/// Get the polynomial representation of the texture data.
	/// This is mainly use as a fast way to recover IBL Diffuse irradiance data.
	external SphericalPolynomial get sphericalPolynomial;
	external void set sphericalPolynomial(SphericalPolynomial val);

	/// Get the texture underlying format (RGB, RGBA...)
	external num get textureFormat;
	external void set textureFormat(num val);

	/// Get the texture underlying type (INT, FLOAT...)
	external num get textureType;
	external void set textureType(num val);

	/// Define the unique id of the texture in the scene.
	external String get uid;
	external void set uid(String val);

	/// Gets or sets the unique id of the texture
	external num get uniqueId;
	external void set uniqueId(num val);

	/// Value
	/// Type
	/// Description
	/// 
	/// 
	/// 
	/// 0
	/// CLAMP_ADDRESSMODE
	/// 
	/// 
	/// 
	/// 1
	/// WRAP_ADDRESSMODE
	/// 
	/// 
	/// 
	/// 2
	/// MIRROR_ADDRESSMODE
	external num get wrapR;
	external void set wrapR(num val);

	/// Value
	/// Type
	/// Description
	/// 
	/// 
	/// 
	/// 0
	/// CLAMP_ADDRESSMODE
	/// 
	/// 
	/// 
	/// 1
	/// WRAP_ADDRESSMODE
	/// 
	/// 
	/// 
	/// 2
	/// MIRROR_ADDRESSMODE
	external num get wrapU;
	external void set wrapU(num val);

	/// Value
	/// Type
	/// Description
	/// 
	/// 
	/// 
	/// 0
	/// CLAMP_ADDRESSMODE
	/// 
	/// 
	/// 
	/// 1
	/// WRAP_ADDRESSMODE
	/// 
	/// 
	/// 
	/// 2
	/// MIRROR_ADDRESSMODE
	external num get wrapV;
	external void set wrapV(num val);

	// ### Member Methods ##############################

	/// Clones the texture.
	external BaseTexture clone();

	/// Triggers the load sequence in delayed load mode.
	external void delayLoad();

	/// Dispose the texture and release its associated resources.
	external void dispose();

	/// Get the base size of the texture.
	/// It can be different from the size if the texture has been resized for POT for instance
	external ISize getBaseSize();

	/// Get the class name of the texture.
	external String getClassName();

	/// Get the underlying lower level texture from Babylon.
	external InternalTexture getInternalTexture();

	/// Get the texture reflection matrix used to rotate/transform the reflection.
	external Matrix getReflectionTextureMatrix();

	/// Get the scene the texture belongs to.
	external Scene getScene();

	/// Get the size of the texture.
	external ISize getSize();

	/// Get the texture transform matrix used to offset tile the texture for istance.
	external Matrix getTextureMatrix();

	/// Get if the texture is ready to be used (downloaded, converted, mip mapped...).
	external bool isReady();

	/// Get if the texture is ready to be consumed (either it is ready or it is not blocking)
	external bool isReadyOrNotBlocking();

	/// Reads the pixels stored in the webgl texture and returns them as an ArrayBuffer.
	/// This will returns an RGBA array buffer containing either in values (0-255) or
	/// float values (0-1) depending of the underlying buffer type.
	external TypedData readPixels([num faceIndex, num level, TypedData buffer]);

	/// Release and destroy the underlying lower level texture aka internalTexture.
	external void releaseInternalTexture();

	/// Scales the texture if is canRescale()
	external void scale(num ratio);

	/// Serialize the texture into a JSON representation that can be parsed later on.
	external dynamic serialize();

	/// Return a string representation of the texture.
	external String toString();

	/// Update the sampling mode of the texture.
	/// Default is Trilinear mode.
	external void updateSamplingMode(num samplingMode);

	// ### Static Fields ##############################

	/// Default anisotropic filtering level for the application.
	/// It is set to 4 as a good tradeoff between perf and quality.
	external static num get DEFAULT_ANISOTROPIC_FILTERING_LEVEL;

	// ### Static Methods ##############################

	/// Helper function to be called back once a list of texture contains only ready textures.
	external static void WhenAllReady(List<BaseTexture> textures, Function callback);
}

// ### Texture ##############################


/// This represents a texture in babylon. It can be easily loaded from a network, base64 or html input.
/// 
/// 
/// see
/// http://doc.babylonjs.com/babylon101/materials#texture
@JS()
class Texture extends BaseTexture {
	external Texture(String url, Scene scene, [bool noMipmap, bool invertY, num samplingMode, Function onLoad, Function onError, dynamic buffer, bool deleteBuffer, num format]); // TODO: Type union: [Nullable<string | ArrayBuffer | HTMLImageElement | Blob>]

	// ### Member Fields ##############################

	/// Gets a boolean indicating if the texture needs to be inverted on the y axis during loading
	external bool get invertY;

	/// Observable triggered once the texture has been loaded.
	external Observable<Texture> get onLoadObservable;

	/// Get the current sampling mode associated with the texture.
	external num get samplingMode;
	external void set samplingMode(num val);

	/// Define an offset on the texture to rotate around the u coordinates of the UVs
	external num get uAng;
	external void set uAng(num val);

	/// Define an offset on the texture to offset the u coordinates of the UVs
	external num get uOffset;
	external void set uOffset(num val);

	/// Defines the center of rotation (U)
	external num get uRotationCenter;
	external void set uRotationCenter(num val);

	/// Define an offset on the texture to scale the u coordinates of the UVs
	external num get uScale;
	external void set uScale(num val);

	/// Define the url of the texture.
	external String get url;
	external void set url(String val);

	/// Define an offset on the texture to rotate around the v coordinates of the UVs
	external num get vAng;
	external void set vAng(num val);

	/// Define an offset on the texture to offset the v coordinates of the UVs
	external num get vOffset;
	external void set vOffset(num val);

	/// Defines the center of rotation (V)
	external num get vRotationCenter;
	external void set vRotationCenter(num val);

	/// Define an offset on the texture to scale the v coordinates of the UVs
	external num get vScale;
	external void set vScale(num val);

	/// Define an offset on the texture to rotate around the w coordinates of the UVs (in case of 3d texture)
	external num get wAng;
	external void set wAng(num val);

	/// Defines the center of rotation (W)
	external num get wRotationCenter;
	external void set wRotationCenter(num val);

	// ### Member Methods ##############################

	/// Update the url (and optional buffer) of this texture if url was null during construction.
	external void updateURL(String url, [dynamic buffer, Function onLoad]); // TODO: Type union: [Nullable<string | ArrayBuffer | HTMLImageElement | Blob>]

	// ### Static Fields ##############################

	/// Bilinear is mag = linear and min = linear and mip = nearest
	external static num get BILINEAR_SAMPLINGMODE;

	/// Texture is not repeating outside of 0..1 UVs
	external static num get CLAMP_ADDRESSMODE;

	/// Cubic coordinates mode
	external static num get CUBIC_MODE;

	/// Equirectangular coordinates mode
	external static num get EQUIRECTANGULAR_MODE;

	/// Explicit coordinates mode
	external static num get EXPLICIT_MODE;

	/// Equirectangular Fixed Mirrored coordinates mode
	external static num get FIXED_EQUIRECTANGULAR_MIRRORED_MODE;

	/// Equirectangular Fixed coordinates mode
	external static num get FIXED_EQUIRECTANGULAR_MODE;

	/// Inverse Cubic coordinates mode
	external static num get INVCUBIC_MODE;

	/// mag = linear and min = linear and mip = none
	external static num get LINEAR_LINEAR;

	/// Trilinear is mag = linear and min = linear and mip = linear
	external static num get LINEAR_LINEAR_MIPLINEAR;

	/// Bilinear is mag = linear and min = linear and mip = nearest
	external static num get LINEAR_LINEAR_MIPNEAREST;

	/// mag = linear and min = nearest and mip = none
	external static num get LINEAR_NEAREST;

	/// mag = linear and min = nearest and mip = linear
	external static num get LINEAR_NEAREST_MIPLINEAR;

	/// mag = linear and min = nearest and mip = nearest
	external static num get LINEAR_NEAREST_MIPNEAREST;

	/// Texture is repeating and mirrored
	external static num get MIRROR_ADDRESSMODE;

	/// mag = nearest and min = linear and mip = none
	external static num get NEAREST_LINEAR;

	/// mag = nearest and min = linear and mip = linear
	external static num get NEAREST_LINEAR_MIPLINEAR;

	/// mag = nearest and min = linear and mip = nearest
	external static num get NEAREST_LINEAR_MIPNEAREST;

	/// mag = nearest and min = nearest and mip = none
	external static num get NEAREST_NEAREST;

	/// nearest is mag = nearest and min = nearest and mip = linear
	external static num get NEAREST_NEAREST_MIPLINEAR;

	/// mag = nearest and min = nearest and mip = nearest
	external static num get NEAREST_NEAREST_MIPNEAREST;

	/// nearest is mag = nearest and min = nearest and mip = linear
	external static num get NEAREST_SAMPLINGMODE;

	/// Planar coordinates mode
	external static num get PLANAR_MODE;

	/// Projection coordinates mode
	external static num get PROJECTION_MODE;

	/// Inverse Cubic coordinates mode
	external static num get SKYBOX_MODE;

	/// Spherical coordinates mode
	external static num get SPHERICAL_MODE;

	/// Trilinear is mag = linear and min = linear and mip = linear
	external static num get TRILINEAR_SAMPLINGMODE;

	/// Gets or sets a boolean which defines if the texture url must be build from the serialized URL instead of just using the name and loading them side by side with the scene file
	external static bool get UseSerializedUrlIfAny;

	/// Texture is repeating outside of 0..1 UVs
	external static num get WRAP_ADDRESSMODE;

	// ### Static Methods ##############################

	/// Creates a texture from its base 64 representation.
	external static Texture CreateFromBase64String(String data, String name, Scene scene, [bool noMipmap, bool invertY, num samplingMode, Function onLoad, Function onError, num format]);

	/// Creates a texture from its data: representation. (data: will be added in case only the payload has been passed in)
	external static Texture LoadFromDataString(String name, dynamic buffer, Scene scene, [bool deleteBuffer, bool noMipmap, bool invertY, num samplingMode, Function onLoad, Function onError, num format]);

	/// Parse the JSON representation of a texture in order to recreate the texture in the given scene.
	external static BaseTexture Parse(dynamic parsedTexture, Scene scene, String rootUrl);
}

// ### InternalTexture ##############################


/// Class used to store data associated with WebGL texture data for the engine
/// This class should not be used directly
@JS()
class InternalTexture {
	external InternalTexture(Engine engine, num dataSource, [bool delayAllocation]);

	// ### Member Fields ##############################

	/// Gets the initial depth of the texture (It could be rescaled if the current system does not support non power of two textures)
	external num get baseDepth;

	/// Gets the initial height of the texture (It could be rescaled if the current system does not support non power of two textures)
	external num get baseHeight;

	/// Gets the initial width of the texture (It could be rescaled if the current system does not support non power of two textures)
	external num get baseWidth;

	/// Gets the data source type of the texture (can be one of the BABYLON.InternalTexture.DATASOURCE_XXXX)
	external num get dataSource;

	/// Gets the depth of the texture
	external num get depth;

	/// Gets the format of the texture (RGB, RGBA...)
	external num get format;

	/// Gets a boolean indicating if the texture needs mipmaps generation
	external bool get generateMipMaps;

	/// Gets the height of the texture
	external num get height;

	/// Gets a boolean indicating if the texture is inverted on Y axis
	external bool get invertY;

	/// Defines if the texture contains 3D data
	external bool get is3D;
	external void set is3D(bool val);

	/// Defines if the texture is a cube texture
	external bool get isCube;
	external void set isCube(bool val);

	/// Defines if the texture is ready
	external bool get isReady;
	external void set isReady(bool val);

	/// Gets or set the next tracker in the list
	external IInternalTextureTracker get next;

	/// Observable called when the texture is loaded
	external Observable<InternalTexture> get onLoadedObservable;

	/// Gets or set the previous tracker in the list
	external IInternalTextureTracker get previous;

	/// Gets the number of samples used by the texture (WebGL2+ only)
	external num get samples;

	/// Gets the sampling mode of the texture
	external num get samplingMode;

	/// Gets the type of the texture (int, float...)
	external num get type;

	/// Gets the URL used to load this texture
	external String get url;

	/// Gets the width of the texture
	external num get width;

	// ### Member Methods ##############################

	/// Dispose the current allocated resources
	external void dispose();

	/// Gets the Engine the texture belongs to.
	external Engine getEngine();

	/// Increments the number of references (ie. the number of Texture that point to it)
	external void incrementReferences();

	/// Change the size of the texture (not the size of the content)
	external void updateSize(int width, int height, [int depth]);

	// ### Static Fields ##############################

	/// Texture data comes from a cube data file
	external static num get DATASOURCE_CUBE;

	/// Texture data come from a prefiltered cube data file
	external static num get DATASOURCE_CUBEPREFILTERED;

	/// Texture data comes from a raw cube data
	external static num get DATASOURCE_CUBERAW;

	/// Texture data comes from a raw cube data encoded with RGBD
	external static num get DATASOURCE_CUBERAW_RGBD;

	/// Texture content is a depth texture
	external static num get DATASOURCE_DEPTHTEXTURE;

	/// Texture content is dynamic (video or dynamic texture)
	external static num get DATASOURCE_DYNAMIC;

	/// Texture content is part of a multi render target process
	external static num get DATASOURCE_MULTIRENDERTARGET;

	/// Texture data comes from raw data (ArrayBuffer)
	external static num get DATASOURCE_RAW;

	/// Texture content is raw 3D data
	external static num get DATASOURCE_RAW3D;

	/// Texture content is generated by rendering to it
	external static num get DATASOURCE_RENDERTARGET;

	/// Texture data is only used for temporary storage
	external static num get DATASOURCE_TEMP;

	/// The source of the texture data is unknown
	external static num get DATASOURCE_UNKNOWN;

	/// Texture data comes from an URL
	external static num get DATASOURCE_URL;

}

// ### CubeTexture ##############################


/// Class for creating a cube texture
@JS()
class CubeTexture extends BaseTexture {
	external CubeTexture(String rootUrl, Scene scene, [List<String> extensions, bool noMipmap, List<String> files, Function onLoad, Function onError, num format, bool prefiltered, dynamic forcedExtension, bool createPolynomials, num lodScale, num lodOffset]);

	// ### Member Fields ##############################

	/// Gets or sets the center of the bounding box associated with the cube texture.
	/// It must define where the camera used to render the texture was set
	external Vector3 get boundingBoxPosition;
	external void set boundingBoxPosition(Vector3 val);

	/// Returns the bounding box size
	external Vector3 get boundingBoxSize;
	external void set boundingBoxSize(Vector3 val);

	/// Gets texture matrix rotation angle around Y axis radians.
	external num get rotationY;

	/// The url of the texture
	external String get url;
	external void set url(String val);

	// ### Member Methods ##############################

	/// Sets the reflection texture matrix
	external void setReflectionTextureMatrix(Matrix value);

	/// Update the url (and optional buffer) of this texture if url was null during construction.
	external void updateURL(String url, [String forcedExtension, Function onLoad]);

	// ### Static Methods ##############################

	/// Creates a cube texture from an array of image urls
	external static CubeTexture CreateFromImages(List<String> files, Scene scene, [bool noMipmap]);

	/// Creates and return a texture created from prefilterd data by tools like IBL Baker or Lys.
	external static CubeTexture CreateFromPrefilteredData(String url, Scene scene, [dynamic forcedExtension, bool createPolynomials]);

	/// Parses text to create a cube texture
	external static CubeTexture Parse(dynamic parsedTexture, Scene scene, String rootUrl);
}

// ### VideoTexture ##############################


/// If you want to display a video in your scene, this is the special texture for that.
/// This special texture works similar to other textures, with the exception of a few parameters.
/// 
/// 
/// see
/// https://doc.babylonjs.com/how_to/video_texture
@JS()
class VideoTexture extends Texture {
	external VideoTexture(String name, dynamic src, Scene scene, [bool generateMipMaps, bool invertY, num samplingMode, VideoTextureSettings settings]); // TODO: Type union: [string | string[] | HTMLVideoElement]

	// ### Member Fields ##############################

	/// Tells whether textures will be updated automatically or user is required to call updateTexture manually
	external bool get autoUpdateTexture;
	external void set autoUpdateTexture(bool val);

	/// Event triggerd when a dom action is required by the user to play the video.
	/// This happens due to recent changes in browser policies preventing video to auto start.
	external Observable<Texture> get onUserActionRequestedObservable;

	/// The video instance used by the texture internally
	external VideoElement get video;
	external void set video(VideoElement val);

	// ### Member Methods ##############################

	/// Update Texture in the auto mode. Does not do anything if settings.autoUpdateTexture is false.
	external void update();

	/// Update Texture in manual mode. Does not do anything if not visible or paused.
	external void updateTexture(bool isVisible);

	// ### Static Methods ##############################

	/// Creates a video texture straight from your WebCam video feed.
	external static void CreateFromWebCam(Scene scene, Function onReady, Object constraints);
}

// ### ColorGradingTexture ##############################


/// This represents a color grading texture. This acts as a lookup table LUT, useful during post process
/// It can help converting any input color in a desired output one. This can then be used to create effects
/// from sepia, black and white to sixties or futuristic rendering...
/// 
/// The only supported format is currently 3dl.
/// More information on LUT: https://en.wikipedia.org/wiki/3D_lookup_table
@JS()
class ColorGradingTexture extends BaseTexture {
	external ColorGradingTexture(String url, Scene scene);

	// ### Member Fields ##############################

	/// The texture URL.
	external String get url;
	external void set url(String val);

	// ### Static Methods ##############################

	/// Parses a color grading texture serialized by Babylon.
	external static ColorGradingTexture Parse(dynamic parsedTexture, Scene scene, String rootUrl);
}

// ### MirrorTexture ##############################


/// Mirror texture can be used to simulate the view from a mirror in a scene.
/// It will dynamically be rendered every frame to adapt to the camera point of view.
/// You can then easily use it as a reflectionTexture on a flat surface.
/// In case the surface is not a plane, please consider relying on reflection probes.
/// 
/// 
/// see
/// https://doc.babylonjs.com/how_to/reflect#mirrors
@JS()
class MirrorTexture extends RenderTargetTexture {
	external MirrorTexture(String name, dynamic size, Scene scene, [bool generateMipMaps, num type, num samplingMode, bool generateDepthBuffer]); // TODO: Type union: [number | object | object]

	// ### Member Fields ##############################

	/// Define the adaptive blur kernel used to blur the reflection if needed.
	/// This will autocompute the closest best match for the blurKernel
	external num get adaptiveBlurKernel;
	external void set adaptiveBlurKernel(num val);

	/// Define the blur kernel used to blur the reflection if needed.
	/// Please consider using adaptiveBlurKernel as it could find the closest best value for you.
	external num get blurKernel;
	external void set blurKernel(num val);

	/// Define the blur kernel on the X Axis used to blur the reflection if needed.
	/// Please consider using adaptiveBlurKernel as it could find the closest best value for you.
	external num get blurKernelX;
	external void set blurKernelX(num val);

	/// Define the blur kernel on the Y Axis used to blur the reflection if needed.
	/// Please consider using adaptiveBlurKernel as it could find the closest best value for you.
	external num get blurKernelY;
	external void set blurKernelY(num val);

	/// Define the blur ratio used to blur the reflection if needed.
	external num get blurRatio;
	external void set blurRatio(num val);

	/// Define the reflection plane we want to use. The mirrorPlane is usually set to the constructed reflector.
	/// It is possible to directly set the mirrorPlane by directly using a BABYLON.Plane(a, b, c, d) where a, b and c give the plane normal vector (a, b, c) and d is a scalar displacement from the mirrorPlane to the origin. However in all but the very simplest of situations it is more straight forward to set it to the reflector as stated in the doc.
	external Plane get mirrorPlane;
	external void set mirrorPlane(Plane val);

}

// ### RawTexture ##############################


/// Raw texture can help creating a texture directly from an array of data.
/// This can be super useful if you either get the data from an uncompressed source or
/// if you wish to create your texture pixel by pixel.
@JS()
class RawTexture extends Texture {
	external RawTexture(TypedData data, num width, num height, num format, Scene scene, [bool generateMipMaps, bool invertY, num samplingMode, num type]);

	// ### Member Fields ##############################

	/// Define the format of the data (RGB, RGBA... Engine.TEXTUREFORMAT_xxx)
	external num get format;
	external void set format(num val);

	// ### Member Methods ##############################

	/// Updates the texture underlying data.
	external void update(TypedData data);

	// ### Static Methods ##############################

	/// Creates an alpha texture from some data.
	external static RawTexture CreateAlphaTexture(TypedData data, num width, num height, Scene scene, [bool generateMipMaps, bool invertY, num samplingMode]);

	/// Creates a luminance alpha texture from some data.
	external static RawTexture CreateLuminanceAlphaTexture(TypedData data, num width, num height, Scene scene, [bool generateMipMaps, bool invertY, num samplingMode]);

	/// Creates a luminance texture from some data.
	external static RawTexture CreateLuminanceTexture(TypedData data, num width, num height, Scene scene, [bool generateMipMaps, bool invertY, num samplingMode]);

	/// Creates a RGBA texture from some data.
	external static RawTexture CreateRGBATexture(TypedData data, num width, num height, Scene scene, [bool generateMipMaps, bool invertY, num samplingMode, num type]);

	/// Creates a RGB texture from some data.
	external static RawTexture CreateRGBTexture(TypedData data, num width, num height, Scene scene, [bool generateMipMaps, bool invertY, num samplingMode, num type]);

	/// Creates a R texture from some data.
	external static RawTexture CreateRTexture(TypedData data, num width, num height, Scene scene, [bool generateMipMaps, bool invertY, num samplingMode, num type]);
}

// ### RawTexture3D ##############################


/// Class used to store 3D textures containing user data
@JS()
class RawTexture3D extends Texture {
	external RawTexture3D(TypedData data, num width, num height, num depth, num format, Scene scene, [bool generateMipMaps, bool invertY, num samplingMode, num textureType]);

	// ### Member Fields ##############################

	/// Gets or sets the texture format to use
	external num get format;
	external void set format(num val);

	// ### Member Methods ##############################

	/// Update the texture with new data
	external void update(TypedData data);

}

// ### RefractionTexture ##############################


/// Creates a refraction texture used by refraction channel of the standard material.
/// It is like a mirror but to see through a material.
/// 
/// 
/// see
/// https://doc.babylonjs.com/how_to/reflect#refraction
@JS()
class RefractionTexture extends RenderTargetTexture {
	external RefractionTexture(String name, num size, Scene scene, [bool generateMipMaps]);

	// ### Member Fields ##############################

	/// Define how deep under the surface we should see.
	external num get depth;
	external void set depth(num val);

	/// Define the reflection plane we want to use. The refractionPlane is usually set to the constructed refractor.
	/// It is possible to directly set the refractionPlane by directly using a BABYLON.Plane(a, b, c, d) where a, b and c give the plane normal vector (a, b, c) and d is a scalar displacement from the refractionPlane to the origin. However in all but the very simplest of situations it is more straight forward to set it to the refractor as stated in the doc.
	external Plane get refractionPlane;
	external void set refractionPlane(Plane val);

}


