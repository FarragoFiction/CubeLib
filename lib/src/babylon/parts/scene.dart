part of Babylon;

// ### AbstractScene ##############################


/// Base class of the scene acting as a container for the different elements composing a scene.
/// This class is dynamically extended by the different components of the scene increasing
/// flexibility and reducing coupling
@JS()
class AbstractScene {
	// ### Member Fields ##############################

	/// ActionManagers available on the scene.
	external List<ActionManager> get actionManagers;
	external void set actionManagers(List<ActionManager> val);

	/// All of the animation groups added to this scene
	external List<AnimationGroup> get animationGroups;
	external void set animationGroups(List<AnimationGroup> val);

	/// Gets a list of Animations associated with the scene
	external List<Animation> get animations;

	/// All of the cameras added to this scene
	external List<Camera> get cameras;
	external void set cameras(List<Camera> val);

	/// The list of effect layers (highlights/glow) added to the scene
	external List<EffectLayer> get effectLayers;
	external void set effectLayers(List<EffectLayer> val);

	/// The list of geometries used in the scene.
	external List<Geometry> get geometries;
	external void set geometries(List<Geometry> val);

	/// The list of layers (background and foreground) of the scene
	external List<Layer> get layers;
	external void set layers(List<Layer> val);

	/// The list of lens flare system added to the scene
	external List<LensFlareSystem> get lensFlareSystems;
	external void set lensFlareSystems(List<LensFlareSystem> val);

	/// All of the lights added to this scene
	external List<Light> get lights;
	external void set lights(List<Light> val);

	/// All of the materials added to this scene
	/// In the context of a Scene, it is not supposed to be modified manually.
	/// Any addition or removal should be done using the addMaterial and removeMAterial Scene methods.
	/// Note also that the order of the Material wihin the array is not significant and might change.
	external List<Material> get materials;
	external void set materials(List<Material> val);

	/// All of the (abstract) meshes added to this scene
	external List<AbstractMesh> get meshes;
	external void set meshes(List<AbstractMesh> val);

	/// The list of morph target managers added to the scene
	external List<MorphTargetManager> get morphTargetManagers;
	external void set morphTargetManagers(List<MorphTargetManager> val);

	/// All of the multi-materials added to this scene
	external List<MultiMaterial> get multiMaterials;
	external void set multiMaterials(List<MultiMaterial> val);

	/// All of the particle systems added to this scene
	external List<IParticleSystem> get particleSystems;
	external void set particleSystems(List<IParticleSystem> val);

	/// The list of procedural textures added to the scene
	external List<ProceduralTexture> get proceduralTextures;
	external void set proceduralTextures(List<ProceduralTexture> val);

	/// The list of reflection probes added to the scene
	external List<ReflectionProbe> get reflectionProbes;
	external void set reflectionProbes(List<ReflectionProbe> val);

	/// Gets the list of root nodes (ie. nodes with no parent)
	external List<Node> get rootNodes;

	/// The list of skeletons added to the scene
	external List<Skeleton> get skeletons;
	external void set skeletons(List<Skeleton> val);

	/// The list of sounds used in the scene.
	external List<Sound> get sounds;
	external void set sounds(List<Sound> val);

	/// Textures to keep.
	external List<BaseTexture> get textures;
	external void set textures(List<BaseTexture> val);

	/// All of the tranform nodes added to this scene
	/// In the context of a Scene, it is not supposed to be modified manually.
	/// Any addition or removal should be done using the addTransformNode and removeTransformNode Scene methods.
	/// Note also that the order of the TransformNode wihin the array is not significant and might change.
	external List<TransformNode> get transformNodes;
	external void set transformNodes(List<TransformNode> val);

	// ### Member Methods ##############################

	/// Adds the given effect layer to this scene
	external void addEffectLayer(EffectLayer newEffectLayer);

	/// Adds the given lens flare system to this scene
	external void addLensFlareSystem(LensFlareSystem newLensFlareSystem);

	/// Adds the given reflection probe to this scene.
	external void addReflectionProbe(ReflectionProbe newReflectionProbe);

	/// Return a the first highlight layer of the scene with a given name.
	external GlowLayer getGlowLayerByName(String name);

	/// Return a the first highlight layer of the scene with a given name.
	external HighlightLayer getHighlightLayerByName(String name);

	/// Gets a lens flare system using its id
	external LensFlareSystem getLensFlareSystemByID(String id);

	/// Gets a lens flare system using its name
	external LensFlareSystem getLensFlareSystemByName(String name);

	/// Removes the given effect layer from this scene.
	external num removeEffectLayer(EffectLayer toRemove);

	/// Removes the given lens flare system from this scene.
	external num removeLensFlareSystem(LensFlareSystem toRemove);

	/// Removes the given reflection probe from this scene.
	external num removeReflectionProbe(ReflectionProbe toRemove);

	// ### Static Methods ##############################

	/// Adds n individual parser in the list of available ones
	external static void AddIndividualParser(String name, IndividualBabylonFileParser parser);

	/// Adds a parser in the list of available ones
	external static void AddParser(String name, BabylonFileParser parser);

	/// Gets an individual parser from the list of avaialble ones
	external static IndividualBabylonFileParser GetIndividualParser(String name);

	/// Gets a general parser from the list of avaialble ones
	external static BabylonFileParser GetParser(String name);

	/// Parser json data and populate both a scene and its associated container object
	external static void Parse(dynamic jsonData, Scene scene, AssetContainer container, String rootUrl);
}

// ### Scene ##############################


/// Represents a scene to be rendered by the engine.
/// 
/// 
/// see
/// http://doc.babylonjs.com/features/scene
@JS()
class Scene extends AbstractScene {
	external Scene(Engine engine, [SceneOptions options]);

	// ### Member Fields ##############################

	/// Gets or sets the action manager associated with the scene
	external ActionManager get actionManager;
	external void set actionManager(ActionManager val);

	/// Gets the performance counter for active bones
	external PerfCounter get activeBonesPerfCounter;

	/// Gets or sets the current active camera
	external Camera get activeCamera;
	external void set activeCamera(Camera val);

	/// All of the active cameras added to this scene.
	external List<Camera> get activeCameras;
	external void set activeCameras(List<Camera> val);

