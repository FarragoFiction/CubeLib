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

/// The engine class is responsible for interfacing with all lower-level APIs such as WebGL and Audio
@JS()
class Engine {
	external Engine(dynamic canvasOrContext, [bool antialias, EngineOptions options, bool adaptToDeviceRatio]); // TODO: Type union: [Nullable<HTMLCanvasElement | WebGLRenderingContext>]

	// ### Member Fields ##############################

	/// Gets or sets a boolean indicating if back faces must be culled (true by default)
	external bool get cullBackFaces;
	external void set cullBackFaces(bool val);

	/// Gets the current viewport
	external Viewport get currentViewport;

	/// If set, will be used to request the next animation frame for the render loop
	external ICustomAnimationFrameRequester get customAnimationFrameRequester;
	external void set customAnimationFrameRequester(ICustomAnimationFrameRequester val);

	/// Returns a string describing the current engine
	external String get description;
	external void set description(String val);

	/// Gets or sets a boolean to enable/disable checking manifest if IndexedDB support is enabled (Babylon.js will always consider the database is up to date)
	external bool get disableManifestCheck;
	external void set disableManifestCheck(bool val);

	/// Turn this value on if you want to pause FPS computation when in background
	external bool get disablePerformanceMonitorInBackground;
	external void set disablePerformanceMonitorInBackground(bool val);

	/// Gets or sets a value indicating if we want to disable texture binding optimization.
	/// This could be required on some buggy drivers which wants to have textures bound in a progressive order.
	/// By default Babylon.js will try to let textures bound where they are and only update the samplers to point where the texture is
	external bool get disableTextureBindingOptimization;
	external void set disableTextureBindingOptimization(bool val);

	/// Gets or sets a boolean indicating that uniform buffers must be disabled even if they are supported
	external bool get disableUniformBuffers;
	external void set disableUniformBuffers(bool val);

	/// Gets or sets a boolean indicating if resources should be retained to be able to handle context lost events
	external bool get doNotHandleContextLost;
	external void set doNotHandleContextLost(bool val);

	/// Gets the default empty cube texture
	external InternalTexture get emptyCubeTexture;

	/// Gets the default empty texture
	external InternalTexture get emptyTexture;

	/// Gets the default empty 3D texture
	external InternalTexture get emptyTexture3D;

	/// Gets or sets a boolean to enable/disable IndexedDB support and avoid XHR on .manifest
	external bool get enableOfflineSupport;
	external void set enableOfflineSupport(bool val);

	/// In case you are sharing the context with other applications, it might
	/// be interested to not cache the unpack flip y state to ensure a consistent
	/// value would be set.
	external bool get enableUnpackFlipYCached;
	external void set enableUnpackFlipYCached(bool val);

	/// Gets or sets a boolean that indicates if textures must be forced to power of 2 size even if not required
	external bool get forcePOTTextures;
	external void set forcePOTTextures(bool val);

	/// Gets a boolean indicating if the engine is currently rendering in fullscreen mode
	external bool get isFullscreen;

	/// Gets a boolean indicating that the engine is currently in VR exclusive mode for the pointers
	external bool get isInVRExclusivePointerMode;

	/// Gets a boolean indicating if the pointer is currently locked
	external bool get isPointerLock;

	/// Returns true if the stencil buffer has been enabled through the creation option of the context.
	external bool get isStencilEnable;
	external void set isStencilEnable(bool val);

	/// Sets the current loading screen object
	external ILoadingScreen get loadingScreen;
	external void set loadingScreen(ILoadingScreen val);

	/// Sets the current loading screen background color
	external String get loadingUIBackgroundColor;
	external void set loadingUIBackgroundColor(String val);

	/// Sets the current loading screen text
	external String get loadingUIText;
	external void set loadingUIText(String val);

	/// Gets a boolean indicating that only power of 2 textures are supported
	/// Please note that you can still use non power of 2 textures but in this case the engine will forcefully convert them
	external bool get needPOTTextures;

	/// Observable raised when the engine has jsut compiled a shader
	external Observable<Engine> get onAfterShaderCompilationObservable;

	/// Observable raised when the engine is about to compile a shader
	external Observable<Engine> get onBeforeShaderCompilationObservable;

	/// Observable event triggered before each texture is initialized
	external Observable<Texture> get onBeforeTextureInitObservable;

	/// Observable raised when the engine begins a new frame
	external Observable<Engine> get onBeginFrameObservable;

	/// Observable event triggered each time the canvas loses focus
	external Observable<Engine> get onCanvasBlurObservable;

	/// Observable event triggered each time the canvas gains focus
	external Observable<Engine> get onCanvasFocusObservable;

	/// Observable event triggered each time the canvas receives pointerout event
	external Observable<PointerEvent> get onCanvasPointerOutObservable;

	/// Observable signaled when a context lost event is raised
	external Observable<Engine> get onContextLostObservable;

	/// Observable signaled when a context restored event is raised
	external Observable<Engine> get onContextRestoredObservable;

	/// Observable raised when the engine ends the current frame
	external Observable<Engine> get onEndFrameObservable;

	/// Event raised when a new scene is created
	external Observable<Scene> get onNewSceneAddedObservable;

	/// Observable event triggered each time the rendering canvas is resized
	external Observable<Engine> get onResizeObservable;

	/// Observable signaled when VR display mode changes
	external Observable<IDisplayChangedEventArgs> get onVRDisplayChangedObservable;

	/// Observable signaled when VR request present is complete
	external Observable<bool> get onVRRequestPresentComplete;

	/// Observable signaled when VR request present starts
	external Observable<Engine> get onVRRequestPresentStart;

	/// Gets the performance monitor attached to this engine
	external PerformanceMonitor get performanceMonitor;

