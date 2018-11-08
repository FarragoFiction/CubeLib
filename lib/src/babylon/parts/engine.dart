part of Babylon;

@JS()
@anonymous
class EngineOptions {
    external factory EngineOptions({
        bool alpha,
        bool antialias,
        bool autoEnableWebVR,
        bool depth,
        bool deterministicLockstep,
        bool disableWebGL2Support,
        bool doNotHandleContextLost,
        bool failIfMajorPerformanceCaveat,
        num limitDeviceRatio,
        int lockstepMaxSteps,
        bool premultipliedAlpha,
        bool preserveDrawingBuffer,
        bool stencil,
    });
}

@JS()
class Engine {
    external Engine(dynamic canvasOrContext, [bool antialias, EngineOptions options, bool adaptToDeviceRatio]);

    // MEMBER FIELDS #################################################################################

    external bool get cullBackFaces;
    //Viewport currentViewport
    external bool get disableManifestCheck;
    external bool get disablePerformanceMonitoringInBackground;
    external bool get disableTextureBindingOptimization;
    external bool get disableUniformBuffers;
    external bool get doNotHandleContextLost;
    //InternalTexture emptyCubeTexture
    //InternalTexture emptyTexture
    //InternalTexture emptyTexture3D
    external bool get enableOfflineSupport;
    external bool get enableUnpackFlipYCached;
    external bool get forcePOTTextures;
    external bool get isFullscreen;
    external bool get isInVRExclusivePointerMode;
    external bool get isPointerLock;
    external bool get isStencilEnable;
    //ILoadingScreen loadingScreen
    external String get loadingUIBackgroundColor;
    external String get loadingUIText;
    external bool get needPOTTextures;
    //Observable<Engine> onAfterShaderCompilationObservable;
    //Observable<Engine> onBeforeShaderCompilationObservable;
    //Observable<Texture> onBeforeTextureInitObservable;
    //Observable<Engine> onBeginFrameObservable;
    //Observable<Engine> onCanvasBlurObservable;
    //Observable<Engine> onCanvasFocusObservable;
    //Observable<PointerEvent> onCanvasPointerOutObservable;
    //Observable<Engine> onContextLostObservable;
    //Observable<Engine> onContextRestoredObservable;
    //Observable<Engine> onEndFrameObservable;
    //Observable<Engine> onResizeObservable;
    //Observable<IDisplayChangedEventArgs> onVRDisplayChangedObservable;
    //Observable<bool> onVRRequestPresentComplete;
    //Observable<Engine> onVRRequestPresentStart;
    //PerformanceMonitor performanceMonitor;
    //List<PostProcess> postProcesses;
    external bool get premultipliedAlpha;
    external bool get preventCacheWipeBetweenFrames;
    external bool get renderEvenInBackground;
    //external List<Scene> get scenes;
    external bool get supportsUniformBuffers;
    external String get textureFormatInUse;
    external List<String> get texturesSupported;
    external bool get validateShaderPrograms;
    external num get webGLVersion;

    // STATIC FIELDS #################################################################################

