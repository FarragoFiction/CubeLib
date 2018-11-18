part of Babylon;


/// Node is the basic class for all scene objects (Mesh, Light, Camera.)
@JS()
class Node {
	external Node(String name, [Scene scene, bool addToRootNodes]);

	// ### Member Fields ##############################

	/// Gets or sets the animation properties override
	external AnimationPropertiesOverride get animationPropertiesOverride;
	external void set animationPropertiesOverride(AnimationPropertiesOverride val);

	/// Gets a list of Animations associated with the node
	external List<Animation> get animations;

	/// Gets the list of attached behaviors
	external List<Behavior<Node>> get behaviors;

	/// Gets or sets a boolean used to define if the node must be serialized
	external bool get doNotSerialize;
	external void set doNotSerialize(bool val);

	/// Gets or sets the id of the node
	external String get id;
	external void set id(String val);

	/// Gets or sets an object used to store user defined information for the node
	external dynamic get metadata;
	external void set metadata(dynamic val);

	/// Gets or sets the name of the node
	external String get name;
	external void set name(String val);

	/// Sets a callback that will be raised when the node will be disposed
	external Function get onDispose;
	external void set onDispose(Function val);

	/// An event triggered when the mesh is disposed
	external Observable<Node> get onDisposeObservable;

	/// Callback raised when the node is ready to be used
	external Function get onReady;
	external void set onReady(Function val);

	/// Gets or sets the parent of the node
	external Node get parent;
	external void set parent(Node val);

	/// For internal use only. Please do not use.
	external dynamic get reservedDataStore;
	external void set reservedDataStore(dynamic val);

	/// Gets or sets a string used to store user defined state for the node
	external String get state;
	external void set state(String val);

	/// Gets or sets the unique id of the node
	external num get uniqueId;
	external void set uniqueId(num val);

	/// Returns directly the latest state of the mesh World matrix.
	/// A Matrix is returned.
	external Matrix get worldMatrixFromCache;
	external void set worldMatrixFromCache(Matrix val);

	// ### Member Methods ##############################

	/// Attach a behavior to the node
	external Node addBehavior(Behavior<Node> behavior, [bool attachImmediately]);

	/// Will start the animation sequence
	external Animatable beginAnimation(String name, [bool loop, num speedRatio, Function onAnimationEnd]);

	/// Computes the world matrix of the node
	external Matrix computeWorldMatrix([bool force]);

	/// Creates an animation range for this node
	external void createAnimationRange(String name, num from, num to);

	/// Delete a specific animation range
	external void deleteAnimationRange(String name, [bool deleteFrames]);

	/// Releases resources associated with this node.
	external void dispose([bool doNotRecurse, bool disposeMaterialAndTextures]);

	/// Get an animation by name
	external Animation getAnimationByName(String name);

	/// Get an animation range by name
	external AnimationRange getAnimationRange(String name);

	/// Gets an attached behavior by name
	external Behavior<Node> getBehaviorByName(String name);

	/// Get all child-meshes of this node
	external List<AbstractMesh> getChildMeshes([bool directDescendantsOnly, Function predicate]);

	/// Get all child-transformNodes of this node
	external List<TransformNode> getChildTransformNodes([bool directDescendantsOnly, Function predicate]);

	/// Get all direct children of this node
	external List<Node> getChildren([Function predicate, bool directDescendantsOnly]);

	/// Gets a string idenfifying the name of the class
	external String getClassName();

	/// Will return all nodes that have this node as ascendant
	external List<Node> getDescendants([bool directDescendantsOnly, Function predicate]);

	/// Gets the engine of the node
	external Engine getEngine();

	/// Gets the scene of the node
	external Scene getScene();

	/// Returns the latest update of the World matrix
	external Matrix getWorldMatrix();

	/// Is this node a descendant of the given node?
	/// The function will iterate up the hierarchy until the ancestor was found or no more parents defined
	external bool isDescendantOf(Node ancestor);

	/// Gets a boolean indicating if the node has been disposed
	external bool isDisposed();

	/// Is this node enabled?
	/// If the node has a parent, all ancestors will be checked and false will be returned if any are false (not enabled), otherwise will return true
	external bool isEnabled([bool checkAncestors]);

	/// Is this node ready to be used/rendered
	external bool isReady([bool completeCheck]);

	/// Remove an attached behavior
	external Node removeBehavior(Behavior<Node> behavior);

	/// Serialize animation ranges into a JSON compatible object
	external dynamic serializeAnimationRanges();

	/// Set the enabled state of this node
	external void setEnabled(bool value);

	// ### Static Methods ##############################

	/// Add a new node constructor
	external static void AddNodeConstructor(String type, NodeConstructor constructorFunc);

	/// Returns a node constructor based on type name
	external static Function Construct(String type, String name, Scene scene, [dynamic options]);

	/// Parse animation range data from a serialization object and store them into a given node
	external static void ParseAnimationRanges(Node node, dynamic parsedNode, Scene scene);
}