	/// Gets the performance counter for active particles
	external PerfCounter get activeParticlesPerfCounter;

	/// Sets a function to be executed after rendering a camera
	external Function get afterCameraRender;
	external void set afterCameraRender(Function val);

	/// Sets a function to be executed after rendering this scene
	external Function get afterRender;
	external void set afterRender(Function val);

	/// Defines the color used to simulate the ambient color (Default is (0, 0, 0))
	external Color3 get ambientColor;
	external void set ambientColor(Color3 val);

	/// Gets all animatable attached to the scene
	external List<Animatable> get animatables;

	/// Gets or sets the animation properties override
	external AnimationPropertiesOverride get animationPropertiesOverride;
	external void set animationPropertiesOverride(AnimationPropertiesOverride val);

	/// Gets or sets a general scale for animation speed
	external num get animationTimeScale;
	external void set animationTimeScale(num val);

	/// Gets or sets a boolean indicating if animations are enabled
	external bool get animationsEnabled;
	external void set animationsEnabled(bool val);

	/// Gets or sets if audio support is enabled
	external bool get audioEnabled;
	external void set audioEnabled(bool val);

	/// Gets or sets a boolean that indicates if the scene must clear the render buffer before rendering a frame
	external bool get autoClear;
	external void set autoClear(bool val);

	/// Gets or sets a boolean that indicates if the scene must clear the depth and stencil buffers before rendering a frame
	external bool get autoClearDepthAndStencil;
	external void set autoClearDepthAndStencil(bool val);

	/// Sets a function to be executed before rendering a camera
	external Function get beforeCameraRender;
	external void set beforeCameraRender(Function val);

	/// Sets a function to be executed before rendering this scene
	external Function get beforeRender;
	external void set beforeRender(Function val);

	/// Gets or sets a boolean blocking all the calls to markAllMaterialsAsDirty (ie. the materials won't be updated if they are out of sync)
	external bool get blockMaterialDirtyMechanism;
	external void set blockMaterialDirtyMechanism(bool val);

	/// Gets or sets a boolean blocking all the calls to freeActiveMeshes and freeRenderingGroups
	/// It can be used in order to prevent going through methods freeRenderingGroups and freeActiveMeshes several times to improve performance
	/// when disposing several meshes in a row or a hierarchy of meshes.
	/// When used, it is the responsability of the user to blockfreeActiveMeshesAndRenderingGroups back to false.
	external bool get blockfreeActiveMeshesAndRenderingGroups;
	external void set blockfreeActiveMeshesAndRenderingGroups(bool val);

	/// Define this parameter if you are using multiple cameras and you want to specify which one should be used for pointer position
	external Camera get cameraToUseForPointers;
	external void set cameraToUseForPointers(Camera val);

	/// Defines the color used to clear the render buffer (Default is (0.2, 0.2, 0.3, 1.0))
	external Color4 get clearColor;
	external void set clearColor(Color4 val);

	/// Gets or sets the active clipplane 1
	external Plane get clipPlane;
	external void set clipPlane(Plane val);

	/// Gets or sets the active clipplane 2
	external Plane get clipPlane2;
	external void set clipPlane2(Plane val);

	/// Gets or sets the active clipplane 3
	external Plane get clipPlane3;
	external void set clipPlane3(Plane val);

	/// Gets or sets the active clipplane 4
	external Plane get clipPlane4;
	external void set clipPlane4(Plane val);

	/// Gets or sets a boolean indicating if collisions are enabled on this scene
	external bool get collisionsEnabled;
	external void set collisionsEnabled(bool val);

	/// Gets or sets a boolean indicating if the scene must keep the meshUnderPointer property updated
	/// Please note that it requires to run a ray cast through the scene on every frame
	external bool get constantlyUpdateMeshUnderPointer;
	external void set constantlyUpdateMeshUnderPointer(bool val);

	/// The list of user defined render targets added to the scene
	external List<RenderTargetTexture> get customRenderTargets;
	external void set customRenderTargets(List<RenderTargetTexture> val);

	/// Gets the debug layer (aka Inspector) associated with the scene
	external DebugLayer get debugLayer;

	/// Defines the HTML default cursor to use (empty by default)
	external String get defaultCursor;
	external void set defaultCursor(String val);

	/// The default material used on meshes when no material is affected
	external Material get defaultMaterial;
	external void set defaultMaterial(Material val);

	/// Use this array to add regular expressions used to disable offline support for specific urls
	external List<RegExp> get disableOfflineSupportExceptionRules;
	external void set disableOfflineSupportExceptionRules(List<RegExp> val);

	/// Gets or sets a boolean indicating that all submeshes of active meshes must be rendered
	/// Use this boolean to avoid computing frustum clipping on submeshes (This could help when you are CPU bound)
	external bool get dispatchAllSubMeshesOfActiveMeshes;
	external void set dispatchAllSubMeshesOfActiveMeshes(bool val);

	/// Gets or sets a boolean indicating if next render targets must be dumped as image for debugging purposes
	/// We recommend not using it and instead rely on Spector.js: http://spector.babylonjs.com
	external bool get dumpNextRenderTargets;
	external void set dumpNextRenderTargets(bool val);

	/// Texture used in all pbr material as the reflection texture.
	/// As in the majority of the scene they are the same (exception for multi room and so on),
	/// this is easier to set here than in all the materials.
	external BaseTexture get environmentTexture;
	external void set environmentTexture(BaseTexture val);

	/// Gets or sets the fog color to use
	external Color3 get fogColor;
	external void set fogColor(Color3 val);

	/// Gets or sets the fog density to use
	external num get fogDensity;
	external void set fogDensity(num val);

	/// Gets or sets a boolean indicating if fog is enabled on this scene
	external bool get fogEnabled;
	external void set fogEnabled(bool val);

	/// Gets or sets the fog end distance to use
	external num get fogEnd;
	external void set fogEnd(num val);

	/// Gets or sets the fog mode to use
	external num get fogMode;
	external void set fogMode(num val);

	/// Gets or sets the fog start distance to use
	external num get fogStart;
	external void set fogStart(num val);

	/// Gets or sets a boolean indicating if all rendering must be done in point cloud
	external bool get forcePointsCloud;
	external void set forcePointsCloud(bool val);

