part of Babylon;

// ### Camera ##############################


/// This is the base class of all the camera used in the application.
/// 
/// 
/// see
/// http://doc.babylonjs.com/features/cameras
@JS()
class Camera extends Node {
	external Camera(String name, Vector3 position, Scene scene, [bool setActiveOnSceneIfNoneActive]);

	// ### Member Fields ##############################

	/// Rig mode of the camera.
	/// This is useful to create the camera with two "eyes" instead of one to create VR or stereoscopic scenes.
	/// This is normally controlled byt the camera themselves as internal use.
	external num get cameraRigMode;
	external void set cameraRigMode(num val);

	/// Defines the list of custom render target which are rendered to and then used as the input to this camera's render. Eg. display another camera view on a TV in the main scene
	/// This is pretty helpfull if you wish to make a camera render to a texture you could reuse somewhere
	/// else in the scene.
	external List<RenderTargetTexture> get customRenderTargets;
	external void set customRenderTargets(List<RenderTargetTexture> val);

	/// Field Of View is set in Radians. (default is 0.8)
	external num get fov;
	external void set fov(num val);

	/// fovMode sets the camera frustum bounds to the viewport bounds. (default is FOVMODE_VERTICAL_FIXED)
	external num get fovMode;
	external void set fovMode(num val);

	/// Gets the current world space position of the camera.
	external Vector3 get globalPosition;

	/// Define the default inertia of the camera.
	/// This helps giving a smooth feeling to the camera movement.
	external num get inertia;
	external void set inertia(num val);

	/// Define the input manager associated with the camera.
	external CameraInputsManager<Camera> get inputs;
	external void set inputs(CameraInputsManager<Camera> val);

	/// Defines the distance between both "eyes" in case of a RIG
	external num get interaxialDistance;
	external void set interaxialDistance(num val);

	/// Define wether the camera is intermediate.
	/// This is useful to not present the output directly to the screen in case of rig without post process for instance
	external bool get isIntermediate;
	external void set isIntermediate(bool val);

	/// Defines if stereoscopic rendering is done side by side or over under.
	external bool get isStereoscopicSideBySide;
	external void set isStereoscopicSideBySide(bool val);

	/// Restricts the camera to viewing objects with the same layerMask.
	/// A camera with a layerMask of 1 will render mesh.layerMask & camera.layerMask!== 0
	external num get layerMask;
	external void set layerMask(num val);

	/// Gets the left camera of a rig setup in case of Rigged Camera
	external FreeCamera get leftCamera;

	/// Define the maximum distance the camera can see to.
	/// This is important to note that the depth buffer are not infinite and the further it end
	/// the more your scene might encounter depth fighting issue.
	external num get maxZ;
	external void set maxZ(num val);

	/// Define the minimum distance the camera can see from.
	/// This is important to note that the depth buffer are not infinite and the closer it starts
	/// the more your scene might encounter depth fighting issue.
	external num get minZ;
	external void set minZ(num val);

	/// Define the mode of the camera (Camera.PERSPECTIVE_CAMERA or Camera.PERSPECTIVE_ORTHOGRAPHIC)
	external num get mode;
	external void set mode(num val);

	/// Observable triggered when the inputs have been processed.
	external Observable<Camera> get onAfterCheckInputsObservable;

	/// Observable triggered when the camera Projection matrix has changed.
	external Observable<Camera> get onProjectionMatrixChangedObservable;

	/// Observable triggered when reset has been called and applied to the camera.
	external Observable<Camera> get onRestoreStateObservable;

	/// Observable triggered when the camera view matrix has changed.
	external Observable<Camera> get onViewMatrixChangedObservable;

	/// Define the current limit on the bottom side for an orthographic camera
	/// In scene unit
	external num get orthoBottom;
	external void set orthoBottom(num val);

	/// Define the current limit on the left side for an orthographic camera
	/// In scene unit
	external num get orthoLeft;
	external void set orthoLeft(num val);

	/// Define the current limit on the right side for an orthographic camera
	/// In scene unit
	external num get orthoRight;
	external void set orthoRight(num val);

	/// Define the current limit on the top side for an orthographic camera
	/// In scene unit
	external num get orthoTop;
	external void set orthoTop(num val);

	/// When set, the camera will render to this render target instead of the default canvas
	external RenderTargetTexture get outputRenderTarget;
	external void set outputRenderTarget(RenderTargetTexture val);

	/// Define the current local position of the camera in the scene
	external Vector3 get position;
	external void set position(Vector3 val);

	/// Gets the post process used by the rig cameras
	external PostProcess get rigPostProcess;

	/// Gets the right camera of a rig setup in case of Rigged Camera
	external FreeCamera get rightCamera;

	/// The vector the camera should consider as up.
	/// (default is Vector3(0, 1, 0) aka Vector3.Up())
	external Vector3 get upVector;
	external void set upVector(Vector3 val);

	/// Define the viewport of the camera.
	/// This correspond to the portion of the screen the camera will render to in normalized 0 to 1 unit.
	external Viewport get viewport;
	external void set viewport(Viewport val);

	// ### Member Methods ##############################

	/// Attach the input controls to a specific dom element to get the input from.
	external void attachControl(HTML.Element element, [bool noPreventDefault]);

	/// Attach a post process to the camera.
	external num attachPostProcess(PostProcess postProcess, [num insertAt]);

	/// Clones the current camera.
	external Camera clone(String name);

	/// Detach the current controls from the specified dom element.
	external void detachControl(HTML.Element element);

	/// Detach a post process to the camera.
	external void detachPostProcess(PostProcess postProcess);

	/// Freeze the projection matrix.
	/// It will prevent the cache check of the camera projection compute and can speed up perf
	/// if no parameter of the camera are meant to change
	external void freezeProjectionMatrix([Matrix projection]);

	/// Gets the list of active meshes this frame (meshes no culled or excluded by lod s in the frame)
	external SmartArray<AbstractMesh> getActiveMeshes();

	/// Gets the direction of the camera relative to a given local axis.
	external Vector3 getDirection(Vector3 localAxis);

	/// Gets the direction of the camera relative to a given local axis into a passed vector.
	external void getDirectionToRef(Vector3 localAxis, Vector3 result);

	/// Gets a ray in the forward direction from the camera.
	external Ray getForwardRay([num length, Matrix transform, Vector3 origin]);

	/// Gets the left camera target of a rig setup in case of Rigged Camera
	external Vector3 getLeftTarget();

	/// Gets the current projection matrix of the camera.
	external Matrix getProjectionMatrix([bool force]);

	/// Gets the right camera target of a rig setup in case of Rigged Camera
	external Vector3 getRightTarget();