	/// Gets the list of created postprocesses
	external List<PostProcess> get postProcesses;

	/// Defines whether the engine has been created with the premultipliedAlpha option on or not.
	external bool get premultipliedAlpha;
	external void set premultipliedAlpha(bool val);

	/// Gets or sets a boolean indicating that cache can be kept between frames
	external bool get preventCacheWipeBetweenFrames;
	external void set preventCacheWipeBetweenFrames(bool val);

	/// Gets or sets a boolean indicating if the engine must keep rendering even if the window is not in foregroun
	external bool get renderEvenInBackground;
	external void set renderEvenInBackground(bool val);

	/// Gets the list of created scenes
	external List<Scene> get scenes;

	/// Gets a boolean indicating that the engine supports uniform buffers
	external bool get supportsUniformBuffers;

	/// Gets the list of texture formats in use
	external String get textureFormatInUse;

	/// Gets the list of texture formats supported
	external List<String> get texturesSupported;

	/// Gets or sets a boolean indicating if the engine should validate programs after compilation
	external bool get validateShaderPrograms;
	external void set validateShaderPrograms(bool val);

	/// Gets version of the current webGL context
	external num get webGLVersion;

	// ### Member Methods ##############################

	/// Add an externaly attached data from its key.
	/// This method call will fail and return false, if such key already exists.
	/// If you don't care and just want to get the data no matter what, use the more convenient getOrAddExternalDataWithFactory() method.
	external bool addExternalData<T>(String key, T data);

	/// Apply all cached states (depth, culling, stencil and alpha)
	external void applyStates();

	/// Gets a boolean indicating if all created effects are ready
	external bool areAllEffectsReady();

	/// Attach a new callback raised when context lost event is fired
	external void attachContextLostEvent(dynamic callback);

	/// Attach a new callback raised when context restored event is fired
	external void attachContextRestoredEvent(dynamic callback);

	/// Begin a new frame
	external void beginFrame();

	/// Initiates an occlusion query
	external Engine beginOcclusionQuery(num algorithmType, GL.Query query);

	/// Begins a transform feedback operation
	external void beginTransformFeedback(bool usePoints);

	/// Bind a webGL buffer to the webGL context
	external void bindArrayBuffer(GL.Buffer buffer);

	/// Bind a list of vertex buffers to the webGL context
	external void bindBuffers(Object vertexBuffers, GL.Buffer indexBuffer, Effect effect);

	/// Bind webGl buffers directly to the webGL context
	external void bindBuffersDirectly(GL.Buffer vertexBuffer, GL.Buffer indexBuffer, List<num> vertexDeclaration, num vertexStrideSize, Effect effect);

	/// Binds the frame buffer to the specified texture.
	external void bindFramebuffer(InternalTexture texture, [num faceIndex, num requiredWidth, num requiredHeight, bool forceFullscreenViewport, InternalTexture depthStencilTexture, num lodLevel]);

	/// Binds an effect to the webGL context
	external void bindSamplers(Effect effect);

	/// Bind a webGL transform feedback object to the webgl context
	external void bindTransformFeedback(GL.TransformFeedback value);

	/// Bind a webGL buffer for a transform feedback operation
	external void bindTransformFeedbackBuffer(GL.Buffer value);

	/// Bind a specific block at a given index in a specific shader program
	external void bindUniformBlock(GL.Program shaderProgram, String blockName, num index);

	/// Bind an uniform buffer to the current webGL context
	external void bindUniformBuffer(GL.Buffer buffer);

	/// Bind a buffer to the current webGL context at a given location
	external void bindUniformBufferBase(GL.Buffer buffer, num location);

	/// Bind a specific vertex array object
	external void bindVertexArrayObject(GL.VertexArrayObject vertexArrayObject, GL.Buffer indexBuffer);

	/// Clear the current render buffer or the current render target (if any is set up)
	external void clear(Color4 color, bool backBuffer, bool depth, [bool stencil]);

	/// Clears the list of texture accessible through engine.
	/// This can help preventing texture load conflict due to name collision.
	external void clearInternalTexturesCache();

	/// Creates a cube texture
	external InternalTexture createCubeTexture(String rootUrl, Scene scene, List<String> files, [bool noMipmap, dynamic onLoad, dynamic onError, num format, dynamic forcedExtension, bool createPolynomials, num lodScale, num lodOffset, InternalTexture fallback, List<IInternalTextureLoader> excludeLoaders]);

	/// Creates a depth stencil texture.
	/// This is only available in WebGL 2 or with the depth texture extension available.
	external InternalTexture createDepthStencilTexture(dynamic size, DepthTextureCreationOptions options); // TODO: Type union: [number | object]

	/// Creates a dynamic texture
	external InternalTexture createDynamicTexture(num width, num height, bool generateMipMaps, num samplingMode);

	/// Create a dynamic uniform buffer
	external GL.Buffer createDynamicUniformBuffer(List<double> elements);

	/// Creates a dynamic vertex buffer
	external GL.Buffer createDynamicVertexBuffer(DataArray data);

	/// Create a new effect (used to store vertex/fragment shaders)
	external Effect createEffect(dynamic baseName, dynamic attributesNamesOrOptions, dynamic uniformsNamesOrEngine, [List<String> samplers, String defines, EffectFallbacks fallbacks, dynamic onCompiled, dynamic onError, dynamic indexParameters]); // TODO: Type union: [string[] | EffectCreationOptions], Type union: [string[] | Engine]

	/// Create an effect to use with particle systems.
	/// Please note that some parameters like animation sheets or not being billboard are not supported in this configuration
	external Effect createEffectForParticles(String fragmentName, List<String> uniformsNames, List<String> samplers, String defines, [EffectFallbacks fallbacks, dynamic onCompiled, dynamic onError]);