	/// Gets or sets a boolean indicating if all bounding boxes must be rendered
	external bool get forceShowBoundingBoxes;
	external void set forceShowBoundingBoxes(bool val);

	/// Gets or sets a boolean indicating if all rendering must be done in wireframe
	external bool get forceWireframe;
	external void set forceWireframe(bool val);

	/// Gets the list of frustum planes (built from the active camera)
	external List<Plane> get frustumPlanes;

	/// Gets the gamepad manager associated with the scene
	external GamepadManager get gamepadManager;

	/// Gets or Sets the current geometry buffer associated to the scene.
	external GeometryBufferRenderer get geometryBufferRenderer;
	external void set geometryBufferRenderer(GeometryBufferRenderer val);

	/// Lambda returning the list of potentially active meshes.
	external Function get getActiveMeshCandidates;
	external void set getActiveMeshCandidates(Function val);

	/// Lambda returning the list of potentially active sub meshes.
	external Function get getActiveSubMeshCandidates;
	external void set getActiveSubMeshCandidates(Function val);

	/// Lambda returning the list of potentially colliding sub meshes.
	external Function get getCollidingSubMeshCandidates;
	external void set getCollidingSubMeshCandidates(Function val);

	/// User updatable function that will return a deterministic frame time when engine is in deterministic lock step mode
	external Function get getDeterministicFrameTime;
	external void set getDeterministicFrameTime(Function val);

	/// Lambda returning the list of potentially intersecting sub meshes.
	external Function get getIntersectingSubMeshCandidates;
	external void set getIntersectingSubMeshCandidates(Function val);

	/// Defines the gravity applied to this scene (used only for collisions)
	external Vector3 get gravity;
	external void set gravity(Vector3 val);

	/// Gets or sets if audio will be output to headphones
	external bool get headphone;
	external void set headphone(bool val);

	/// Defines the HTML cursor to use when hovering over interactive elements
	external String get hoverCursor;
	external void set hoverCursor(String val);

	/// Default image processing configuration used either in the rendering
	/// Forward main pass or through the imageProcessingPostProcess if present.
	/// As in the majority of the scene they are the same (exception for multi camera),
	/// this is easier to reference from here than from all the materials and post process.
	external ImageProcessingConfiguration get imageProcessingConfiguration;
	external void set imageProcessingConfiguration(ImageProcessingConfiguration val);

	/// Gets the list of meshes imported to the scene through SceneLoader
	external List<String> get importedMeshesFiles;

	/// Gets if the scene is already disposed
	external bool get isDisposed;

	/// Returns a boolean indicating if the scene is still loading data
	external bool get isLoading;
	external void set isLoading(bool val);

	/// Gets or sets a boolean indicating if lens flares are enabled on this scene
	external bool get lensFlaresEnabled;
	external void set lensFlaresEnabled(bool val);

	/// Gets or sets a boolean indicating if lights are enabled on this scene
	external bool get lightsEnabled;
	external void set lightsEnabled(bool val);

	/// Gets the name of the plugin used to load this scene (null by default)
	external String get loadingPluginName;

	/// The main sound track played by the scene.
	/// It cotains your primary collection of sounds.
	external SoundTrack get mainSoundTrack;
	external void set mainSoundTrack(SoundTrack val);

	/// Gets the mesh that is currently under the pointer
	external AbstractMesh get meshUnderPointer;

	/// Gets or sets user defined metadata
	external dynamic get metadata;
	external void set metadata(dynamic val);

	/// Gets or sets the current offline provider to use to store scene data
	external IOfflineProvider get offlineProvider;
	external void set offlineProvider(IOfflineProvider val);

	/// An event triggered when the activeCamera property is updated
	external Observable<Scene> get onActiveCameraChanged;

	/// An event triggered when active meshes evaluation is done
	external Observable<Scene> get onAfterActiveMeshesEvaluationObservable;

	/// An event triggered after animations processing
	external Observable<Scene> get onAfterAnimationsObservable;

	/// An event triggered after rendering a camera
	external Observable<Camera> get onAfterCameraRenderObservable;

	/// An event triggered after draw calls have been sent
	external Observable<Scene> get onAfterDrawPhaseObservable;

	/// An event triggered when particles rendering is done
	/// Note: This event can be trigger more than once per frame (because particles can be rendered by render target textures as well)
	external Observable<Scene> get onAfterParticlesRenderingObservable;

	/// An event triggered when physic simulation has been done
	external Observable<Scene> get onAfterPhysicsObservable;

	/// An event triggered after rendering the scene
	external Observable<Scene> get onAfterRenderObservable;

	/// An event triggered when render targets were rendered.
	/// Can happen multiple times per frame.
	external Observable<Scene> get onAfterRenderTargetsRenderObservable;

	/// This Observable will be triggered after rendering each renderingGroup of each rendered camera.
	/// The RenderinGroupInfo class contains all the information about the context in which the observable is called
	/// If you wish to register an Observer only for a given set of renderingGroup, use the mask with a combination of the renderingGroup index elevated to the power of two (1 for renderingGroup 0, 2 for renderingrOup1, 4 for 2 and 8 for 3)
	external Observable<RenderingGroupInfo> get onAfterRenderingGroupObservable;

	/// An event triggered when sprites rendering is done
	/// Note: This event can be trigger more than once per frame (because sprites can be rendered by render target textures as well)
	external Observable<Scene> get onAfterSpritesRenderingObservable;

	/// An event triggered after calculating deterministic simulation step
	external Observable<Scene> get onAfterStepObservable;

	/// An event triggered when active meshes evaluation is about to start
	external Observable<Scene> get onBeforeActiveMeshesEvaluationObservable;

	/// An event triggered before animating the scene
	external Observable<Scene> get onBeforeAnimationsObservable;

	/// An event triggered before rendering a camera
	external Observable<Camera> get onBeforeCameraRenderObservable;

	/// An event triggered before draw calls are ready to be sent
	external Observable<Scene> get onBeforeDrawPhaseObservable;

	/// An event triggered when particles rendering is about to start
	/// Note: This event can be trigger more than once per frame (because particles can be rendered by render target textures as well)
	external Observable<Scene> get onBeforeParticlesRenderingObservable;