	/// Gets the transformation matrix (ie. the multiplication of view by projection matrices)
	external Matrix getTransformationMatrix();

	/// Gets the current view matrix of the camera.
	external Matrix getViewMatrix([bool force]);

	/// Check wether a mesh is part of the current active mesh list of the camera
	external bool isActiveMesh(Mesh mesh);

	/// Checks if a cullable object (mesh...) is in the camera frustum
	/// Unlike isInFrustum this cheks the full bounding box
	external bool isCompletelyInFrustum(ICullable target);

	/// Checks if a cullable object (mesh...) is in the camera frustum
	/// This checks the bounding box center. See isCompletelyInFrustum for a full bounding check
	external bool isInFrustum(ICullable target);

	/// Restored camera state. You must call storeState() first.
	external bool restoreState();

	/// Serialiaze the camera setup to a json represention
	external dynamic serialize();

	/// Store current camera state (fov, position, etc..)
	external Camera storeState();

	/// Gets a string representation of the camera useful for debug purpose.
	external String toString([bool fullDetails]);

	/// Unfreeze the projection matrix if it has previously been freezed by freezeProjectionMatrix.
	external void unfreezeProjectionMatrix();

	/// Update the camera state according to the different inputs gathered during the frame.
	external void update();

	// ### Static Fields ##############################

	/// This setting aligns the left and right bounds of the viewport to the left and right bounds of the camera frustum.
	external static num get FOVMODE_HORIZONTAL_FIXED;

	/// This is the default FOV mode for perspective cameras.
	/// This setting aligns the upper and lower bounds of the viewport to the upper and lower bounds of the camera frustum.
	external static num get FOVMODE_VERTICAL_FIXED;

	/// Defines if by default attaching controls should prevent the default javascript event to continue.
	external static bool get ForceAttachControlToAlwaysPreventDefault;

	/// This helps creating camera with an orthographic mode.
	/// Orthographic is commonly used in engineering as a means to produce object specifications that communicate dimensions unambiguously, each line of 1 unit length (cm, meter..whatever) will appear to have the same length everywhere on the drawing. This allows the drafter to dimension only a subset of lines and let the reader know that other lines of that length on the drawing are also that length in reality. Every parallel line in the drawing is also parallel in the object.
	external static num get ORTHOGRAPHIC_CAMERA;

	/// This is the default projection mode used by the cameras.
	/// It helps recreating a feeling of perspective and better appreciate depth.
	/// This is the best way to simulate real life cameras.
	external static num get PERSPECTIVE_CAMERA;

	/// Custom rig mode allowing rig cameras to be populated manually with any number of cameras
	external static num get RIG_MODE_CUSTOM;

	/// This specifies ther is no need for a camera rig.
	/// Basically only one eye is rendered corresponding to the camera.
	external static num get RIG_MODE_NONE;

	/// Simulates a camera Rig with one blue eye and one red eye.
	/// This can be use with 3d blue and red glasses.
	external static num get RIG_MODE_STEREOSCOPIC_ANAGLYPH;

	/// Defines that both eyes of the camera will be rendered over under each other.
	external static num get RIG_MODE_STEREOSCOPIC_OVERUNDER;

	/// Defines that both eyes of the camera will be rendered side by side with a none parallel target.
	external static num get RIG_MODE_STEREOSCOPIC_SIDEBYSIDE_CROSSEYED;

	/// Defines that both eyes of the camera will be rendered side by side with a parallel target.
	external static num get RIG_MODE_STEREOSCOPIC_SIDEBYSIDE_PARALLEL;

	/// Defines that both eyes of the camera should be renderered in a VR mode (carbox).
	external static num get RIG_MODE_VR;

	/// Defines that both eyes of the camera should be renderered in a VR mode (webVR).
	external static num get RIG_MODE_WEBVR;

	// ### Static Methods ##############################

	/// Gets a camera constructor for a given camera type
	external static Function GetConstructorFromName(String type, String name, Scene scene, [num interaxial_distance, bool isStereoscopicSideBySide]);

	/// Parse a JSON and creates the camera from the parsed information
	external static Camera Parse(dynamic parsedCamera, Scene scene);
}

// ### CameraInputsManager<TCamera> ##############################


/// This represents the input manager used within a camera.
/// It helps dealing with all the different kind of input attached to a camera.
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/customizing_camera_inputs
@JS()
class CameraInputsManager<TCamera> {
	external CameraInputsManager(TCamera camera);

	// ### Member Fields ##############################

	/// Defines the list of inputs attahed to the camera.
	external CameraInputsMap<TCamera> get attached;
	external void set attached(CameraInputsMap<TCamera> val);

	/// Defines the dom element the camera is collecting inputs from.
	/// This is null if the controls have not been attached.
	external HTML.Element get attachedHTML.Element;
	external void set attachedHTML.Element(HTML.Element val);

	/// Defined the camera the input manager belongs to.
	external TCamera get camera;
	external void set camera(TCamera val);

	/// Update the current camera state depending on the inputs that have been used this frame.
	/// This is a dynamically created lambda to avoid the performance penalty of looping for inputs in the render loop.
	external Function get checkInputs;
	external void set checkInputs(Function val);

	/// Defines whether event caught by the controls should call preventdefault() (https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault)
	external bool get noPreventDefault;
	external void set noPreventDefault(bool val);

	// ### Member Methods ##############################

	/// Add an input method to a camera
	external void add(ICameraInput<TCamera> input);

	/// Attach the current manager inputs controls to a specific dom element to listen the events from.
	external void attachHTML.Element(HTML.Element element, [bool noPreventDefault]);

	/// Attach the input controls to the currently attached dom element to listen the events from.
	external void attachInput(ICameraInput<TCamera> input);

	/// Remove all attached input methods from a camera
	external void clear();

	/// Detach the current manager inputs controls from a specific dom element.
	external void detachHTML.Element(HTML.Element element, [bool disconnect]);

	/// Parses an input manager serialized JSON to restore the previous list of inputs
	/// and states associated to a camera.
	external void parse(dynamic parsedCamera);

	/// Rebuild the dynamic inputCheck function from the current list of
	/// defined inputs in the manager.
	external void rebuildInputCheck();

	/// Remove a specific input method from a camera
	/// example: camera.inputs.remove(camera.inputs.attached.mouse);
	external void remove(ICameraInput<TCamera> inputToRemove);

	/// Remove a specific input type from a camera
	/// example: camera.inputs.remove("ArcRotateCameraGamepadInput");
	external void removeByType(String inputType);