	/// Creates a new index buffer
	external GL.Buffer createIndexBuffer(IndicesArray indices, [bool updatable]);

	/// Creates a webGL buffer to use with instanciation
	external GL.Buffer createInstancesBuffer(num capacity);

	/// Create a multi render target texture
	external List<InternalTexture> createMultipleRenderTarget(dynamic size, IMultiRenderTargetOptions options);

	/// Create a cube texture from prefiltered data (ie. the mipmaps contain ready to use data for PBR reflection)
	external InternalTexture createPrefilteredCubeTexture(String rootUrl, Scene scene, num lodScale, num lodOffset, [dynamic onLoad, dynamic onError, num format, dynamic forcedExtension, bool createPolynomials]);

	/// Create a new webGL query (you must be sure that queries are supported by checking getCaps() function)
	external GL.Query createQuery();

	/// Creates a new raw cube texture
	external InternalTexture createRawCubeTexture(List<TypedData> data, num size, num format, num type, bool generateMipMaps, bool invertY, num samplingMode, [String compression]);

	/// Creates a new raw cube texture from a specified url
	external InternalTexture createRawCubeTextureFromUrl(String url, Scene scene, num size, num format, num type, bool noMipmap, dynamic callback, dynamic mipmapGenerator, [dynamic onLoad, dynamic onError, num samplingMode, bool invertY]);

	/// Directly creates a webGL program
	external GL.Program createRawShaderProgram(String vertexCode, String fragmentCode, [GL.RenderingContext context, List<String> transformFeedbackVaryings]);

	/// Creates a raw texture
	external InternalTexture createRawTexture(TypedData data, num width, num height, num format, bool generateMipMaps, bool invertY, num samplingMode, [String compression, num type]);

	/// Creates a new raw 3D texture
	external InternalTexture createRawTexture3D(TypedData data, num width, num height, num depth, num format, bool generateMipMaps, bool invertY, num samplingMode, [String compression, num textureType]);

	/// Creates a new render target cube texture
	external InternalTexture createRenderTargetCubeTexture(num size, [RenderTargetCreationOptions options]);

	/// Creates a new render target texture
	external InternalTexture createRenderTargetTexture(dynamic size, dynamic options); // TODO: Type union: [number | object], Type union: [boolean | RenderTargetCreationOptions]

	/// Creates a webGL program
	external GL.Program createShaderProgram(String vertexCode, String fragmentCode, String defines, [GL.RenderingContext context, List<String> transformFeedbackVaryings]);

	/// Usually called from BABYLON.Texture.ts.
	/// Passed information to create a WebGLTexture
	external InternalTexture createTexture(String urlArg, bool noMipmap, bool invertY, Scene scene, [num samplingMode, dynamic onLoad, dynamic onError, dynamic buffer, InternalTexture fallback, num format, String forcedExtension, List<IInternalTextureLoader> excludeLoaders]); // TODO: Type union: [Nullable<string | ArrayBuffer | HTMLImageElement | Blob>]

	/// Creates a webGL transform feedback object
	/// Please makes sure to check webGLVersion property to check if you are running webGL 2+
	external GL.TransformFeedback createTransformFeedback();

	/// Create an uniform buffer
	external GL.Buffer createUniformBuffer(List<double> elements);

	/// Creates a vertex buffer
	external GL.Buffer createVertexBuffer(DataArray data);

	/// Delete a webGL buffer used with instanciation
	external void deleteInstancesBuffer(GL.Buffer buffer);

	/// Delete and release a webGL query
	external Engine deleteQuery(GL.Query query);

	/// Delete a webGL transform feedback object
	external void deleteTransformFeedback(GL.TransformFeedback value);

	/// Call this function to leave webVR mode
	/// Will do nothing if webVR is not supported or if there is no webVR device
	external void disableVR();

	/// Display the loading screen
	external void displayLoadingUI();

	/// Dispose and release all associated resources
	external void dispose();

	/// Send a draw order
	external void draw(bool useTriangles, num indexStart, num indexCount, [num instancesCount]);

	/// Draw a list of unindexed primitives
	external void drawArraysType(num fillMode, num verticesStart, num verticesCount, [num instancesCount]);

	/// Draw a list of indexed primitives
	external void drawElementsType(num fillMode, num indexStart, num indexCount, [num instancesCount]);

	/// Draw a list of points
	external void drawPointClouds(num verticesStart, num verticesCount, [num instancesCount]);

	/// Draw a list of unindexed primitives
	external void drawUnIndexed(bool useTriangles, num verticesStart, num verticesCount, [num instancesCount]);

	/// Activates an effect, mkaing it the current one (ie. the one used for rendering)
	external void enableEffect(Effect effect);

	/// Call this function to switch to webVR mode
	/// Will do nothing if webVR is not supported or if there is no webVR device
	external void enableVR();

	/// Enf the current frame
	external void endFrame();

	/// Ends an occlusion query
	external Engine endOcclusionQuery(num algorithmType);

	/// Ends a time query
	external int endTimeQuery(_TimeToken token);

	/// Ends a transform feedback operation
	external void endTransformFeedback();

	/// Force a webGL flush (ie. a flush of all waiting webGL commands)
	external void flushFramebuffer();

	/// Force the mipmap generation for the given render target texture
	external void generateMipMapsForCubemap(InternalTexture texture);

	/// Gets the current alpha mode
	external num getAlphaMode();

	/// Gets current aspect ratio
	external num getAspectRatio(Camera camera, [bool useScreen]);

	/// Gets the lsit of active attributes for a given webGL program
	external List<num> getAttributes(GL.Program shaderProgram, List<String> attributesNames);