	/// An event triggered when physic simulation is about to be run
	external Observable<Scene> get onBeforePhysicsObservable;

	/// An event triggered before rendering the scene (right after animations and physics)
	external Observable<Scene> get onBeforeRenderObservable;

	/// An event triggered when render targets are about to be rendered
	/// Can happen multiple times per frame.
	external Observable<Scene> get onBeforeRenderTargetsRenderObservable;

	/// This Observable will be triggered before rendering each renderingGroup of each rendered camera.
	/// The RenderinGroupInfo class contains all the information about the context in which the observable is called
	/// If you wish to register an Observer only for a given set of renderingGroup, use the mask with a combination of the renderingGroup index elevated to the power of two (1 for renderingGroup 0, 2 for renderingrOup1, 4 for 2 and 8 for 3)
	external Observable<RenderingGroupInfo> get onBeforeRenderingGroupObservable;

	/// An event triggered when sprites rendering is about to start
	/// Note: This event can be trigger more than once per frame (because sprites can be rendered by render target textures as well)
	external Observable<Scene> get onBeforeSpritesRenderingObservable;

	/// An event triggered before calculating deterministic simulation step
	external Observable<Scene> get onBeforeStepObservable;

	/// An event triggered when a camera is removed
	external Observable<Camera> get onCameraRemovedObservable;

	/// An event triggered when SceneLoader.Append or SceneLoader.Load or SceneLoader.ImportMesh were successfully executed
	external Observable<Scene> get onDataLoadedObservable;

	/// Sets a function to be executed when this scene is disposed.
	external Function get onDispose;
	external void set onDispose(Function val);

	/// An event triggered when the scene is disposed.
	external Observable<Scene> get onDisposeObservable;

	/// An event triggered when a geometry is removed
	external Observable<Geometry> get onGeometryRemovedObservable;

	/// Observable event triggered each time an keyboard event is received from the hosting window
	external Observable<KeyboardInfo> get onKeyboardObservable;

	/// An event triggered when a light is removed
	external Observable<Light> get onLightRemovedObservable;

	/// An event triggered when a material is removed
	external Observable<Material> get onMaterialRemovedObservable;

	/// This Observable will when a mesh has been imported into the scene.
	external Observable<AbstractMesh> get onMeshImportedObservable;

	/// An event triggered when a mesh is removed
	external Observable<AbstractMesh> get onMeshRemovedObservable;

	/// An event triggered when a camera is created
	external Observable<Camera> get onNewCameraAddedObservable;

	/// An event triggered when a geometry is created
	external Observable<Geometry> get onNewGeometryAddedObservable;

	/// An event triggered when a light is created
	external Observable<Light> get onNewLightAddedObservable;

	/// An event triggered when a material is created
	external Observable<Material> get onNewMaterialAddedObservable;

	/// An event triggered when a mesh is created
	external Observable<AbstractMesh> get onNewMeshAddedObservable;

	/// An event triggered when a texture is created
	external Observable<BaseTexture> get onNewTextureAddedObservable;

	/// An event triggered when a transform node is created
	external Observable<TransformNode> get onNewTransformNodeAddedObservable;

	/// Callback called when a pointer down is detected
	external Function get onPointerDown;
	external void set onPointerDown(Function val);

	/// Callback called when a pointer move is detected
	external Function get onPointerMove;
	external void set onPointerMove(Function val);

	/// Observable event triggered each time an input event is received from the rendering canvas
	external Observable<PointerInfo> get onPointerObservable;

	/// Callback called when a pointer pick is detected
	external Function get onPointerPick;
	external void set onPointerPick(Function val);

	/// Callback called when a pointer up is detected
	external Function get onPointerUp;
	external void set onPointerUp(Function val);

	/// This observable event is triggered when any keyboard event si raised and registered during Scene.attachControl()
	/// You have the possibility to skip the process and the call to onKeyboardObservable by setting KeyboardInfoPre.skipOnPointerObservable to true
	external Observable<KeyboardInfoPre> get onPreKeyboardObservable;

	/// This observable event is triggered when any ponter event is triggered. It is registered during Scene.attachControl() and it is called BEFORE the 3D engine process anything (mesh/sprite picking for instance).
	/// You have the possibility to skip the process and the call to onPointerObservable by setting PointerInfoPre.skipOnPointerObservable to true
	external Observable<PointerInfoPre> get onPrePointerObservable;

	/// An event triggered when the scene is ready
	external Observable<Scene> get onReadyObservable;

	/// An event triggered when a texture is removed
	external Observable<BaseTexture> get onTextureRemovedObservable;

	/// An event triggered when a transform node is removed
	external Observable<TransformNode> get onTransformNodeRemovedObservable;

	/// Gets or sets a boolean indicating if particles are enabled on this scene
	external bool get particlesEnabled;
	external void set particlesEnabled(bool val);

	/// Gets or sets a predicate used to select candidate meshes for a pointer down event
	external Function get pointerDownPredicate;
	external void set pointerDownPredicate(Function val);

	/// Gets or sets a predicate used to select candidate meshes for a pointer move event
	external Function get pointerMovePredicate;
	external void set pointerMovePredicate(Function val);

	/// Gets or sets a predicate used to select candidate meshes for a pointer up event
	external Function get pointerUpPredicate;
	external void set pointerUpPredicate(Function val);

	/// Gets the current on-screen X position of the pointer
	external num get pointerX;

	/// Gets the current on-screen Y position of the pointer
	external num get pointerY;

	/// Gets the current postprocess manager
	external PostProcessManager get postProcessManager;

	/// Gets the postprocess render pipeline manager
	external PostProcessRenderPipelineManager get postProcessRenderPipelineManager;

	/// The list of postprocesses added to the scene
	external List<PostProcess> get postProcesses;
	external void set postProcesses(List<PostProcess> val);

	/// Gets or sets a boolean indicating if postprocesses are enabled on this scene
	external bool get postProcessesEnabled;
	external void set postProcessesEnabled(bool val);

	/// This is used to call preventDefault() on pointer down
	/// in order to block unwanted artifacts like system double clicks
	external bool get preventDefaultOnPointerDown;
	external void set preventDefaultOnPointerDown(bool val);