	/// Serialize the current input manager attached to a camera.
	/// This ensures than once parsed,
	/// the input associated to the camera will be identical to the current ones
	external void serialize(dynamic serializedCamera);

}

// ### AnaglyphArcRotateCamera ##############################


/// Camera used to simulate anaglyphic rendering (based on ArcRotateCamera)
/// 
/// 
/// see
/// http://doc.babylonjs.com/features/cameras#anaglyph-cameras
@JS()
class AnaglyphArcRotateCamera extends ArcRotateCamera {
	external AnaglyphArcRotateCamera(String name, num alpha, num beta, num radius, Vector3 target, num interaxialDistance, Scene scene);

}

// ### AnaglyphFreeCamera ##############################


/// Camera used to simulate anaglyphic rendering (based on FreeCamera)
/// 
/// 
/// see
/// http://doc.babylonjs.com/features/cameras#anaglyph-cameras
@JS()
class AnaglyphFreeCamera extends FreeCamera {
	external AnaglyphFreeCamera(String name, Vector3 position, num interaxialDistance, Scene scene);

}

// ### AnaglyphGamepadCamera ##############################


/// Camera used to simulate anaglyphic rendering (based on GamepadCamera)
/// 
/// 
/// see
/// http://doc.babylonjs.com/features/cameras#anaglyph-cameras
@JS()
class AnaglyphGamepadCamera extends GamepadCamera {
	external AnaglyphGamepadCamera(String name, Vector3 position, num interaxialDistance, Scene scene);

}

// ### AnaglyphUniversalCamera ##############################


/// Camera used to simulate anaglyphic rendering (based on UniversalCamera)
/// 
/// 
/// see
/// http://doc.babylonjs.com/features/cameras#anaglyph-cameras
@JS()
class AnaglyphUniversalCamera extends UniversalCamera {
	external AnaglyphUniversalCamera(String name, Vector3 position, num interaxialDistance, Scene scene);

}

// ### ArcFollowCamera ##############################


/// Arc Rotate version of the follow camera.
/// It still follows a Defined mesh but in an Arc Rotate Camera fashion.
/// 
/// 
/// see
/// http://doc.babylonjs.com/features/cameras#follow-camera
@JS()
class ArcFollowCamera extends TargetCamera {
	external ArcFollowCamera(String name, num alpha, num beta, num radius, AbstractMesh target, Scene scene);

	// ### Member Fields ##############################

	/// The longitudinal angle of the camera
	external num get alpha;
	external void set alpha(num val);

	/// The latitudinal angle of the camera
	external num get beta;
	external void set beta(num val);

	/// The radius of the camera from its target
	external num get radius;
	external void set radius(num val);

	/// Define the camera target (the messh it should follow)
	external AbstractMesh get target;
	external void set target(AbstractMesh val);

}

// ### ArcRotateCamera ##############################


/// This represents an orbital type of camera.
/// 
/// This camera always points towards a given target position and can be rotated around that target with the target as the centre of rotation. It can be controlled with cursors and mouse, or with touch events.
/// Think of this camera as one orbiting its target position, or more imaginatively as a spy satellite orbiting the earth. Its position relative to the target (earth) can be set by three parameters, alpha (radians) the longitudinal rotation, beta (radians) the latitudinal rotation and radius the distance from the target position.
/// 
/// see
/// http://doc.babylonjs.com/babylon101/cameras#arc-rotate-camera
@JS()
class ArcRotateCamera extends TargetCamera {
	external ArcRotateCamera(String name, num alpha, num beta, num radius, Vector3 target, Scene scene, [bool setActiveOnSceneIfNoneActive]);

	// ### Member Fields ##############################

	/// Allows the camera to be completely reversed.
	/// If false the camera can not arrive upside down.
	external bool get allowUpsideDown;
	external void set allowUpsideDown(bool val);

	/// Defines the rotation angle of the camera along the longitudinal axis.
	external num get alpha;
	external void set alpha(num val);

	/// Gets or Set the pointer angular sensibility  along the X axis or how fast is the camera rotating.
	external num get angularSensibilityX;

	/// Gets or Set the pointer angular sensibility along the Y axis or how fast is the camera rotating.
	external num get angularSensibilityY;

	/// Gets the auto rotation behavior of the camera if it has been enabled.
	external AutoRotationBehavior get autoRotationBehavior;

	/// Defines the rotation angle of the camera along the latitudinal axis.
	external num get beta;
	external void set beta(num val);

	/// Gets the bouncing behavior of the camera if it has been enabled.
	external BouncingBehavior get bouncingBehavior;

	/// Defines whether the camera should check collision with the objects oh the scene.
	external bool get checkCollisions;
	external void set checkCollisions(bool val);

	/// Defines the collision radius of the camera.
	/// This simulates a sphere around the camera.
	external Vector3 get collisionRadius;
	external void set collisionRadius(Vector3 val);

	/// Gets the framing behavior of the camera if it has been enabled.
	external FramingBehavior get framingBehavior;

	/// Current inertia value on the longitudinal axis.
	/// The bigger this number the longer it will take for the camera to stop.
	external num get inertialAlphaOffset;
	external void set inertialAlphaOffset(num val);

	/// Current inertia value on the latitudinal axis.
	/// The bigger this number the longer it will take for the camera to stop.
	external num get inertialBetaOffset;
	external void set inertialBetaOffset(num val);

	/// Defines the current inertia value used during panning of the camera along the X axis.
	external num get inertialPanningX;
	external void set inertialPanningX(num val);

	/// Defines the current inertia value used during panning of the camera along the Y axis.
	external num get inertialPanningY;
	external void set inertialPanningY(num val);

	/// Current inertia value on the radius axis.
	/// The bigger this number the longer it will take for the camera to stop.
	external num get inertialRadiusOffset;
	external void set inertialRadiusOffset(num val);

	/// Gets or Set the list of keyboard keys used to control beta angle in a negative direction.
	external List<num> get keysDown;

	/// Gets or Set the list of keyboard keys used to control alpha angle in a negative direction.
	external List<num> get keysLeft;

	/// Gets or Set the list of keyboard keys used to control alpha angle in a positive direction.
	external List<num> get keysRight;

	/// Gets or Set the list of keyboard keys used to control beta angle in a positive direction.
	external List<num> get keysUp;

	/// Minimum allowed angle on the longitudinal axis.
	/// This can help limiting how the Camera is able to move in the scene.
	external num get lowerAlphaLimit;
	external void set lowerAlphaLimit(num val);

	/// Minimum allowed angle on the latitudinal axis.
	/// This can help limiting how the Camera is able to move in the scene.
	external num get lowerBetaLimit;
	external void set lowerBetaLimit(num val);