	/// Gets the object containing all engine capabilities
	external EngineCapabilities getCaps();

	/// Gets a boolean indicating if color writing is enabled
	external bool getColorWrite();

	/// Gets the time spent between current and previous frame
	external num getDeltaTime();

	/// Gets the current depth function
	external num getDepthFunction();

	/// Gets a boolean indicating if depth writing is enabled
	external bool getDepthWrite();

	/// Get the current error code of the webGL context
	external num getError();

	/// Get an externaly attached data from its key
	external T getExternalData<T>(String key);

	/// Gets the current framerate
	external num getFps();

	/// Gets the source code of the fragment shader associated with a specific webGL program
	external String getFragmentShaderSource(GL.Program program);

	/// Gets an object containing information about the current webGL context
	external Object getGlInfo();

	/// Gets the current hardware scaling level.
	/// By default the hardware scaling level is computed from the window device ratio.
	/// if level = 1 then the engine will render at the exact resolution of the canvas. If level = 0.5 then the engine will render at twice the size of the canvas.
	external num getHardwareScalingLevel();

	/// Gets the list of loaded textures
	external List<InternalTexture> getLoadedTexturesCache();

	/// Gets the max steps when engine is running in deterministic lock step
	external num getLockstepMaxSteps();

	/// Get an externaly attached data from its key, create it using a factory if it's not already present
	external T getOrAddExternalDataWithFactory<T>(String key, dynamic factory);

	/// Gets the value of a given query
	external num getQueryResult(GL.Query query);

	/// Gets the current render height
	external num getRenderHeight([bool useScreen]);

	/// Gets the current render width
	external num getRenderWidth([bool useScreen]);

	/// Gets the HTML canvas attached with the current webGL context
	external CanvasElement getRenderingCanvas();

	/// Gets the client rect of the HTML canvas attached with the current webGL context
	external ClientRect getRenderingCanvasClientRect();

	/// Gets current screen aspect ratio
	external num getScreenAspectRatio();

	/// Gets a boolean indicating if stencil buffer is enabled
	external bool getStencilBuffer();

	/// Gets the current stencil function
	external num getStencilFunction();

	/// Gets the current stencil mask
	external num getStencilFunctionMask();

	/// Gets the current stencil reference value
	external num getStencilFunctionReference();

	/// Gets the current stencil mask
	external num getStencilMask();

	/// Gets the current stencil operation when depth fails
	external num getStencilOperationDepthFail();

	/// Gets the current stencil operation when stencil fails
	external num getStencilOperationFail();

	/// Gets the current stencil operation when stencil passes
	external num getStencilOperationPass();

	/// Gets the list of webGL uniform locations associated with a specific program based on a list of uniform names
	external List<GL.UniformLocation> getUniforms(GL.Program shaderProgram, List<String> uniformsNames);

	/// Gets the current webVR device
	external dynamic getVRDevice();

	/// Gets the source code of the vertex shader associated with a specific webGL program
	external String getVertexShaderSource(GL.Program program);

	/// Gets the current value of the zOffset
	external num getZOffset();

	/// Hide the loading screen
	external void hideLoadingUI();

	/// Initializes a webVR display and starts listening to display change events
	/// The onVRDisplayChangedObservable will be notified upon these changes
	external Observable<IDisplayChangedEventArgs> initWebVR();

	/// Initializes a webVR display and starts listening to display change events
	/// The onVRDisplayChangedObservable will be notified upon these changes
	external Promise<IDisplayChangedEventArgs> initWebVRAsync();

	/// Gets a boolean indicating that the engine is running in deterministic lock step mode
	external bool isDeterministicLockStep();

	/// Check if a given query has resolved and got its value
	external bool isQueryResultAvailable(GL.Query query);

	/// Gets a boolean indicating if a webVR device was detected
	external bool isVRDevicePresent();

	/// Reads pixels from the current frame buffer. Please note that this function can be slow
	external Uint8List readPixels(num x, num y, num width, num height);

	/// Records a vertex array object
	external GL.VertexArrayObject recordVertexArrayObject(Object vertexBuffers, GL.Buffer indexBuffer, Effect effect);

	/// Force the engine to release all cached effects. This means that next effect compilation will have to be done completely even if a similar effect was already compiled
	external void releaseEffects();

	/// Release and free the memory of a vertex array object
	external void releaseVertexArrayObject(GL.VertexArrayObject vao);

	/// Remove an externaly attached data from the Engine instance
	external bool removeExternalData(String key);

	/// Reset the texture cache to empty state
	external void resetTextureCache();

	/// Resize the view according to the canvas' size
	external void resize();

	/// Unbind the current render target and bind the default framebuffer
	external void restoreDefaultFramebuffer();

	/// Register and execute a render loop. The engine can have more than one render function
	external void runRenderLoop(dynamic renderFunction);

	/// Executes a scissor clear (ie. a clear on a specific portion of the screen)
	external void scissorClear(num x, num y, num width, num height, Color4 clearColor);

	/// Sets alpha constants used by some alpha blending modes
	external void setAlphaConstants(num r, num g, num b, num a);

	/// Sets the current alpha mode
	external void setAlphaMode(num mode, [bool noDepthWriteChange]);

	/// Set the value of an uniform to an array of number
	external void setArray(GL.UniformLocation uniform, List<num> array);

	/// Set the value of an uniform to an array of number (stored as vec2)
	external void setArray2(GL.UniformLocation uniform, List<num> array);

	/// Set the value of an uniform to an array of number (stored as vec3)
	external void setArray3(GL.UniformLocation uniform, List<num> array);