	/// This is used to call preventDefault() on pointer up
	/// in order to block unwanted artifacts like system double clicks
	external bool get preventDefaultOnPointerUp;
	external void set preventDefaultOnPointerUp(bool val);

	/// Gets or sets a boolean indicating if probes are enabled on this scene
	external bool get probesEnabled;
	external void set probesEnabled(bool val);

	/// Gets or sets a boolean indicating if procedural textures are enabled on this scene
	external bool get proceduralTexturesEnabled;
	external void set proceduralTexturesEnabled(bool val);

	/// Gets or sets a boolean indicating if render targets are enabled on this scene
	external bool get renderTargetsEnabled;
	external void set renderTargetsEnabled(bool val);

	/// Gets or sets a boolean indicating if lights must be sorted by priority (off by default)
	/// This is useful if there are more lights that the maximum simulteanous authorized
	external bool get requireLightSorting;
	external void set requireLightSorting(bool val);

	/// For internal use only. Please do not use.
	external dynamic get reservedDataStore;
	external void set reservedDataStore(dynamic val);

	/// Gets the octree used to boost mesh selection (picking)
	external Octree<AbstractMesh> get selectionOctree;

	/// Gets or sets a boolean indicating if shadows are enabled on this scene
	external bool get shadowsEnabled;
	external void set shadowsEnabled(bool val);

	/// Gets or sets the simplification queue attached to the scene
	external SimplificationQueue get simplificationQueue;
	external void set simplificationQueue(SimplificationQueue val);

	/// Gets or sets a boolean indicating if skeletons are enabled on this scene
	external bool get skeletonsEnabled;
	external void set skeletonsEnabled(bool val);

	/// The list of sound tracks added to the scene
	external List<SoundTrack> get soundTracks;
	external void set soundTracks(List<SoundTrack> val);

	/// All of the sprite managers added to this scene
	external List<ISpriteManager> get spriteManagers;
	external void set spriteManagers(List<ISpriteManager> val);

	/// Gets or sets a boolean indicating if sprites are enabled on this scene
	external bool get spritesEnabled;
	external void set spritesEnabled(bool val);

	/// Gets or sets a boolean indicating if textures are enabled on this scene
	external bool get texturesEnabled;
	external void set texturesEnabled(bool val);

	/// Gets the performance counter for active indices
	external PerfCounter get totalActiveIndicesPerfCounter;

	/// Gets the performance counter for total vertices
	external PerfCounter get totalVerticesPerfCounter;

	/// Return a unique id as a string which can serve as an identifier for the scene
	external String get uid;
	external void set uid(String val);

	/// Gets the pointer coordinates without any translation (ie. straight out of the pointer event)
	external Vector2 get unTranslatedPointer;

	/// Gets or sets a boolean indicating if a constant deltatime has to be used
	/// This is mostly useful for testing purposes when you do not want the animations to scale with the framerate
	external bool get useConstantAnimationDeltaTime;
	external void set useConstantAnimationDeltaTime(bool val);

	/// Defines if texture loading must be delayed
	/// If true, textures will only be loaded when they need to be rendered
	external bool get useDelayedTextureLoading;
	external void set useDelayedTextureLoading(bool val);

	/// Gets or sets a boolean indicating if the scene must use right-handed coordinates system
	external bool get useRightHandedSystem;
	external void set useRightHandedSystem(bool val);

	/// Gets a boolean indicating if collisions are processed on a web worker
	external bool get workerCollisions;

	// ### Member Methods ##############################

	/// Adds the given action manager to this scene
	external void addActionManager(ActionManager newActionManager);

	/// Adds the given animation to this scene
	external void addAnimation(Animation newAnimation);

	/// Adds the given animation group to this scene.
	external void addAnimationGroup(AnimationGroup newAnimationGroup);

	/// Adds the given camera to this scene
	external void addCamera(Camera newCamera);

	/// Add an externaly attached data from its key.
	/// This method call will fail and return false, if such key already exists.
	/// If you don't care and just want to get the data no matter what, use the more convenient getOrAddExternalDataWithFactory() method.
	external bool addExternalData<T>(String key, T data);

	/// Adds the given geometry to this scene
	external void addGeometry(Geometry newGeometry);

	/// Adds the given light to this scene
	external void addLight(Light newLight);

	/// Adds the given material to this scene
	external void addMaterial(Material newMaterial);

	/// Add a mesh to the list of scene's meshes
	external void addMesh(AbstractMesh newMesh, [bool recursive]);

	/// Adds the given morph target to this scene
	external void addMorphTargetManager(MorphTargetManager newMorphTargetManager);

	/// Adds the given multi-material to this scene
	external void addMultiMaterial(MultiMaterial newMultiMaterial);

	/// Adds the given particle system to this scene
	external void addParticleSystem(IParticleSystem newParticleSystem);

	/// Adds the given skeleton to this scene
	external void addSkeleton(Skeleton newSkeleton);

	/// Adds the given texture to this scene.
	external void addTexture(BaseTexture newTexture);

	/// Add a transform node to the list of scene's transform nodes
	external void addTransformNode(TransformNode newTransformNode);

	/// Attach events to the canvas (To handle actionManagers triggers and raise onPointerMove, onPointerDown and onPointerUp
	external void attachControl([bool attachUp, bool attachDown, bool attachMove]);

	/// Will start the animation sequence of a given target
	external Animatable beginAnimation(dynamic target, num from, num to, [bool loop, num speedRatio, Function onAnimationEnd, Animatable animatable, bool stopCurrent, Function targetMask]);

	/// Begin a new animation on a given node
	external Animatable beginDirectAnimation(dynamic target, List<Animation> animations, num from, num to, [bool loop, num speedRatio, Function onAnimationEnd]);

	/// Begin a new animation on a given node and its hierarchy
	external List<Animatable> beginDirectHierarchyAnimation(Node target, bool directDescendantsOnly, List<Animation> animations, num from, num to, [bool loop, num speedRatio, Function onAnimationEnd]);

	/// Will start the animation sequence of a given target and its hierarchy
	external List<Animatable> beginHierarchyAnimation(dynamic target, bool directDescendantsOnly, num from, num to, [bool loop, num speedRatio, Function onAnimationEnd, Animatable animatable, bool stopCurrent, Function targetMask]);