	/// Minimum allowed distance of the camera to the target (The camera can not get closer).
	/// This can help limiting how the Camera is able to move in the scene.
	external num get lowerRadiusLimit;
	external void set lowerRadiusLimit(num val);

	/// Event raised when the camera is colliding with a mesh.
	external Function get onCollide;
	external void set onCollide(Function val);

	/// Observable triggered when the mesh target has been changed on the camera.
	external Observable<AbstractMesh> get onMeshTargetChangedObservable;

	/// Defines the allowed panning axis.
	external Vector3 get panningAxis;
	external void set panningAxis(Vector3 val);

	/// Defines the maximum distance the camera can pan.
	/// This could help keeping the cammera always in your scene.
	external num get panningDistanceLimit;
	external void set panningDistanceLimit(num val);

	/// Defines the value of the inertia used during panning.
	/// 0 would mean stop inertia and one would mean no decelleration at all.
	external num get panningInertia;
	external void set panningInertia(num val);

	/// Defines the target of the camera before paning.
	external Vector3 get panningOriginTarget;
	external void set panningOriginTarget(Vector3 val);

	/// Gets or Set the pointer panning sensibility or how fast is the camera moving.
	external num get panningSensibility;

	/// Gets or Set the pointer pinch delta percentage or how fast is the camera zooming.
	/// It will be used instead of pinchDeltaPrecision if different from 0.
	/// It defines the percentage of current camera.radius to use as delta when pinch zoom is used.
	external num get pinchDeltaPercentage;

	/// Gets or Set the pointer pinch precision or how fast is the camera zooming.
	external num get pinchPrecision;

	/// Defines the distance used to consider the camera in pan mode vs pinch/zoom.
	/// Basically if your fingers moves away from more than this distance you will be considered
	/// in pinch mode.
	external num get pinchToPanMaxDistance;
	external void set pinchToPanMaxDistance(num val);

	/// Defines the radius of the camera from it s target point.
	external num get radius;
	external void set radius(num val);

	/// Defines the target point of the camera.
	/// The camera looks towards it form the radius distance.
	external Vector3 get target;
	external void set target(Vector3 val);

	/// Defines a screen offset for the camera position.
	external Vector2 get targetScreenOffset;
	external void set targetScreenOffset(Vector2 val);

	/// Maximum allowed angle on the longitudinal axis.
	/// This can help limiting how the Camera is able to move in the scene.
	external num get upperAlphaLimit;
	external void set upperAlphaLimit(num val);

	/// Maximum allowed angle on the latitudinal axis.
	/// This can help limiting how the Camera is able to move in the scene.
	external num get upperBetaLimit;
	external void set upperBetaLimit(num val);

	/// Maximum allowed distance of the camera to the target (The camera can not get further).
	/// This can help limiting how the Camera is able to move in the scene.
	external num get upperRadiusLimit;
	external void set upperRadiusLimit(num val);

	/// Defines if the auto rotation behavior of the camera is enabled on the camera.
	external bool get useAutoRotationBehavior;
	external void set useAutoRotationBehavior(bool val);

	/// Defines if the bouncing behavior of the camera is enabled on the camera.
	external bool get useBouncingBehavior;
	external void set useBouncingBehavior(bool val);

	/// Defines if the framing behavior of the camera is enabled on the camera.
	external bool get useFramingBehavior;
	external void set useFramingBehavior(bool val);

	/// Define if double tap/click is used to restore the previously saved state of the camera.
	external bool get useInputToRestoreState;
	external void set useInputToRestoreState(bool val);

	/// Gets or Set the mouse wheel delta percentage or how fast is the camera zooming.
	/// It will be used instead of pinchDeltaPrecision if different from 0.
	/// It defines the percentage of current camera.radius to use as delta when pinch zoom is used.
	external num get wheelDeltaPercentage;

	/// Gets or Set the mouse wheel precision or how fast is the camera zooming.
	external num get wheelPrecision;

	/// Defines how much the radius should be scaled while zomming on a particular mesh (through the zoomOn function)
	external num get zoomOnFactor;
	external void set zoomOnFactor(num val);

	// ### Member Methods ##############################

	/// Focus on a mesh or a bounding box. This adapts the target and maxRadius if necessary but does not update the current radius.
	/// The target will be changed but the radius
	external void focusOn(dynamic meshesOrMinMaxVectorAndDistance, [bool doNotUpdateMaxZ]); // TODO: Type union: [AbstractMesh[] | object]

	/// Rebuilds angles (alpha, beta) and radius from the give position and target.
	external void rebuildAnglesAndRadius();

	/// Use a position to define the current camera related information like aplha, beta and radius
	external void setPosition(Vector3 position);

	/// Zooms on a mesh to be at the min distance where we could see it fully in the current viewport.
	external void zoomOn([List<AbstractMesh> meshes, bool doNotUpdateMaxZ]);

}

// ### ArcRotateCameraGamepadInput ##############################


/// Manage the gamepad inputs to control an arc rotate camera.
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/customizing_camera_inputs
@JS()
class ArcRotateCameraGamepadInput {
	// ### Member Fields ##############################

	/// Defines the camera the input is attached to.
	external ArcRotateCamera get camera;
	external void set camera(ArcRotateCamera val);

	/// Defines the gamepad the input is gathering event from.
	external Gamepad get gamepad;
	external void set gamepad(Gamepad val);

	/// Defines the gamepad move sensiblity.
	/// This is the threshold from when moving starts to be accounted for for to prevent jittering.
	external num get gamepadMoveSensibility;
	external void set gamepadMoveSensibility(num val);

	/// Defines the gamepad rotation sensiblity.
	/// This is the threshold from when rotation starts to be accounted for to prevent jittering.
	external num get gamepadRotationSensibility;
	external void set gamepadRotationSensibility(num val);

	// ### Member Methods ##############################

	/// Attach the input controls to a specific dom element to get the input from.
	external void attachControl(HTML.Element element, [bool noPreventDefault]);

	/// Update the current camera state depending on the inputs that have been used this frame.
	/// This is a dynamically created lambda to avoid the performance penalty of looping for inputs in the render loop.
	external void checkInputs();

	/// Detach the current controls from the specified dom element.
	external void detachControl(HTML.Element element);

	/// Gets the class name of the current intput.
	external String getClassName();

	/// Get the friendly name associated with the input class.
	external String getSimpleName();

}

// ### ArcRotateCameraInputsManager ##############################