	/// Set the value of an uniform to an array of number (stored as vec4)
	external void setArray4(GL.UniformLocation uniform, List<num> array);

	/// Set the value of an uniform to a boolean
	external void setBool(GL.UniformLocation uniform, num bool);

	/// Set the value of an uniform to a Color3
	external void setColor3(GL.UniformLocation uniform, Color3 color3);

	/// Set the value of an uniform to a Color3 and an alpha value
	external void setColor4(GL.UniformLocation uniform, Color3 color3, num alpha);

	/// Enable or disable color writing
	external void setColorWrite(bool enable);

	/// Enable or disable depth buffering
	external void setDepthBuffer(bool enable);

	/// Sets the current depth function
	external void setDepthFunction(num depthFunc);

	/// Sets the current depth function to GREATER
	external void setDepthFunctionToGreater();

	/// Sets the current depth function to GEQUAL
	external void setDepthFunctionToGreaterOrEqual();

	/// Sets the current depth function to LESS
	external void setDepthFunctionToLess();

	/// Sets the current depth function to LEQUAL
	external void setDepthFunctionToLessOrEqual();

	/// Sets a depth stencil texture from a render target to the according uniform.
	external void setDepthStencilTexture(num channel, GL.UniformLocation uniform, RenderTargetTexture texture);

	/// Enable or disable depth writing
	external void setDepthWrite(bool enable);

	/// Sets a Color4 on a uniform variable
	external void setDirectColor4(GL.UniformLocation uniform, Color4 color4);

	/// Directly set the WebGL Viewport
	external Viewport setDirectViewport(num x, num y, num width, num height);

	/// Sets a boolean indicating if the dithering state is enabled or disabled
	external void setDitheringState(bool value);

	/// Set the value of an uniform to a number (float)
	external void setFloat(GL.UniformLocation uniform, num value);

	/// Set the value of an uniform to a vec2
	external void setFloat2(GL.UniformLocation uniform, num x, num y);

	/// Set the value of an uniform to a vec3
	external void setFloat3(GL.UniformLocation uniform, num x, num y, num z);

	/// Set the value of an uniform to a vec4
	external void setFloat4(GL.UniformLocation uniform, num x, num y, num z, num w);

	/// Set the value of an uniform to an array of float32
	external void setFloatArray(GL.UniformLocation uniform, Float32List array);

	/// Set the value of an uniform to an array of float32 (stored as vec2)
	external void setFloatArray2(GL.UniformLocation uniform, Float32List array);

	/// Set the value of an uniform to an array of float32 (stored as vec3)
	external void setFloatArray3(GL.UniformLocation uniform, Float32List array);

	/// Set the value of an uniform to an array of float32 (stored as vec4)
	external void setFloatArray4(GL.UniformLocation uniform, Float32List array);

	/// Sets the frame buffer Depth / Stencil attachement of the render target to the defined depth stencil texture.
	external void setFrameBufferDepthStencilTexture(RenderTargetTexture renderTarget);

	/// Defines the hardware scaling level.
	/// By default the hardware scaling level is computed from the window device ratio.
	/// if level = 1 then the engine will render at the exact resolution of the canvas. If level = 0.5 then the engine will render at twice the size of the canvas.
	external void setHardwareScalingLevel(num level);

	/// Set the value of an uniform to a number (int)
	external void setInt(GL.UniformLocation uniform, num value);

	/// Set the value of an uniform to an array of int32
	external void setIntArray(GL.UniformLocation uniform, Int32List array);

	/// Set the value of an uniform to an array of int32 (stored as vec2)
	external void setIntArray2(GL.UniformLocation uniform, Int32List array);

	/// Set the value of an uniform to an array of int32 (stored as vec3)
	external void setIntArray3(GL.UniformLocation uniform, Int32List array);

	/// Set the value of an uniform to an array of int32 (stored as vec4)
	external void setIntArray4(GL.UniformLocation uniform, Int32List array);

	/// Set the value of an uniform to an array of float32 (stored as matrices)
	external void setMatrices(GL.UniformLocation uniform, Float32List matrices);

	/// Set the value of an uniform to a matrix
	external void setMatrix(GL.UniformLocation uniform, Matrix matrix);

	/// Set the value of an uniform to a matrix (2x2)
	external void setMatrix2x2(GL.UniformLocation uniform, Float32List matrix);

	/// Set the value of an uniform to a matrix (3x3)
	external void setMatrix3x3(GL.UniformLocation uniform, Float32List matrix);

	/// Sets a boolean indicating if the rasterizer state is enabled or disabled
	external void setRasterizerState(bool value);

	/// Force a specific size of the canvas
	external void setSize(num width, num height);

	/// Set various states to the webGL context
	external void setState(bool culling, [num zOffset, bool force, bool reverseSide]);

	/// Enable or disable the stencil buffer
	external void setStencilBuffer(bool enable);

	/// Sets the current stencil function
	external void setStencilFunction(num stencilFunc);

	/// Sets the current stencil mask
	external void setStencilFunctionMask(num mask);

	/// Sets the current stencil reference
	external void setStencilFunctionReference(num reference);

	/// Sets the current stencil mask
	external void setStencilMask(num mask);

	/// Sets the stencil operation to use when depth fails
	external void setStencilOperationDepthFail(num operation);

	/// Sets the stencil operation to use when stencil fails
	external void setStencilOperationFail(num operation);

	/// Sets the stencil operation to use when stencil passes
	external void setStencilOperationPass(num operation);

	/// Sets a texture to the according uniform.
	external void setTexture(num channel, GL.UniformLocation uniform, BaseTexture texture);

	/// Sets an array of texture to the webGL context
	external void setTextureArray(num channel, GL.UniformLocation uniform, List<BaseTexture> textures);