	/// Will start the animation sequence of a given target
	external Animatable beginWeightedAnimation(dynamic target, num from, num to, [num weight, bool loop, num speedRatio, Function onAnimationEnd, Animatable animatable, Function targetMask]);

	/// This function will remove the local cached buffer data from texture.
	/// It will save memory but will prevent the texture from being rebuilt
	external void cleanCachedTextureBuffer();

	/// Call this function to reduce memory footprint of the scene.
	/// Vertex buffers will not store CPU data anymore (this will prevent picking, collisions or physics to work correctly)
	external void clearCachedVertexData();

	/// Creates a default camera for the scene.
	external void createDefaultCamera([bool createArcRotateCamera, bool replace, bool attachCameraControls]);

	/// Creates a default camera and a default light.
	external void createDefaultCameraOrLight([bool createArcRotateCamera, bool replace, bool attachCameraControls]);

	/// Creates a new environment
	external EnvironmentHelper createDefaultEnvironment([IEnvironmentHelperOptions options]);

	/// Creates a default light for the scene.
	external void createDefaultLight([bool replace]);

	/// Creates a new sky box
	external Mesh createDefaultSkybox([BaseTexture environmentTexture, bool pbr, num scale, num blur, bool setGlobalEnvTexture]);

	/// Creates a new VREXperienceHelper
	external VRExperienceHelper createDefaultVRExperience([VRExperienceHelperOptions webVROptions]);

	/// Creates a new XREXperienceHelper
	external Promise<WebXRExperienceHelper> createDefaultXRExperienceAsync();

	/// Creates or updates the octree used to boost selection (picking)
	external Octree<AbstractMesh> createOrUpdateSelectionOctree([num maxCapacity, num maxDepth]);

	/// Creates a ray that can be used to pick in the scene
	external Ray createPickingRay(num x, num y, Matrix world, Camera camera, [bool cameraViewSpace]);

	/// Creates a ray that can be used to pick in the scene
	external Ray createPickingRayInCameraSpace(num x, num y, [Camera camera]);

	/// Creates a ray that can be used to pick in the scene
	external Scene createPickingRayInCameraSpaceToRef(num x, num y, Ray result, [Camera camera]);

	/// Creates a ray that can be used to pick in the scene
	external Scene createPickingRayToRef(num x, num y, Matrix world, Ray result, Camera camera, [bool cameraViewSpace]);

	/// Deletes a physics compound impostor
	external void deleteCompoundImpostor(dynamic compound);

	/// Detaches all event handlers
	external void detachControl();

	/// Disables a depth renderer for a given camera
	external void disableDepthRenderer([Camera camera]);

	/// Disables the GeometryBufferRender associated with the scene
	external void disableGeometryBufferRenderer();

	/// Disables and disposes the physics engine associated with the scene
	external void disablePhysicsEngine();

	/// Releases all held ressources
	external void dispose();

	/// Creates a depth renderer a given camera which contains a depth map which can be used for post processing.
	external DepthRenderer enableDepthRenderer([Camera camera]);

	/// Enables a GeometryBufferRender and associates it with the scene
	external GeometryBufferRenderer enableGeometryBufferRenderer([num ratio]);

	/// Enables physics to the current scene
	external bool enablePhysics(Vector3 gravity, [IPhysicsEnginePlugin plugin]);

	/// The provided function will run before render once and will be disposed afterwards.
	/// A timeout delay can be provided so that the function will be executed in N ms.
	/// The timeout is using the browser's native setTimeout so time percision cannot be guaranteed.
	external void executeOnceBeforeRender(Function func, [num timeout]);

	/// Registers a function to be executed when the scene is ready
	external void executeWhenReady(Function func);

	/// Clear the active meshes smart array preventing retention point in mesh dispose.
	external void freeActiveMeshes();

	/// Clear the processed materials smart array preventing retention point in material dispose.
	external void freeProcessedMaterials();

	/// Clear the info related to rendering groups preventing retention points during dispose.
	external void freeRenderingGroups();

	/// Use this function to stop evaluating active meshes. The current list will be keep alive between frames
	external Scene freezeActiveMeshes();

	/// Freeze all materials
	/// A frozen material will not be updatable but should be faster to render
	external void freezeMaterials();

	/// Gets the total number of active bones rendered per frame
	external num getActiveBones();

	/// Gets the total number of active indices rendered per frame (You can deduce the number of rendered triangles by dividing this number by 3)
	external num getActiveIndices();

	/// Gets the array of active meshes
	external SmartArray<AbstractMesh> getActiveMeshes();

	/// Gets the total number of active particles rendered per frame
	external num getActiveParticles();

	/// Gets all animatables associated with a given target
	external List<Animatable> getAllAnimatablesByTarget(dynamic target);

	/// Gets the animatable associated with a specific target
	external Animatable getAnimatableByTarget(dynamic target);

	/// get an animation group using its name
	external AnimationGroup getAnimationGroupByName(String name);

	/// Gets the animation ratio (which is 1.0 is the scene renders at 60fps and 2 if the scene renders at 30fps, etc.)
	external num getAnimationRatio();

	/// Gets the current auto clear configuration for one rendering group of the rendering
	/// manager.
	external IRenderingManagerAutoClearSetup getAutoClearDepthStencilSetup(num index);

	/// Gets a bone using its id
	external Bone getBoneByID(String id);

	/// Gets a bone using its id
	external Bone getBoneByName(String name);

	/// Gets the bounding box renderer associated with the scene
	external BoundingBoxRenderer getBoundingBoxRenderer();

	/// Gets the cached effect (ie. the latest rendered one)
	external Effect getCachedEffect();

	/// Gets the cached material (ie. the latest rendered one)
	external Material getCachedMaterial();

	/// Gets the cached visibility state (ie. the latest rendered one)
	external num getCachedVisibility();

	/// Gets a camera using its id
	external Camera getCameraByID(String id);

	/// Gets a camera using its name
	external Camera getCameraByName(String name);

	/// Gets a camera using its unique id
	external Camera getCameraByUniqueID(num uniqueId);

	/// Get a list of cameras by tags
	external List<Camera> getCamerasByTags(String tagsQuery, [Function forEach]);

	/// Gets the engine associated with the scene
	external Engine getEngine();

	/// Get an externaly attached data from its key
	external T getExternalData<T>(String key);