/// Default Inputs manager for the ArcRotateCamera.
/// It groups all the default supported inputs for ease of use.
/// Interface representing an arc rotate camera inputs manager
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/customizing_camera_inputs
@JS()
class ArcRotateCameraInputsManager extends CameraInputsManager {
	external ArcRotateCameraInputsManager(ArcRotateCamera camera);

	// ### Member Methods ##############################

	/// Adds gamepad input support to the ArcRotateCamera InputManager.
	external ArcRotateCameraInputsManager addGamepad();

	/// Add keyboard input support to the input manager.
	external ArcRotateCameraInputsManager addKeyboard();

	/// Add mouse wheel input support to the input manager.
	external ArcRotateCameraInputsManager addMouseWheel();

	/// Add pointers input support to the input manager.
	external ArcRotateCameraInputsManager addPointers();

	/// Add orientation input support to the input manager.
	external ArcRotateCameraInputsManager addVRDeviceOrientation();

}

// ### ArcRotateCameraKeyboardMoveInput ##############################


/// Manage the keyboard inputs to control the movement of an arc rotate camera.
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/customizing_camera_inputs
@JS()
class ArcRotateCameraKeyboardMoveInput {
	// ### Member Fields ##############################

	/// Rotation speed of the camera
	external num get angularSpeed;
	external void set angularSpeed(num val);

	/// Defines the camera the input is attached to.
	external ArcRotateCamera get camera;
	external void set camera(ArcRotateCamera val);

	/// Defines the list of key codes associated with the down action (decrease alpha)
	external List<num> get keysDown;
	external void set keysDown(List<num> val);

	/// Defines the list of key codes associated with the left action (increase beta)
	external List<num> get keysLeft;
	external void set keysLeft(List<num> val);

	/// Defines the list of key codes associated with the reset action.
	/// Those keys reset the camera to its last stored state (with the method camera.storeState())
	external List<num> get keysReset;
	external void set keysReset(List<num> val);

	/// Defines the list of key codes associated with the right action (decrease beta)
	external List<num> get keysRight;
	external void set keysRight(List<num> val);

	/// Defines the list of key codes associated with the up action (increase alpha)
	external List<num> get keysUp;
	external void set keysUp(List<num> val);

	/// Defines the panning sensibility of the inputs.
	/// (How fast is the camera paning)
	external num get panningSensibility;
	external void set panningSensibility(num val);

	/// Defines wether maintaining the alt key down switch the movement mode from
	/// orientation to zoom.
	external bool get useAltToZoom;
	external void set useAltToZoom(bool val);

	/// Defines the zooming sensibility of the inputs.
	/// (How fast is the camera zooming)
	external num get zoomingSensibility;
	external void set zoomingSensibility(num val);

	// ### Member Methods ##############################

	/// Attach the input controls to a specific dom element to get the input from.
	external void attachControl(HTML.Element element, [bool noPreventDefault]);

	/// Update the current camera state depending on the inputs that have been used this frame.
	/// This is a dynamically created lambda to avoid the performance penalty of looping for inputs in the render loop.
	external void checkInputs();

	/// Detach the current controls from the specified dom element.
	external void detachControl(HTML.Element element);

	/// Gets the class name of the current intput.
	external String getClassName();

	/// Get the friendly name associated with the input class.
	external String getSimpleName();

}

// ### ArcRotateCameraMouseWheelInput ##############################


/// Manage the mouse wheel inputs to control an arc rotate camera.
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/customizing_camera_inputs
@JS()
class ArcRotateCameraMouseWheelInput {
	// ### Member Fields ##############################

	/// Defines the camera the input is attached to.
	external ArcRotateCamera get camera;
	external void set camera(ArcRotateCamera val);

	/// wheelDeltaPercentage will be used instead of wheelPrecision if different from 0.
	/// It defines the percentage of current camera.radius to use as delta when wheel is used.
	external num get wheelDeltaPercentage;
	external void set wheelDeltaPercentage(num val);

	/// Gets or Set the mouse wheel precision or how fast is the camera zooming.
	external num get wheelPrecision;

	// ### Member Methods ##############################

	/// Attach the input controls to a specific dom element to get the input from.
	external void attachControl(HTML.Element element, [bool noPreventDefault]);

	/// Detach the current controls from the specified dom element.
	external void detachControl(HTML.Element element);

	/// Gets the class name of the current intput.
	external String getClassName();

	/// Get the friendly name associated with the input class.
	external String getSimpleName();

}

// ### DeviceOrientationCamera ##############################


/// This is a camera specifically designed to react to device orientation events such as a modern mobile device
/// being tilted forward or back and left or right.
@JS()
class DeviceOrientationCamera extends FreeCamera {
	external DeviceOrientationCamera(String name, Vector3 position, Scene scene);

	// ### Member Methods ##############################

	/// Reset the camera to its default orientation on the specified axis only.
	external void resetToCurrentRotation([Axis axis]);

}

// ### FlyCamera ##############################


/// This is a flying camera, designed for 3D movement and rotation in all directions,
/// such as in a 3D Space Shooter or a Flight Simulator.
@JS()
class FlyCamera extends TargetCamera {
	external FlyCamera(String name, Vector3 position, Scene scene, [bool setActiveOnSceneIfNoneActive]);

	// ### Member Fields ##############################

	/// Sets the input sensibility for a mouse input.
	/// Higher values reduce sensitivity.
	external num get angularSensibility;
	external void set angularSensibility(num val);

	/// Enable or disable gravity on the camera.
	external bool get applyGravity;
	external void set applyGravity(bool val);

	/// Mimic a banked turn, Rolling the camera when Yawing.
	/// It's recommended to use rollCorrect = 10 for faster banking correction.
	external bool get bankedTurn;
	external void set bankedTurn(bool val);

	/// Limit in radians for how much Roll banking will add. (Default: 90°)
	external num get bankedTurnLimit;
	external void set bankedTurnLimit(num val);

	/// Value of 0 disables the banked Roll.
	/// Value of 1 is equal to the Yaw angle in radians.
	external num get bankedTurnMultiplier;
	external void set bankedTurnMultiplier(num val);

	/// Enable or disable collisions of the camera with the rest of the scene objects.
	external bool get checkCollisions;
	external void set checkCollisions(bool val);

	/// Set the mask that the camera ignores in collision events.
	external num get collisionMask;
	external void set collisionMask(num val);

	/// Define the collision ellipsoid of the camera.
	/// This is helpful for simulating a camera body, like a player's body.
	external Vector3 get ellipsoid;
	external void set ellipsoid(Vector3 val);

	/// Define an offset for the position of the ellipsoid around the camera.
	/// This can be helpful if the camera is attached away from the player's body center,
	/// such as at its head.
	external Vector3 get ellipsoidOffset;
	external void set ellipsoidOffset(Vector3 val);