	/// Set the compressed texture format to use, based on the formats you have, and the formats
	/// supported by the hardware / browser.
	external String setTextureFormatToUse(List<String> formatsAvailable);

	/// Sets a texture to the webGL context from a postprocess
	external void setTextureFromPostProcess(num channel, PostProcess postProcess);

	/// Binds the output of the passed in post process to the texture channel specified
	external void setTextureFromPostProcessOutput(num channel, PostProcess postProcess);

	/// Specify the varyings to use with transform feedback
	external void setTranformFeedbackVaryings(GL.Program program, List<String> value);

	/// Set the WebGL's viewport
	external void setViewport(Viewport viewport, [num requiredWidth, num requiredHeight]);

	/// Set the z offset to apply to current rendering
	external void setZOffset(num value);

	/// Starts a time query (used to measure time spent by the GPU on a specific frame)
	/// Please note that only one query can be issued at a time
	external _TimeToken startTimeQuery();

	/// stop executing a render loop function and remove it from the execution array
	external void stopRenderLoop([dynamic renderFunction]);

	/// Toggle full screen mode
	external void switchFullscreen(bool requestPointerLock);

	/// Unbind the current render target texture from the webGL context
	external void unBindFramebuffer(InternalTexture texture, [bool disableGenerateMipMaps, dynamic onBeforeUnbind]);

	/// Unbind a list of render target textures from the webGL context
	/// This is used only when drawBuffer extension or webGL2 are active
	external void unBindMultiColorAttachmentFramebuffer(List<InternalTexture> textures, [bool disableGenerateMipMaps, dynamic onBeforeUnbind]);

	/// Unbind all vertex attributes from the webGL context
	external void unbindAllAttributes();

	/// Unbind all textures from the webGL context
	external void unbindAllTextures();

	/// Unbind all instance attributes
	external void unbindInstanceAttributes();

	/// Update the content of a webGL buffer used with instanciation and bind it to the webGL context
	external void updateAndBindInstancesBuffer(GL.Buffer instancesBuffer, Float32List data, dynamic offsetLocations); // TODO: Type union: [number[] | InstancingAttributeInfo[]]

	/// update the bound buffer with the given data
	external void updateArrayBuffer(Float32List data);

	/// Update a dynamic index buffer
	external void updateDynamicIndexBuffer(GL.Buffer indexBuffer, IndicesArray indices, [num offset]);

	/// Update the content of a dynamic texture
	external void updateDynamicTexture(InternalTexture texture, CanvasElement canvas, bool invertY, [bool premulAlpha, num format, bool forceBindTexture]);

	/// Updates a dynamic vertex buffer.
	external void updateDynamicVertexBuffer(GL.Buffer vertexBuffer, DataArray data, [num byteOffset, num byteLength]);

	/// Update the sample count for a given multiple render target texture
	external num updateMultipleRenderTargetTextureSampleCount(List<InternalTexture> textures, num samples);

	/// Update a raw cube texture
	external void updateRawCubeTexture(InternalTexture texture, List<TypedData> data, num format, num type, bool invertY, [String compression, num level]);

	/// Update a raw texture
	external void updateRawTexture(InternalTexture texture, TypedData data, num format, bool invertY, [String compression, num type]);

	/// Update a raw 3D texture
	external void updateRawTexture3D(InternalTexture texture, TypedData data, num format, bool invertY, [String compression, num textureType]);

	/// Updates the sample count of a render target texture
	external num updateRenderTargetTextureSampleCount(InternalTexture texture, num samples);

	/// Updates a depth texture Comparison Mode and Function.
	/// If the comparison Function is equal to 0, the mode will be set to none.
	/// Otherwise, this only works in webgl 2 and requires a shadow sampler in the shader.
	external void updateTextureComparisonFunction(InternalTexture texture, num comparisonFunction);

	/// Update the sampling mode of a given texture
	external void updateTextureSamplingMode(num samplingMode, InternalTexture texture);

	/// Update an existing uniform buffer
	external void updateUniformBuffer(GL.Buffer uniformBuffer, List<double> elements, [num offset, num count]);

	/// Update a video texture
	external void updateVideoTexture(InternalTexture texture, VideoElement video, bool invertY);

	/// Force the entire cache to be cleared
	/// You should not have to use this function unless your engine needs to share the webGL context with another engine
	external void wipeCaches([bool bruteForce]);

	// ### Static Fields ##############################

	/// Defines that alpha blending to SRC ALPHA * SRC + DEST
	external static num get ALPHA_ADD;

	/// Defines that alpha blending to SRC ALPHA * SRC + (1 - SRC ALPHA) * DEST
	external static num get ALPHA_COMBINE;

	/// Defines that alpha blending is disabled
	external static num get ALPHA_DISABLE;

	/// Defines that alpha blending to CST * SRC + (1 - CST) * DEST
	external static num get ALPHA_INTERPOLATE;

	/// Defines that alpha blending to SRC ALPHA * SRC + (1 - SRC) * DEST
	external static num get ALPHA_MAXIMIZED;

	/// Defines that alpha blending to SRC * DEST
	external static num get ALPHA_MULTIPLY;

	/// Defines that alpha blending to SRC + DEST
	external static num get ALPHA_ONEONE;

	/// Defines that alpha blending to SRC + (1 - SRC ALPHA) * DEST
	external static num get ALPHA_PREMULTIPLIED;

	/// Defines that alpha blending to SRC + (1 - SRC ALPHA) * DEST
	/// Alpha will be set to (1 - SRC ALPHA) * DEST ALPHA
	external static num get ALPHA_PREMULTIPLIED_PORTERDUFF;