	/// Gets an unique Id for the current frame
	external num getFrameId();

	/// Gets the list of geometries attached to the scene
	external List<Geometry> getGeometries();

	/// Gets a geometry using its ID
	external Geometry getGeometryByID(String id);

	/// Gets the internal step used by deterministic lock step
	external num getInternalStep();

	/// Gets a the last added node (Mesh, Camera, Light) using a given id
	external Node getLastEntryByID(String id);

	/// Gets a the last added mesh using a given id
	external AbstractMesh getLastMeshByID(String id);

	/// Gets a skeleton using a given id (if many are found, this function will pick the last one)
	external Skeleton getLastSkeletonByID(String id);

	/// Gets a light node using its id
	external Light getLightByID(String id);

	/// Gets a light node using its name
	external Light getLightByName(String name);

	/// Gets a light node using its scene-generated unique ID
	external Light getLightByUniqueID(num uniqueId);

	/// Get a list of lights by tags
	external List<Light> getLightsByTags(String tagsQuery, [Function forEach]);

	/// get a material using its id
	external Material getMaterialByID(String id);

	/// Gets a material using its name
	external Material getMaterialByName(String name);

	/// Get a list of materials by tags
	external List<Material> getMaterialByTags(String tagsQuery, [Function forEach]);

	/// Gets the first added mesh found of a given ID
	external AbstractMesh getMeshByID(String id);

	/// Gets a mesh using a given name
	external AbstractMesh getMeshByName(String name);

	/// Gets a mesh with its auto-generated unique id
	external AbstractMesh getMeshByUniqueID(num uniqueId);

	/// Gets a list of meshes using their id
	external List<AbstractMesh> getMeshesByID(String id);

	/// Get a list of meshes by tags
	external List<Mesh> getMeshesByTags(String tagsQuery, [Function forEach]);

	/// Gets a morph target using a given id (if many are found, this function will pick the first one)
	external MorphTarget getMorphTargetById(String id);

	/// Gets a morph target manager  using a given id (if many are found, this function will pick the last one)
	external MorphTargetManager getMorphTargetManagerById(num id);

	/// Gets a node (Mesh, Camera, Light) using a given id
	external Node getNodeByID(String id);

	/// Gets a node (Mesh, Camera, Light) using a given name
	external Node getNodeByName(String name);

	/// Get an externaly attached data from its key, create it using a factory if it's not already present
	external T getOrAddExternalDataWithFactory<T>(String key, Function factory);

	/// Gets the outline renderer associated with the scene
	external OutlineRenderer getOutlineRenderer();

	/// Gets a particle system by id
	external IParticleSystem getParticleSystemByID(String id);

	/// Gets the current physics engine
	external IPhysicsEngine getPhysicsEngine();

	/// Gets the mesh under the pointer
	external AbstractMesh getPointerOverMesh();

	/// Gets the sprite under the pointer
	external Sprite getPointerOverSprite();

	/// Gets the current projection matrix
	external Matrix getProjectionMatrix();

	/// Gets an unique Id for the current render phase
	external num getRenderId();

	/// Gets the uniform buffer used to store scene data
	external UniformBuffer getSceneUniformBuffer();

	/// Gets a skeleton using a given id (if many are found, this function will pick the first one)
	external Skeleton getSkeletonById(String id);

	/// Gets a skeleton using a given name
	external Skeleton getSkeletonByName(String name);

	/// Gets a sound using a given name
	external Sound getSoundByName(String name);

	/// Gets the step Id used by deterministic lock step
	external num getStepId();

	/// Gets the total number of vertices rendered per frame
	external num getTotalVertices();

	/// Gets the current transform matrix
	external Matrix getTransformMatrix();

	/// Gets the first added transform node found of a given ID
	external TransformNode getTransformNodeByID(String id);

	/// Gets a transform node using a given name
	external TransformNode getTransformNodeByName(String name);

	/// Gets a list of transform nodes using their id
	external List<TransformNode> getTransformNodesByID(String id);

	/// Gets an unique (relatively to the current scene) Id
	external num getUniqueId();

	/// Gets the current view matrix
	external Matrix getViewMatrix();

	/// Returns the number of items waiting to be loaded
	external num getWaitingItemsCount();

	/// Get the world extend vectors with an optional filter
	external Object getWorldExtends([Function filterPredicate]);

	/// Call this function if you want to manually increment the render Id
	external void incrementRenderId();

	/// Gets a boolean indicating if the given mesh is active
	external bool isActiveMesh(AbstractMesh mesh);

	/// Gets a boolean indicating if the current material / effect / visibility must be bind again
	external bool isCachedMaterialInvalid(Material material, Effect effect, [num visibility]);

	/// Gets a boolean indicating if there is an active physics engine
	external bool isPhysicsEnabled();

	/// Gets a boolean indicating if the current pointer event is captured (meaning that the scene has already handled the pointer down)
	external bool isPointerCaptured([num pointerId]);

	/// This function will check if the scene can be rendered (textures are loaded, shaders are compiled)
	/// Delay loaded resources are not taking in account
	external bool isReady();

	/// Will flag all materials as dirty to trigger new shader compilation
	external void markAllMaterialsAsDirty(num flag, [Function predicate]);

	/// Launch a ray to try to pick a mesh in the scene
	external List<PickingInfo> multiPick(num x, num y, [Function predicate, Camera camera]);

	/// Launch a ray to try to pick a mesh in the scene
	external List<PickingInfo> multiPickWithRay(Ray ray, Function predicate);

	/// Launch a ray to try to pick a mesh in the scene
	external PickingInfo pick(num x, num y, [Function predicate, bool fastCheck, Camera camera]);

	/// Launch a ray to try to pick a sprite in the scene
	external PickingInfo pickSprite(num x, num y, [Function predicate, bool fastCheck, Camera camera]);

	/// Use the given ray to pick a sprite in the scene
	external PickingInfo pickSpriteWithRay(Ray ray, [Function predicate, bool fastCheck, Camera camera]);

	/// Use the given ray to pick a mesh in the scene
	external PickingInfo pickWithRay(Ray ray, [Function predicate, bool fastCheck]);

	/// Add a new geometry to this scene
	external bool pushGeometry(Geometry geometry, [bool force]);