	/// Get the keys for camera movement backward.
	external List<num> get keysBackward;
	external void set keysBackward(List<num> val);

	/// Set the keys for camera movement down.
	external List<num> get keysDown;
	external void set keysDown(List<num> val);

	/// Set the keys for camera movement forward.
	external List<num> get keysForward;
	external void set keysForward(List<num> val);

	/// Set the keys for camera movement left.
	external List<num> get keysLeft;
	external void set keysLeft(List<num> val);

	/// Set the keys for camera movement right.
	external List<num> get keysRight;
	external void set keysRight(List<num> val);

	/// Set the keys for camera movement up.
	external List<num> get keysUp;
	external void set keysUp(List<num> val);

	/// Event raised when the camera collides with a mesh in the scene.
	external Function get onCollide;
	external void set onCollide(Function val);

	/// Slowly correct the Roll to its original value after a Pitch+Yaw rotation.
	external num get rollCorrect;
	external void set rollCorrect(num val);

}

// ### FlyCameraInputsManager ##############################


/// Default Inputs manager for the FlyCamera.
/// It groups all the default supported inputs for ease of use.
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/customizing_camera_inputs
@JS()
class FlyCameraInputsManager extends CameraInputsManager {
	external FlyCameraInputsManager(FlyCamera camera);

	// ### Member Methods ##############################

	/// Add keyboard input support to the input manager.
	external FlyCameraInputsManager addKeyboard();

	/// Add mouse input support to the input manager.
	external FlyCameraInputsManager addMouse([bool touchEnabled]);

}

// ### FlyCameraKeyboardInput ##############################


/// Listen to keyboard events to control the camera.
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/customizing_camera_inputs
@JS()
class FlyCameraKeyboardInput {
	// ### Member Fields ##############################

	/// Defines the camera the input is attached to.
	external FlyCamera get camera;
	external void set camera(FlyCamera val);

	/// The list of keyboard keys used to control the backward move of the camera.
	external List<num> get keysBackward;
	external void set keysBackward(List<num> val);

	/// The list of keyboard keys used to control the backward move of the camera.
	external List<num> get keysDown;
	external void set keysDown(List<num> val);

	/// The list of keyboard keys used to control the forward move of the camera.
	external List<num> get keysForward;
	external void set keysForward(List<num> val);

	/// The list of keyboard keys used to control the left strafe move of the camera.
	external List<num> get keysLeft;
	external void set keysLeft(List<num> val);

	/// The list of keyboard keys used to control the right strafe move of the camera.
	external List<num> get keysRight;
	external void set keysRight(List<num> val);

	/// The list of keyboard keys used to control the forward move of the camera.
	external List<num> get keysUp;
	external void set keysUp(List<num> val);

	// ### Member Methods ##############################

	/// Attach the input controls to a specific dom element to get the input from.
	external void attachControl(HTML.Element element, [bool noPreventDefault]);

	/// Update the current camera state depending on the inputs that have been used this frame.
	/// This is a dynamically created lambda to avoid the performance penalty of looping for inputs in the render loop.
	external void checkInputs();

	/// Detach the current controls from the specified dom element.
	external void detachControl(HTML.Element element);

	/// Gets the class name of the current intput.
	external String getClassName();

	/// Get the friendly name associated with the input class.
	external String getSimpleName();

}

// ### FlyCameraMouseInput ##############################


/// Listen to mouse events to control the camera.
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/customizing_camera_inputs
@JS()
class FlyCameraMouseInput {
	external FlyCameraMouseInput([bool touchEnabled]);

	// ### Member Fields ##############################

	/// Detect if any button is being pressed while mouse is moved.
	/// -1 = Mouse locked.
	/// 0 = Left button.
	/// 1 = Middle Button.
	/// 2 = Right Button.
	external num get activeButton;
	external void set activeButton(num val);

	/// Defines the pointer's angular sensibility, to control the camera rotation speed.
	/// Higher values reduce its sensitivity.
	external num get angularSensibility;
	external void set angularSensibility(num val);

	/// Defines the buttons associated with the input to handle camera rotation.
	external List<num> get buttons;
	external void set buttons(List<num> val);

	/// Assign buttons for Pitch control.
	external List<num> get buttonsPitch;
	external void set buttonsPitch(List<num> val);

	/// Assign buttons for Roll control.
	external List<num> get buttonsRoll;
	external void set buttonsRoll(List<num> val);

	/// Assign buttons for Yaw control.
	external List<num> get buttonsYaw;
	external void set buttonsYaw(List<num> val);

	/// Defines the camera the input is attached to.
	external FlyCamera get camera;
	external void set camera(FlyCamera val);

	/// Defines if touch is enabled. (Default is true.)
	external bool get touchEnabled;
	external void set touchEnabled(bool val);

	// ### Member Methods ##############################

	/// Attach the mouse control to the HTML DOM element.
	external void attachControl(HTML.Element element, [bool noPreventDefault]);

	/// Detach the current controls from the specified dom element.
	external void detachControl(HTML.Element element);

	/// Gets the class name of the current input.
	external String getClassName();

	/// Get the friendly name associated with the input class.
	external String getSimpleName();

}

// ### FollowCamera ##############################


/// A follow camera takes a mesh as a target and follows it as it moves. Both a free camera version followCamera and
/// an arc rotate version arcFollowCamera are available.
/// 
/// 
/// see
/// http://doc.babylonjs.com/features/cameras#follow-camera
@JS()
class FollowCamera extends TargetCamera {
	external FollowCamera(String name, Vector3 position, Scene scene, [AbstractMesh lockedTarget]);

	// ### Member Fields ##############################

	/// Define how fast the camera can accelerate to follow it s target.
	external num get cameraAcceleration;
	external void set cameraAcceleration(num val);

	/// Define a height offset between the camera and the object it follows.
	/// It can help following an object from the top (like a car chaing a plane)
	external num get heightOffset;
	external void set heightOffset(num val);

	/// Define the speed limit of the camera following an object.
	external num get maxCameraSpeed;
	external void set maxCameraSpeed(num val);

	/// Distance the follow camera should follow an object at
	external num get radius;
	external void set radius(num val);

	/// Define a rotation offset between the camera and the object it follows
	external num get rotationOffset;
	external void set rotationOffset(num val);

}

// ### FreeCamera ##############################