	/// Defines that alpha blending to SRC + (1 - SRC) * DEST
	/// Alpha will be set to SRC ALPHA + (1 - SRC ALPHA) * DEST ALPHA
	external static num get ALPHA_SCREENMODE;

	/// Defines that alpha blending to DEST - SRC * DEST
	external static num get ALPHA_SUBTRACT;

	/// Passed to depthFunction or stencilFunction to specify depth or stencil tests will always pass. i.e. Pixels will be drawn in the order they are drawn
	external static num get ALWAYS;

	/// Default AudioEngine factory responsible of creating the Audio Engine.
	/// By default, this will create a BabylonJS Audio Engine if the workload has been embedded.
	external static dynamic get AudioEngineFactory;

	/// Gets or sets the relative url used to load code if using the engine in non-minified mode
	external static String get CodeRepository;

	/// Gets or sets the epsilon value used by collision engine
	external static num get CollisionsEpsilon;

	/// Passed to stencilOperation to specify that stencil value must be decremented
	external static num get DECR;

	/// Passed to stencilOperation to specify that stencil value must be decremented with wrapping
	external static num get DECR_WRAP;

	/// Defines that the ressource was successfully delay loaded
	external static num get DELAYLOADSTATE_LOADED;

	/// Defines that the ressource is currently delay loading
	external static num get DELAYLOADSTATE_LOADING;

	/// Defines that the ressource is not delayed
	external static num get DELAYLOADSTATE_NONE;

	/// Defines that the ressource is delayed and has not started loading
	external static num get DELAYLOADSTATE_NOTLOADED;

	/// Passed to depthFunction or stencilFunction to specify depth or stencil tests will pass if the new depth value is equals to the stored value
	external static num get EQUAL;

	/// Use this array to turn off some WebGL2 features on known buggy browsers version
	external static dynamic get ExceptionList; // TODO: Type union: [(object | object)[]]

	/// Passed to depthFunction or stencilFunction to specify depth or stencil tests will pass if the new depth value is greater than or equal to the stored value
	external static num get GEQUAL;

	/// Passed to depthFunction or stencilFunction to specify depth or stencil tests will pass if the new depth value is greater than the stored value
	external static num get GREATER;

	/// Passed to stencilOperation to specify that stencil value must be incremented
	external static num get INCR;

	/// Passed to stencilOperation to specify that stencil value must be incremented with wrapping
	external static num get INCR_WRAP;

	/// Passed to stencilOperation to specify that stencil value must be inverted
	external static num get INVERT;

	/// Gets the list of created engines
	external static List<Engine> get Instances;

	/// Passed to stencilOperation to specify that stencil value must be kept
	external static num get KEEP;

	/// Passed to depthFunction or stencilFunction to specify depth or stencil tests will pass if the new depth value is less than or equal to the stored value
	external static num get LEQUAL;

	/// Passed to depthFunction or stencilFunction to specify depth or stencil tests will pass if the new depth value is less than the stored value
	external static num get LESS;

	/// Gets the latest created engine
	external static Engine get LastCreatedEngine;

	/// Gets the latest created scene
	external static Scene get LastCreatedScene;

	/// Passed to depthFunction or stencilFunction to specify depth or stencil tests will never pass. i.e. Nothing will be drawn
	external static num get NEVER;

	/// Passed to depthFunction or stencilFunction to specify depth or stencil tests will pass if the new depth value is not equal to the stored value
	external static num get NOTEQUAL;

	/// Default offline support factory responsible of creating a tool used to store data locally.
	/// By default, this will create a Database object if the workload has been embedded.
	external static dynamic get OfflineProviderFactory;

	/// Passed to stencilOperation to specify that stencil value must be replaced
	external static num get REPLACE;

	/// Defines that texture rescaling will use a ceil to find the closer power of 2 size
	external static num get SCALEMODE_CEILING;

	/// Defines that texture rescaling will use a floor to find the closer power of 2 size
	external static num get SCALEMODE_FLOOR;

	/// Defines that texture rescaling will look for the nearest power of 2 size
	external static num get SCALEMODE_NEAREST;

	/// Gets or sets the relative url used to load shaders if using the engine in non-minified mode
	external static String get ShadersRepository;

	/// ALPHA
	external static num get TEXTUREFORMAT_ALPHA;

	/// LUMINANCE
	external static num get TEXTUREFORMAT_LUMINANCE;

	/// LUMINANCE_ALPHA
	external static num get TEXTUREFORMAT_LUMINANCE_ALPHA;

	/// RED (2nd reference)
	external static num get TEXTUREFORMAT_R;

	/// RED
	external static num get TEXTUREFORMAT_RED;

	/// RED_INTEGER
	external static num get TEXTUREFORMAT_RED_INTEGER;

	/// RG
	external static num get TEXTUREFORMAT_RG;

	/// RGB
	external static num get TEXTUREFORMAT_RGB;

	/// RGBA
	external static num get TEXTUREFORMAT_RGBA;

	/// RGBA_INTEGER
	external static num get TEXTUREFORMAT_RGBA_INTEGER;

	/// RGB_INTEGER
	external static num get TEXTUREFORMAT_RGB_INTEGER;

	/// RG_INTEGER
	external static num get TEXTUREFORMAT_RG_INTEGER;

	/// RED_INTEGER (2nd reference)
	external static num get TEXTUREFORMAT_R_INTEGER;

	/// BYTE
	external static num get TEXTURETYPE_BYTE;

	/// FLOAT
	external static num get TEXTURETYPE_FLOAT;

	/// FLOAT_32_UNSIGNED_INT_24_8_REV
	external static num get TEXTURETYPE_FLOAT_32_UNSIGNED_INT_24_8_REV;