	/// Registers a function to be called after every frame render
	external void registerAfterRender(Function func);

	/// Registers a function to be called before every frame render
	external void registerBeforeRender(Function func);

	/// Removes the given action manager from this scene.
	external num removeActionManager(ActionManager toRemove);

	/// Remove a animation for the list of scene's animations
	external num removeAnimation(Animation toRemove);

	/// Removes the given animation group from this scene.
	external num removeAnimationGroup(AnimationGroup toRemove);

	/// Remove a camera for the list of scene's cameras
	external num removeCamera(Camera toRemove);

	/// Remove an externaly attached data from the Engine instance
	external bool removeExternalData(String key);

	/// Removes an existing geometry
	external bool removeGeometry(Geometry geometry);

	/// Remove a light for the list of scene's lights
	external num removeLight(Light toRemove);

	/// Removes the given material from this scene.
	external num removeMaterial(Material toRemove);

	/// Remove a mesh for the list of scene's meshes
	external num removeMesh(AbstractMesh toRemove, [bool recursive]);

	/// Remove a morph target for the list of scene's morph targets
	external num removeMorphTargetManager(MorphTargetManager toRemove);

	/// Removes the given multi-material from this scene.
	external num removeMultiMaterial(MultiMaterial toRemove);

	/// Remove a particle system for the list of scene's particle systems
	external num removeParticleSystem(IParticleSystem toRemove);

	/// Remove a skeleton for the list of scene's skeletons
	external num removeSkeleton(Skeleton toRemove);

	/// Removes the given texture from this scene.
	external num removeTexture(BaseTexture toRemove);

	/// Remove a transform node for the list of scene's transform nodes
	external num removeTransformNode(TransformNode toRemove);

	/// Render the scene
	external void render([bool updateCameras]);

	/// Resets all cached information relative to material (including effect and visibility)
	external void resetCachedMaterial();

	/// sets the active camera of the scene using its ID
	external Camera setActiveCameraByID(String id);

	/// sets the active camera of the scene using its name
	external Camera setActiveCameraByName(String name);

	/// Sets the default candidate providers for the scene.
	/// This sets the getActiveMeshCandidates, getActiveSubMeshCandidates, getIntersectingSubMeshCandidates
	/// and getCollidingSubMeshCandidates to their default function
	external void setDefaultCandidateProviders();

	/// Force the value of meshUnderPointer
	external void setPointerOverMesh(AbstractMesh mesh);

	/// Force the sprite under the pointer
	external void setPointerOverSprite(Sprite sprite);

	/// Specifies whether or not the stencil and depth buffer are cleared between two rendering groups.
	external void setRenderingAutoClearDepthStencil(num renderingGroupId, bool autoClearDepthStencil, [bool depth, bool stencil]);

	/// Overrides the default sort function applied in the renderging group to prepare the meshes.
	/// This allowed control for front to back rendering or reversly depending of the special needs.
	external void setRenderingOrder(num renderingGroupId, [Function opaqueSortCompareFn, Function alphaTestSortCompareFn, Function transparentSortCompareFn]);

	/// Sets the step Id used by deterministic lock step
	external void setStepId(num newStepId);

	/// Sets the current transform matrix
	external void setTransformMatrix(Matrix view, Matrix projection);

	/// Use this method to simulate a pointer down on a mesh
	/// The pickResult parameter can be obtained from a scene.pick or scene.pickWithRay
	external Scene simulatePointerDown(PickingInfo pickResult, [PointerEventInit pointerEventInit]);

	/// Use this method to simulate a pointer move on a mesh
	/// The pickResult parameter can be obtained from a scene.pick or scene.pickWithRay
	external Scene simulatePointerMove(PickingInfo pickResult, [PointerEventInit pointerEventInit]);

	/// Use this method to simulate a pointer up on a mesh
	/// The pickResult parameter can be obtained from a scene.pick or scene.pickWithRay
	external Scene simulatePointerUp(PickingInfo pickResult, [PointerEventInit pointerEventInit, bool doubleTap]);

	/// Sorts the list list based on light priorities
	external void sortLightsByPriority();

	/// Stops and removes all animations that have been applied to the scene
	external void stopAllAnimations();

	/// Will stop the animation of the given target
	external void stopAnimation(dynamic target, [String animationName, Function targetMask]);

	/// Switch active camera
	external void switchActiveCamera(Camera newCamera, [bool attachControl]);

	/// Use this function to restart evaluating active meshes on every frame
	external Scene unfreezeActiveMeshes();

	/// Unfreeze all materials
	/// A frozen material will not be updatable but should be faster to render
	external void unfreezeMaterials();

	/// Unregisters a function called after every frame render
	external void unregisterAfterRender(Function func);

	/// Unregisters a function called before every frame render
	external void unregisterBeforeRender(Function func);

	/// Defines an alternate camera (used mostly in VR-like scenario where two cameras can render the same scene from a slightly different point of view)
	external void updateAlternateTransformMatrix(Camera alternateCamera);

	/// Update the transform matrix to update from the current active camera
	external void updateTransformMatrix([bool force]);

	/// Returns a promise that resolves when the scene is ready
	external Promise<Null> whenReadyAsync();

	// ### Static Fields ##############################

	/// Time in milliseconds with two consecutive clicks will be considered as a double click
	external static num get DoubleClickDelay;

	/// The distance in pixel that you have to move to prevent some events
	external static num get DragMovementThreshold;

	/// If you need to check double click without raising a single click at first click, enable this flag
	external static bool get ExclusiveDoubleClickMode;

	/// The fog density is following an exponential function
	external static num get FOGMODE_EXP;

	/// The fog density is following an exponential function faster than FOGMODE_EXP
	external static num get FOGMODE_EXP2;

	/// The fog density is following a linear function.
	external static num get FOGMODE_LINEAR;

	/// The fog is deactivated
	external static num get FOGMODE_NONE;

	/// Time in milliseconds to wait to raise long press events if button is still pressed
	external static num get LongPressDelay;

	/// Gets or sets the maximum deltatime when deterministic lock step is enabled
	external static num get MaxDeltaTime;

	/// Gets or sets the minimum deltatime when deterministic lock step is enabled
	external static num get MinDeltaTime;

}