/// This represents a free type of camera. It can be useful in First Person Shooter game for instance.
/// Please consider using the new UniversalCamera instead as it adds more functionality like the gamepad.
/// 
/// 
/// see
/// http://doc.babylonjs.com/features/cameras#universal-camera
@JS()
class FreeCamera extends TargetCamera {
	external FreeCamera(String name, Vector3 position, Scene scene, [bool setActiveOnSceneIfNoneActive]);

	// ### Member Fields ##############################

	/// Sets the input sensibility for a mouse input. (default is 2000.0)
	/// Higher values reduce sensitivity.
	external num get angularSensibility;
	external void set angularSensibility(num val);

	/// Enable or disable gravity on the camera.
	external bool get applyGravity;
	external void set applyGravity(bool val);

	/// Enable or disable collisions of the camera with the rest of the scene objects.
	external bool get checkCollisions;
	external void set checkCollisions(bool val);

	/// Define a collision mask to limit the list of object the camera can collide with
	external num get collisionMask;
	external void set collisionMask(num val);

	/// Define the collision ellipsoid of the camera.
	/// This is helpful to simulate a camera body like the player body around the camera
	external Vector3 get ellipsoid;
	external void set ellipsoid(Vector3 val);

	/// Define an offset for the position of the ellipsoid around the camera.
	/// This can be helpful to determine the center of the body near the gravity center of the body
	/// instead of its head.
	external Vector3 get ellipsoidOffset;
	external void set ellipsoidOffset(Vector3 val);

	/// Gets or Set the list of keyboard keys used to control the backward move of the camera.
	external List<num> get keysDown;

	/// Gets or Set the list of keyboard keys used to control the left strafe move of the camera.
	external List<num> get keysLeft;

	/// Gets or Set the list of keyboard keys used to control the right strafe move of the camera.
	external List<num> get keysRight;

	/// Gets or Set the list of keyboard keys used to control the forward move of the camera.
	external List<num> get keysUp;

	/// Event raised when the camera collide with a mesh in the scene.
	external Function get onCollide;
	external void set onCollide(Function val);

}

// ### FreeCameraDeviceOrientationInput ##############################


/// Takes information about the orientation of the device as reported by the deviceorientation event to orient the camera.
/// Screen rotation is taken into account.
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/customizing_camera_inputs
@JS()
class FreeCameraDeviceOrientationInput {
	external FreeCameraDeviceOrientationInput();

	// ### Member Fields ##############################

	/// Define the camera controlled by the input.
	external FreeCamera get camera;
	external void set camera(FreeCamera val);

	// ### Member Methods ##############################

	/// Attach the input controls to a specific dom element to get the input from.
	external void attachControl(HTML.Element element, [bool noPreventDefault]);

	/// Update the current camera state depending on the inputs that have been used this frame.
	/// This is a dynamically created lambda to avoid the performance penalty of looping for inputs in the render loop.
	external void checkInputs();

	/// Detach the current controls from the specified dom element.
	external void detachControl(HTML.Element element);

	/// Gets the class name of the current intput.
	external String getClassName();

	/// Get the friendly name associated with the input class.
	external String getSimpleName();

}

// ### FreeCameraGamepadInput ##############################


/// Manage the gamepad inputs to control a free camera.
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/customizing_camera_inputs
@JS()
class FreeCameraGamepadInput {
	// ### Member Fields ##############################

	/// Define the camera the input is attached to.
	external FreeCamera get camera;
	external void set camera(FreeCamera val);

	/// Define the Gamepad controlling the input
	external Gamepad get gamepad;
	external void set gamepad(Gamepad val);

	/// Defines the gamepad rotation sensiblity.
	/// This is the threshold from when rotation starts to be accounted for to prevent jittering.
	external num get gamepadAngularSensibility;
	external void set gamepadAngularSensibility(num val);

	/// Defines the gamepad move sensiblity.
	/// This is the threshold from when moving starts to be accounted for for to prevent jittering.
	external num get gamepadMoveSensibility;
	external void set gamepadMoveSensibility(num val);

	// ### Member Methods ##############################

	/// Attach the input controls to a specific dom element to get the input from.
	external void attachControl(HTML.Element element, [bool noPreventDefault]);

	/// Update the current camera state depending on the inputs that have been used this frame.
	/// This is a dynamically created lambda to avoid the performance penalty of looping for inputs in the render loop.
	external void checkInputs();

	/// Detach the current controls from the specified dom element.
	external void detachControl(HTML.Element element);

	/// Gets the class name of the current intput.
	external String getClassName();

	/// Get the friendly name associated with the input class.
	external String getSimpleName();

}

// ### FreeCameraInputsManager ##############################


/// Default Inputs manager for the FreeCamera.
/// It groups all the default supported inputs for ease of use.
/// Interface representing a free camera inputs manager
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/customizing_camera_inputs
@JS()
class FreeCameraInputsManager extends CameraInputsManager {
	external FreeCameraInputsManager(FreeCamera camera);

	// ### Member Methods ##############################

	/// Add orientation input support to the input manager.
	external FreeCameraInputsManager addDeviceOrientation();

	/// Adds gamepad input support to the FreeCameraInputsManager.
	external FreeCameraInputsManager addGamepad();

	/// Add keyboard input support to the input manager.
	external FreeCameraInputsManager addKeyboard();

	/// Add mouse input support to the input manager.
	external FreeCameraInputsManager addMouse([bool touchEnabled]);

	/// Add touch input support to the input manager.
	external FreeCameraInputsManager addTouch();

	/// Add virtual joystick input support to the input manager.
	external FreeCameraInputsManager addVirtualJoystick();

}

// ### FreeCameraKeyboardMoveInput ##############################


/// Manage the keyboard inputs to control the movement of a free camera.
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/customizing_camera_inputs
@JS()
class FreeCameraKeyboardMoveInput {
	// ### Member Fields ##############################

	/// Defines the camera the input is attached to.
	external FreeCamera get camera;
	external void set camera(FreeCamera val);

	/// Gets or Set the list of keyboard keys used to control the backward move of the camera.
	external List<num> get keysDown;

	/// Gets or Set the list of keyboard keys used to control the left strafe move of the camera.
	external List<num> get keysLeft;

	/// Gets or Set the list of keyboard keys used to control the right strafe move of the camera.
	external List<num> get keysRight;

	/// Gets or Set the list of keyboard keys used to control the forward move of the camera.
	external List<num> get keysUp;

	// ### Member Methods ##############################

	/// Attach the input controls to a specific dom element to get the input from.
	external void attachControl(HTML.Element element, [bool noPreventDefault]);

	/// Update the current camera state depending on the inputs that have been used this frame.
	/// This is a dynamically created lambda to avoid the performance penalty of looping for inputs in the render loop.
	external void checkInputs();