    external static num get ALPHA_ADD;
    external static num get ALPHA_COMBINE;
    external static num get ALPHA_DISABLE;
    external static num get ALPHA_INTERPOLATE;
    external static num get ALPHA_MAXIMIZED;
    external static num get ALPHA_MULTIPLY;
    external static num get ALPHA_ONEONE;
    external static num get ALPHA_PREMULTIPLIED;
    external static num get ALPHA_PREMULTIPLIED_PORTERDUFF;
    external static num get ALPHA_SCREENMODE;
    external static num get ALPHA_SUBTRACT;
    external static num get ALWAYS;
    //external static IAudioEngine AudioEngineFactory();
    external static String get CodeRepository;
    external static num get CollisionsEpsilon;
    external static num get DECR;
    external static num get DECR_WRAP;
    external static num get DELAYLOADSTATE_LOADED;
    external static num get DELAYLOADSTATE_LOADING;
    external static num get DELAYLOADSTATE_NONE;
    external static num get DELAYLOADSTATE_NOTLOADED;
    external static num get EQUAL;
    //Object ExceptionList;
    external static num get GEQUAL;
    external static num get GREATER;
    external static num get INCR;
    external static num get INCR_WRAP;
    external static num get INVERT;
    external static List<Engine> get Instances;
    external static num get KEEP;
    external static num get LEQUAL;
    external static num get LESS;
    external static Engine get LastCreatedEngine;
    //external static Scene get LastCreatedScene;
    external static num get NEVER;
    external static num get NOTEQUAL;
    external static num get REPLACE;
    external static num get SCALEMODE_CEILING;
    external static num get SCALEMODE_FLOOR;
    external static num get SCALEMODE_NEAREST;
    external static String get ShadersRepository;
    external static num get TEXTUREFORMAT_ALPHA;
    external static num get TEXTUREFORMAT_LUMINANCE;
    external static num get TEXTUREFORMAT_LUMINANCE_ALPHA;
    external static num get TEXTUREFORMAT_R;
    external static num get TEXTUREFORMAT_RED;
    external static num get TEXTUREFORMAT_RED_INTEGER;
    external static num get TEXTUREFORMAT_RG;
    external static num get TEXTUREFORMAT_RGB;
    external static num get TEXTUREFORMAT_RGBA;
    external static num get TEXTUREFORMAT_RGBA_INTEGER;
    external static num get TEXTUREFORMAT_RGB_INTEGER;
    external static num get TEXTUREFORMAT_RG_INTEGER;
    external static num get TEXTURETYPE_BYTE;
    external static num get TEXTURETYPE_FLOAT;
    external static num get TEXTURETYPE_FLOAT_32_UNSIGNED_INT_24_8_REV;
    external static num get TEXTURETYPE_HALF_FLOAT;
    external static num get TEXTURETYPE_INT;
    external static num get TEXTURETYPE_SHORT;
    external static num get TEXTURETYPE_UNSIGNED_BYTE;
    external static num get TEXTURETYPE_UNSIGNED_INT;
    external static num get TEXTURETYPE_UNSIGNED_INTEGER;
    external static num get TEXTURETYPE_UNSIGNED_INT_10F_11F_11F_REV;
    external static num get TEXTURETYPE_UNSIGNED_INT_24_8;
    external static num get TEXTURETYPE_UNSIGNED_INT_2_10_10_10_REV;
    external static num get TEXTURETYPE_UNSIGNED_INT_5_9_9_9_REV;
    external static num get TEXTURETYPE_UNSIGNED_SHORT;
    external static num get TEXTURETYPE_UNSIGNED_SHORT_4_4_4_4;
    external static num get TEXTURETYPE_UNSIGNED_SHORT_5_5_5_1;
    external static num get TEXTURETYPE_UNSIGNED_SHORT_5_6_5;
    external static num get TEXTURE_BILEANEAR_SAMPLINGMODE;
    external static num get TEXTURE_CLAMP_ADDRESSMODE;
    external static num get TEXTURE_CUBIC_MODE;
    external static num get TEXTURE_EQUIRECTANGULAR_MODE;
    external static num get TEXTURE_EXPLICIT_MODE;
    external static num get TEXTURE_FIXED_EQUIRECTANGULAR_MIRRORED_MODE;
    external static num get TEXTURE_FIXED_EQUIRECTANGULAR_MODE;
    external static num get TEXTURE_INVCUBIC_MODE;
    external static num get TEXTURE_LINEAR_LINEAR;
    external static num get TEXTURE_LINEAR_LINEAR_MIPLINEAR;
    external static num get TEXTURE_LINEAR_LINEAR_MIPNEAREST;
    external static num get TEXTURE_LINEAR_NEAREST;
    external static num get TEXTURE_LINEAR_NEAREST_MIPLINEAR;
    external static num get TEXTURE_LINEAR_NEAREST_MIPNEAREST;
    external static num get TEXTURE_MIRROR_ADDRESSMODE;
    external static num get TEXTURE_NEAREST_LINEAR;
    external static num get TEXTURE_NEAREST_LINEAR_MIPLINEAR;
    external static num get TEXTURE_NEAREST_LINEAR_MIPNEAREST;
    external static num get TEXTURE_NEAREST_NEAREST;
    external static num get TEXTURE_NEAREST_NEAREST_MIPLINEAR;
    external static num get TEXTURE_NEAREST_NEAREST_MIPNEAREST;
    external static num get TEXTURE_NEAREST_SAMPLINGMODE;
    external static num get TEXTURE_PLANAR_MODE;
    external static num get TEXTURE_PROJECTION_MODE;
    external static num get TEXTURE_SKYBOX_MODE;
    external static num get TEXTURE_SPHERICAL_MODE;
    external static num get TEXTURE_TRILINEAR_SAMPLING_MODE;
    external static num get TEXTURE_WRAP_ADDRESSMODE;
    external static String get Version;
    //IAudioEngine audioEngine;

    // METHODS #################################################################################

    external bool addExternalData<T>(String key, T data);
    external void applyStates();
    external void attachContextLostEvent(void callback(GL.ContextEvent event));
    external void attachContextRestoredEvent(void callback(GL.ContextEvent event));
    external void beginFrame();
    //external Engine beginOcclusionQuery(num algorithmType, WebGLQuery query); // WebGLQuery?
    external void beginTransformFeedback(bool usePoints);
    external void bindArrayBuffer(GL.Buffer buffer);
    //external void bindBuffers(dynamic vertexBuffers, GL.Buffer indexBuffer, dynamic effect); // todo: vertexBuffers -> Map<String, VertexBuffer>, effect -> Effect
    //external void bindBuffersDirectly(GL.Buffer vertexBuffer, GL.Buffer indexBuffer, List<int> vertexDeclaration, int vertexStrideSize, dynamic effect); // todo: effect -> Effect
    //bindFrameBuffer
    //bindSamplers
    external void bindTransformFeedback(GL.TransformFeedback value);
    external void bindTransformFeedbackBuffer(GL.Buffer value);
    external void bindUniformBlock(GL.Program shaderProgram, String blockName, int index);
    external void bindUniformBuffer(GL.Buffer buffer);
    external void bindUniformBufferBase(GL.Buffer buffer, int location);
    external void bindVertexArrayObject(GL.VertexArrayObject vertexArrayObject, GL.Buffer indexBuffer);
    //external void clear()
    external void clearInternalTexturesCache();
    //createCubeTexture
    //createDepthStencilTexture
    //createDynamicTexture
    external GL.Buffer createDynamicUniformBuffer(List<double> elements);
}