	/// HALF_FLOAT
	external static num get TEXTURETYPE_HALF_FLOAT;

	/// INT
	external static num get TEXTURETYPE_INT;

	/// SHORT
	external static num get TEXTURETYPE_SHORT;

	/// UNSIGNED_BYTE
	external static num get TEXTURETYPE_UNSIGNED_BYTE;

	/// UNSIGNED_BYTE (2nd reference)
	external static num get TEXTURETYPE_UNSIGNED_INT;

	/// UNSIGNED_INT
	external static num get TEXTURETYPE_UNSIGNED_INTEGER;

	/// UNSIGNED_INT_10F_11F_11F_REV
	external static num get TEXTURETYPE_UNSIGNED_INT_10F_11F_11F_REV;

	/// UNSIGNED_INT_24_8
	external static num get TEXTURETYPE_UNSIGNED_INT_24_8;

	/// UNSIGNED_INT_2_10_10_10_REV
	external static num get TEXTURETYPE_UNSIGNED_INT_2_10_10_10_REV;

	/// UNSIGNED_INT_5_9_9_9_REV
	external static num get TEXTURETYPE_UNSIGNED_INT_5_9_9_9_REV;

	/// UNSIGNED_SHORT
	external static num get TEXTURETYPE_UNSIGNED_SHORT;

	/// UNSIGNED_SHORT_4_4_4_4
	external static num get TEXTURETYPE_UNSIGNED_SHORT_4_4_4_4;

	/// UNSIGNED_SHORT_5_5_5_1
	external static num get TEXTURETYPE_UNSIGNED_SHORT_5_5_5_1;

	/// UNSIGNED_SHORT_5_6_5
	external static num get TEXTURETYPE_UNSIGNED_SHORT_5_6_5;

	/// Bilinear is mag = linear and min = linear and mip = nearest
	external static num get TEXTURE_BILINEAR_SAMPLINGMODE;

	/// Texture is not repeating outside of 0..1 UVs
	external static num get TEXTURE_CLAMP_ADDRESSMODE;

	/// Cubic coordinates mode
	external static num get TEXTURE_CUBIC_MODE;

	/// Equirectangular coordinates mode
	external static num get TEXTURE_EQUIRECTANGULAR_MODE;

	/// Explicit coordinates mode
	external static num get TEXTURE_EXPLICIT_MODE;

	/// Equirectangular Fixed Mirrored coordinates mode
	external static num get TEXTURE_FIXED_EQUIRECTANGULAR_MIRRORED_MODE;

	/// Equirectangular Fixed coordinates mode
	external static num get TEXTURE_FIXED_EQUIRECTANGULAR_MODE;

	/// Inverse Cubic coordinates mode
	external static num get TEXTURE_INVCUBIC_MODE;

	/// mag = linear and min = linear and mip = none
	external static num get TEXTURE_LINEAR_LINEAR;

	/// Trilinear is mag = linear and min = linear and mip = linear
	external static num get TEXTURE_LINEAR_LINEAR_MIPLINEAR;

	/// Bilinear is mag = linear and min = linear and mip = nearest
	external static num get TEXTURE_LINEAR_LINEAR_MIPNEAREST;

	/// mag = linear and min = nearest and mip = none
	external static num get TEXTURE_LINEAR_NEAREST;

	/// mag = linear and min = nearest and mip = linear
	external static num get TEXTURE_LINEAR_NEAREST_MIPLINEAR;

	/// mag = linear and min = nearest and mip = nearest
	external static num get TEXTURE_LINEAR_NEAREST_MIPNEAREST;

	/// Texture is repeating and mirrored
	external static num get TEXTURE_MIRROR_ADDRESSMODE;

	/// mag = nearest and min = linear and mip = none
	external static num get TEXTURE_NEAREST_LINEAR;

	/// mag = nearest and min = linear and mip = linear
	external static num get TEXTURE_NEAREST_LINEAR_MIPLINEAR;

	/// mag = nearest and min = linear and mip = nearest
	external static num get TEXTURE_NEAREST_LINEAR_MIPNEAREST;

	/// mag = nearest and min = nearest and mip = none
	external static num get TEXTURE_NEAREST_NEAREST;

	/// nearest is mag = nearest and min = nearest and mip = linear
	external static num get TEXTURE_NEAREST_NEAREST_MIPLINEAR;

	/// mag = nearest and min = nearest and mip = nearest
	external static num get TEXTURE_NEAREST_NEAREST_MIPNEAREST;

	/// nearest is mag = nearest and min = nearest and mip = linear
	external static num get TEXTURE_NEAREST_SAMPLINGMODE;

	/// Planar coordinates mode
	external static num get TEXTURE_PLANAR_MODE;

	/// Projection coordinates mode
	external static num get TEXTURE_PROJECTION_MODE;

	/// Skybox coordinates mode
	external static num get TEXTURE_SKYBOX_MODE;

	/// Spherical coordinates mode
	external static num get TEXTURE_SPHERICAL_MODE;

	/// Trilinear is mag = linear and min = linear and mip = linear
	external static num get TEXTURE_TRILINEAR_SAMPLINGMODE;

	/// Texture is repeating outside of 0..1 UVs
	external static num get TEXTURE_WRAP_ADDRESSMODE;

	/// Returns the current version of the framework
	external static String get Version;

	/// Gets the audio engine
	external static IAudioEngine get audioEngine;

	// ### Static Methods ##############################

	/// Will flag all materials in all scenes in all engines as dirty to trigger new shader compilation
	external static void MarkAllMaterialsAsDirty(num flag, [dynamic predicate]);

	/// Gets a boolean indicating if the engine can be instanciated (ie. if a webGL context can be found)
	external static bool isSupported();
}