	/// Detach the current controls from the specified dom element.
	external void detachControl(HTML.Element element);

	/// Gets the class name of the current intput.
	external String getClassName();

	/// Get the friendly name associated with the input class.
	external String getSimpleName();

}

// ### FreeCameraMouseInput ##############################


/// Manage the mouse inputs to control the movement of a free camera.
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/customizing_camera_inputs
@JS()
class FreeCameraMouseInput {
	external FreeCameraMouseInput([bool touchEnabled]);

	// ### Member Fields ##############################

	/// Defines the pointer angular sensibility  along the X and Y axis or how fast is the camera rotating.
	external num get angularSensibility;
	external void set angularSensibility(num val);

	/// Defines the buttons associated with the input to handle camera move.
	external List<num> get buttons;
	external void set buttons(List<num> val);

	/// Defines the camera the input is attached to.
	external FreeCamera get camera;
	external void set camera(FreeCamera val);

	/// Define if touch is enabled in the mouse input
	external bool get touchEnabled;
	external void set touchEnabled(bool val);

	// ### Member Methods ##############################

	/// Attach the input controls to a specific dom element to get the input from.
	external void attachControl(HTML.Element element, [bool noPreventDefault]);

	/// Detach the current controls from the specified dom element.
	external void detachControl(HTML.Element element);

	/// Gets the class name of the current intput.
	external String getClassName();

	/// Get the friendly name associated with the input class.
	external String getSimpleName();

}

// ### FreeCameraTouchInput ##############################


/// Manage the touch inputs to control the movement of a free camera.
/// 
/// 
/// see
/// http://doc.babylonjs.com/how_to/customizing_camera_inputs
@JS()
class FreeCameraTouchInput {
	// ### Member Fields ##############################

	/// Defines the camera the input is attached to.
	external FreeCamera get camera;
	external void set camera(FreeCamera val);

	/// Defines the touch sensibility for rotation.
	/// The higher the faster.
	external num get touchAngularSensibility;
	external void set touchAngularSensibility(num val);

	/// Defines the touch sensibility for move.
	/// The higher the faster.
	external num get touchMoveSensibility;
	external void set touchMoveSensibility(num val);

	// ### Member Methods ##############################

	/// Attach the input controls to a specific dom element to get the input from.
	external void attachControl(HTML.Element element, [bool noPreventDefault]);

	/// Update the current camera state depending on the inputs that have been used this frame.
	/// This is a dynamically created lambda to avoid the performance penalty of looping for inputs in the render loop.
	external void checkInputs();

	/// Detach the current controls from the specified dom element.
	external void detachControl(HTML.Element element);

	/// Gets the class name of the current intput.
	external String getClassName();

	/// Get the friendly name associated with the input class.
	external String getSimpleName();

}

// ### GamepadCamera ##############################


/// This represents a FPS type of camera. This is only here for back compat purpose.
/// Please use the UniversalCamera instead as both are identical.
/// 
/// 
/// see
/// http://doc.babylonjs.com/features/cameras#universal-camera
@JS()
class GamepadCamera extends UniversalCamera {
	external GamepadCamera(String name, Vector3 position, Scene scene);

}

// ### TargetCamera ##############################


/// A target camera takes a mesh or position as a target and continues to look at it while it moves.
/// This is the base of the follow, arc rotate cameras and Free camera
/// 
/// 
/// see
/// http://doc.babylonjs.com/features/cameras
@JS()
class TargetCamera extends Camera {
	external TargetCamera(String name, Vector3 position, Scene scene, [bool setActiveOnSceneIfNoneActive]);

	// ### Member Fields ##############################

	/// Define the current direction the camera is moving to
	external Vector3 get cameraDirection;
	external void set cameraDirection(Vector3 val);

	/// Define the current rotation the camera is rotating to
	external Vector2 get cameraRotation;
	external void set cameraRotation(Vector2 val);

	/// Define the current target of the camera as an object or a position.
	external dynamic get lockedTarget;
	external void set lockedTarget(dynamic val);

	/// Add cconstraint to the camera to prevent it to move freely in all directions and
	/// around all axis.
	external bool get noRotationConstraint;
	external void set noRotationConstraint(bool val);

	/// Define the current rotation of the camera
	external Vector3 get rotation;
	external void set rotation(Vector3 val);

	/// Define the current rotation of the camera as a quaternion to prevent Gimbal lock
	external Quaternion get rotationQuaternion;
	external void set rotationQuaternion(Quaternion val);

	/// Define the current speed of the camera
	external num get speed;
	external void set speed(num val);

	/// When set, the up vector of the camera will be updated by the rotation of the camera
	external bool get updateUpVectorFromRotation;
	external void set updateUpVectorFromRotation(bool val);

	// ### Member Methods ##############################

	/// Gets the position in front of the camera at a given distance.
	external Vector3 getFrontPosition(num distance);

	/// Return the current target position of the camera. This value is expressed in local space.
	external Vector3 getTarget();

}

// ### TouchCamera ##############################


/// This represents a FPS type of camera controlled by touch.
/// This is like a universal camera minus the Gamepad controls.
/// 
/// 
/// see
/// http://doc.babylonjs.com/features/cameras#universal-camera
@JS()
class TouchCamera extends FreeCamera {
	external TouchCamera(String name, Vector3 position, Scene scene);

	// ### Member Fields ##############################

	/// Defines the touch sensibility for rotation.
	/// The higher the faster.
	external num get touchAngularSensibility;
	external void set touchAngularSensibility(num val);

	/// Defines the touch sensibility for move.
	/// The higher the faster.
	external num get touchMoveSensibility;
	external void set touchMoveSensibility(num val);

}

// ### UniversalCamera ##############################


/// The Universal Camera is the one to choose for first person shooter type games, and works with all the keyboard, mouse, touch and gamepads. This replaces the earlier Free Camera,
/// which still works and will still be found in many Playgrounds.
/// 
/// 
/// see
/// http://doc.babylonjs.com/features/cameras#universal-camera
@JS()
class UniversalCamera extends TouchCamera {
	external UniversalCamera(String name, Vector3 position, Scene scene);

	// ### Member Fields ##############################

	/// Defines the gamepad rotation sensiblity.
	/// This is the threshold from when rotation starts to be accounted for to prevent jittering.
	external num get gamepadAngularSensibility;
	external void set gamepadAngularSensibility(num val);

	/// Defines the gamepad move sensiblity.
	/// This is the threshold from when moving starts to be accounted for for to prevent jittering.
	external num get gamepadMoveSensibility;
	external void set gamepadMoveSensibility(num val);

}


