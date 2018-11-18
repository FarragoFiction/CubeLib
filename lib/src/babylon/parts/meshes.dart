part of Babylon;

// ### AbstractMesh ##############################


/// Class used to store all common mesh properties
@JS()
class AbstractMesh extends TransformNode {
	external AbstractMesh(String name, [Scene scene]);

	// ### Member Fields ##############################

	/// Gets or sets the current action manager
	external ActionManager get actionManager;
	external void set actionManager(ActionManager val);

	/// Gets or sets the alpha index used to sort transparent meshes
	external num get alphaIndex;
	external void set alphaIndex(num val);

	/// True if the mesh must be rendered in any case (this will shortcut the frustum clipping phase)
	external bool get alwaysSelectAsActiveMesh;
	external void set alwaysSelectAsActiveMesh(bool val);

	/// Gets or sets a boolean indicating that this mesh will allow fog to be rendered on it (true by default)
	external bool get applyFog;
	external void set applyFog(bool val);

	/// Gets or sets a boolean indicating that this mesh can be used in the collision engine
	external bool get checkCollisions;
	external void set checkCollisions(bool val);

	/// Gets Collider object used to compute collisions (not physics)
	external Collider get collider;

	/// Gets or sets the current collision group mask (-1 by default).
	/// A collision between A and B will happen if A.collisionGroup & b.collisionMask !== 0
	external num get collisionGroup;
	external void set collisionGroup(num val);

	/// Gets or sets a collision mask used to mask collisions (default is -1).
	/// A collision between A and B will happen if A.collisionGroup & b.collisionMask !== 0
	external num get collisionMask;
	external void set collisionMask(num val);

	/// Gets or sets a boolean indicating that bone animations must be computed by the CPU (false by default)
	external bool get computeBonesUsingShaders;
	external void set computeBonesUsingShaders(bool val);

	/// Gets ot sets the culling strategy to use to find visible meshes
	external num get cullingStrategy;

	/// Gets or sets the orientation for POV movement & rotation
	external bool get definedFacingForward;
	external void set definedFacingForward(bool val);

	/// Defines edge color used when edgesRenderer is enabled
	external Color4 get edgesColor;
	external void set edgesColor(Color4 val);

	/// Gets the edgesRenderer associated with the mesh
	external EdgesRenderer get edgesRenderer;

	/// Defines edge width used when edgesRenderer is enabled
	external num get edgesWidth;
	external void set edgesWidth(num val);

	/// Gets or sets the ellipsoid used to impersonate this mesh when using collision engine (default is (0.5, 1, 0.5))
	external Vector3 get ellipsoid;
	external void set ellipsoid(Vector3 val);

	/// Gets or sets the ellipsoid offset used to impersonate this mesh when using collision engine (default is (0, 0, 0))
	external Vector3 get ellipsoidOffset;
	external void set ellipsoidOffset(Vector3 val);

	/// Gets or sets a boolean indicating that pointer move events must be supported on this mesh (false by default)
	external bool get enablePointerMoveEvents;
	external void set enablePointerMoveEvents(bool val);

	/// The location (Vector3) where the facet depth sort must be computed from.
	/// By default, the active camera position.
	/// Used only when facet depth sort is enabled
	external Vector3 get facetDepthSortFrom;
	external void set facetDepthSortFrom(Vector3 val);

	/// Gets the number of facets in the mesh
	external num get facetNb;

	/// Gets or sets a boolean indicating that this mesh contains vertex color data with alpha values
	external bool get hasVertexAlpha;
	external void set hasVertexAlpha(bool val);

	/// Returns true if the mesh is blocked. Implemented by child classes
	external bool get isBlocked;
	external void set isBlocked(bool val);

	/// Gets or sets a boolean indicating if the mesh must be considered as a ray blocker for lens flares (false by default)
	external bool get isBlocker;
	external void set isBlocker(bool val);

	/// gets a boolean indicating if facetData is enabled
	external bool get isFacetDataEnabled;

	/// Gets or sets whether the mesh is occluded or not, it is used also to set the intial state of the mesh to be occluded or not
	external bool get isOccluded;
	external void set isOccluded(bool val);

	/// Flag to check the progress status of the query
	external bool get isOcclusionQueryInProgress;
	external void set isOcclusionQueryInProgress(bool val);

	/// Gets or sets a boolean indicating if the mesh can be picked (by scene.pick for instance or through actions). Default is true
	external bool get isPickable;
	external void set isPickable(bool val);

	/// Gets or sets a boolean indicating if the mesh is visible (renderable). Default is true
	external bool get isVisible;
	external void set isVisible(bool val);

	/// Gets or sets the current layer mask (default is 0x0FFFFFFF)
	external num get layerMask;
	external void set layerMask(num val);

	/// Gets or sets current material
	external Material get material;
	external void set material(Material val);

	/// Gets or sets a boolean indicating that the facets must be depth sorted on next call to updateFacetData().
	/// Works only for updatable meshes.
	/// Doesn't work with multi-materials
	external bool get mustDepthSortFacets;
	external void set mustDepthSortFacets(bool val);

	/// Gets or sets the number of allowed bone influences per vertex (4 by default)
	external num get numBoneInfluencers;
	external void set numBoneInfluencers(num val);

	/// This property determines the type of occlusion query algorithm to run in WebGl, you can use:
	/// 
	/// AbstractMesh.OCCLUSION_ALGORITHM_TYPE_ACCURATE which is mapped to GL_ANY_SAMPLES_PASSED.
	/// AbstractMesh.OCCLUSION_ALGORITHM_TYPE_CONSERVATIVE (Default Value) which is mapped to GL_ANY_SAMPLES_PASSED_CONSERVATIVE which is a false positive algorithm that is faster than GL_ANY_SAMPLES_PASSED but less accurate.
	external num get occlusionQueryAlgorithmType;
	external void set occlusionQueryAlgorithmType(num val);

	/// This number indicates the number of allowed retries before stop the occlusion query, this is useful if the occlusion query is taking long time before to the query result is retireved, the query result indicates if the object is visible within the scene or not and based on that Babylon.Js engine decideds to show or hide the object.
	/// The default value is -1 which means don't break the query and wait till the result
	external num get occlusionRetryCount;
	external void set occlusionRetryCount(num val);

	/// This property is responsible for starting the occlusion query within the Mesh or not, this property is also used to determine what should happen when the occlusionRetryCount is reached. It has supports 3 values:
	/// 
	/// OCCLUSION_TYPE_NONE (Default Value): this option means no occlusion query whith the Mesh.
	/// OCCLUSION_TYPE_OPTIMISTIC: this option is means use occlusion query and if occlusionRetryCount is reached and the query is broken show the mesh.
	/// OCCLUSION_TYPE_STRICT: this option is means use occlusion query and if occlusionRetryCount is reached and the query is broken restore the last state of the mesh occlusion if the mesh was visible then show the mesh if was hidden then hide don't show.
	external num get occlusionType;
	external void set occlusionType(num val);

	/// Set a function to call when this mesh collides with another one
	external dynamic get onCollide;
	external void set onCollide(dynamic val);

	/// An event triggered when this mesh collides with another one
	external Observable<AbstractMesh> get onCollideObservable;

	/// Set a function to call when the collision's position changes
	external dynamic get onCollisionPositionChange;
	external void set onCollisionPositionChange(dynamic val);

	/// An event triggered when the collision's position changes
	external Observable<Vector3> get onCollisionPositionChangeObservable;

	/// An event triggered when material is changed
	external Observable<AbstractMesh> get onMaterialChangedObservable;

	/// An event triggered when the mesh is rebuilt.
	external Observable<AbstractMesh> get onRebuildObservable;

	/// Defines color to use when rendering outline
	external Color3 get outlineColor;
	external void set outlineColor(Color3 val);

	/// Define width to use when rendering outline
	external num get outlineWidth;
	external void set outlineWidth(num val);

	/// Defines alpha to use when rendering overlay
	external num get overlayAlpha;
	external void set overlayAlpha(num val);

	/// Defines color to use when rendering overlay
	external Color3 get overlayColor;
	external void set overlayColor(Color3 val);

	/// The ratio (float) to apply to the bouding box size to set to the partioning space.
	/// Ex : 1.01 (default) the partioning space is 1% bigger than the bounding box
	external num get partitioningBBoxRatio;
	external void set partitioningBBoxRatio(num val);

	/// Gets or set the number (integer) of subdivisions per axis in the partioning space
	external num get partitioningSubdivisions;

	/// Gets or sets impostor used for physic simulation
	external PhysicsImpostor get physicsImpostor;
	external void set physicsImpostor(PhysicsImpostor val);

	/// Gets or sets a boolean indicating that this mesh can receive realtime shadows
	external bool get receiveShadows;
	external void set receiveShadows(bool val);

	/// Gets or sets a boolean indicating if the outline must be rendered as well
	external bool get renderOutline;
	external void set renderOutline(bool val);

	/// Gets or sets a boolean indicating if the overlay must be rendered as well
	external bool get renderOverlay;
	external void set renderOverlay(bool val);

	/// Specifies the rendering group id for this mesh (0 by default)
	external num get renderingGroupId;
	external void set renderingGroupId(num val);

	/// Gets or sets a Vector3 depicting the mesh scaling along each local axis X, Y, Z.  Default is (1.0, 1.0, 1.0)
	external Vector3 get scaling;
	external void set scaling(Vector3 val);

	/// Gets or sets a boolean indicating if the bounding box must be rendered as well (false by default)
	external bool get showBoundingBox;
	external void set showBoundingBox(bool val);

	/// Gets or sets a boolean indicating that bounding boxes of subMeshes must be rendered as well (false by default)
	external bool get showSubMeshesBoundingBox;
	external void set showSubMeshesBoundingBox(bool val);

	/// Gets or sets a skeleton to apply skining transformations
	external Skeleton get skeleton;
	external void set skeleton(Skeleton val);

	/// Gets or sets the list of subMeshes
	external List<SubMesh> get subMeshes;
	external void set subMeshes(List<SubMesh> val);

	/// Gets a boolean indicating if this mesh has skinning data and an attached skeleton
	external bool get useBones;

	/// Gets or sets a boolean indicating that internal octree (if available) can be used to boost submeshes collision (true by default)
	external bool get useOctreeForCollisions;
	external void set useOctreeForCollisions(bool val);

	/// Gets or sets a boolean indicating that internal octree (if available) can be used to boost submeshes picking (true by default)
	external bool get useOctreeForPicking;
	external void set useOctreeForPicking(bool val);

	/// Gets or sets a boolean indicating that internal octree (if available) can be used to boost submeshes selection (true by default)
	external bool get useOctreeForRenderingSelection;
	external void set useOctreeForRenderingSelection(bool val);

	/// Gets or sets a boolean indicating that this mesh needs to use vertex color data to render (if this kind of vertex data is available in the geometry)
	external bool get useVertexColors;
	external void set useVertexColors(bool val);

	/// Gets or sets mesh visibility between 0 and 1 (default is 1)
	external num get visibility;
	external void set visibility(num val);

	// ### Member Methods ##############################

	/// Adds the passed mesh as a child to the current mesh
	external AbstractMesh addChild(AbstractMesh mesh);

	/// Align the mesh with a normal
	external AbstractMesh alignWithNormal(Vector3 normal, [Vector3 upDirection]);

	/// Apply a physic impulse to the mesh
	external AbstractMesh applyImpulse(Vector3 force, Vector3 contactPoint);

	/// Calculate relative position change from the point of view of behind the front of the mesh.
	/// This is performed taking into account the meshes current rotation, so you do not have to care.
	/// Supports definition of mesh facing forward or backward
	external Vector3 calcMovePOV(num amountRight, num amountUp, num amountForward);

	/// Calculate relative rotation change from the point of view of behind the front of the mesh.
	/// Supports definition of mesh facing forward or backward.
	external Vector3 calcRotatePOV(num flipBack, num twirlClockwise, num tiltRight);

	/// Creates new normals data for the mesh
	external AbstractMesh createNormals(bool updatable);

	/// This function will create an octree to help to select the right submeshes for rendering, picking and collision computations.
	/// Please note that you must have a decent number of submeshes to get performance improvements when using an octree
	external Octree<SubMesh> createOrUpdateSubmeshesOctree([num maxCapacity, num maxDepth]);

	/// Disables the mesh edge rendering mode
	external AbstractMesh disableEdgesRendering();

	/// Disables the feature FacetData and frees the related memory
	external AbstractMesh disableFacetData();

	/// Enables the edge rendering mode on the mesh.
	/// This mode makes the mesh edges visible
	external AbstractMesh enableEdgesRendering([num epsilon, bool checkVerticesInsteadOfIndices]);

	/// Returns the mesh BoundingInfo object or creates a new one and returns if it was undefined
	external BoundingInfo getBoundingInfo();

	/// Returns the closest mesh facet index at (x,y,z) World coordinates, null if not found
	external num getClosestFacetAtCoordinates(num x, num y, num z, [Vector3 projected, bool checkFace, bool facing]);

	/// Returns the closest mesh facet index at (x,y,z) local coordinates, null if not found
	external num getClosestFacetAtLocalCoordinates(num x, num y, num z, [Vector3 projected, bool checkFace, bool facing]);

	/// Returns the object "parameter" set with all the expected parameters for facetData computation by ComputeNormals()
	external dynamic getFacetDataParameters();

	/// Returns the facetLocalNormals array.
	/// The normals are expressed in the mesh local spac
	external List<Vector3> getFacetLocalNormals();

	/// Returns the facetLocalPartioning array
	external List<List<num>> getFacetLocalPartitioning();

	/// Returns the facetLocalPositions array.
	/// The facet positions are expressed in the mesh local space
	external List<Vector3> getFacetLocalPositions();

	/// Returns the i-th facet normal in the world system.
	/// This method allocates a new Vector3 per call
	external Vector3 getFacetNormal(num i);

	/// Sets the reference Vector3 with the i-th facet normal in the world system
	external AbstractMesh getFacetNormalToRef(num i, Vector3 ref);

	/// Returns the i-th facet position in the world system.
	/// This method allocates a new Vector3 per call
	external Vector3 getFacetPosition(num i);

	/// Sets the reference Vector3 with the i-th facet position in the world system
	external AbstractMesh getFacetPositionToRef(num i, Vector3 ref);

	/// Returns the facets (in an array) in the same partitioning block than the one the passed coordinates are located (expressed in the mesh local system)
	external List<num> getFacetsAtLocalCoordinates(num x, num y, num z);

	/// Return the minimum and maximum world vectors of the entire hierarchy under current mesh
	external Object getHierarchyBoundingVectors([bool includeDescendants, dynamic predicate]);

	/// Returns null by default. Implemented by child classes
	external IndicesArray getIndices();

	/// Returns the mesh itself by default. Implemented by child classes
	external AbstractMesh getLOD(Camera camera);

	/// Gets the current physics impostor
	external PhysicsImpostor getPhysicsImpostor();

	/// Returns a positive integer : the total number of indices in this mesh geometry.
	external num getTotalIndices();

	/// Returns 0 by default. Implemented by child classes
	external num getTotalVertices();

	/// Returns the array of the requested vertex data kind. Implemented by child classes
	external List<double> getVerticesData(String kind);

	/// Checks if the passed Ray intersects with the mesh
	external PickingInfo intersects(Ray ray, [bool fastCheck]);

	/// True if the mesh intersects another mesh or a SolidParticle object
	external bool intersectsMesh(dynamic mesh, [bool precise, bool includeDescendants]); // TODO: Type union: [AbstractMesh | SolidParticle]

	/// Returns true if the passed point (Vector3) is inside the mesh bounding box
	external bool intersectsPoint(Vector3 point);

	/// Returns true if the mesh is completely in the frustum defined be the passed array of planes.
	/// A mesh is completely in the frustum if its bounding box it completely inside the frustum.
	external bool isCompletelyInFrustum(List<Plane> frustumPlanes);

	/// Returns true if the mesh is within the frustum defined by the passed array of planes.
	/// A mesh is in the frustum if its bounding box intersects the frustum
	external bool isInFrustum(List<Plane> frustumPlanes);

	/// Gets a boolean indicating if specific vertex data is present
	external bool isVerticesDataPresent(String kind);

	/// Perform relative position change from the point of view of behind the front of the mesh.
	/// This is performed taking into account the meshes current rotation, so you do not have to care.
	/// Supports definition of mesh facing forward or backward
	external AbstractMesh movePOV(num amountRight, num amountUp, num amountForward);

	/// Move the mesh using collision engine
	external AbstractMesh moveWithCollisions(Vector3 displacement);

	/// Uniformly scales the mesh to fit inside of a unit cube (1 X 1 X 1 units)
	external AbstractMesh normalizeToUnitCube([bool includeDescendants]);

	/// This method recomputes and sets a new BoundingInfo to the mesh unless it is locked.
	/// This means the mesh underlying bounding box and sphere are recomputed.
	external AbstractMesh refreshBoundingInfo([bool applySkeleton]);

	/// Disposes all the submeshes of the current meshnp
	external AbstractMesh releaseSubMeshes();

	/// Removes the passed mesh from the current mesh children list
	external AbstractMesh removeChild(AbstractMesh mesh);

	/// Perform relative rotation change from the point of view of behind the front of the mesh.
	/// Supports definition of mesh facing forward or backward
	external AbstractMesh rotatePOV(num flipBack, num twirlClockwise, num tiltRight);

	/// Overwrite the current bounding info
	external AbstractMesh setBoundingInfo(BoundingInfo boundingInfo);

	/// Sets the mesh indices,
	/// If the mesh has no geometry, a new Geometry object is created and set to the mesh.
	external AbstractMesh setIndices(IndicesArray indices, num totalVertices);

	/// Creates a physic joint between two meshes
	external AbstractMesh setPhysicsLinkWith(Mesh otherMesh, Vector3 pivot1, Vector3 pivot2, [dynamic options]);

	/// Sets the vertex data of the mesh geometry for the requested kind.
	/// If the mesh has no geometry, a new Geometry object is set to the mesh and then passed this vertex data.
	/// Note that a new underlying VertexBuffer object is created each call.
	/// If the kind is the PositionKind, the mesh BoundingInfo is renewed, so the bounding box and sphere, and the mesh World Matrix is recomputed.
	external AbstractMesh setVerticesData(String kind, List<double> data, [bool updatable, num stride]);

	/// Gets a string representation of the current mesh
	external String toString([bool fullDetails]);

	/// Updates the mesh facetData arrays and the internal partitioning when the mesh is morphed or updated.
	/// This method can be called within the render loop.
	/// You don't need to call this method by yourself in the render loop when you update/morph a mesh with the methods CreateXXX() as they automatically manage this computation
	external AbstractMesh updateFacetData();

	/// Updates the AbstractMesh indices array
	external AbstractMesh updateIndices(IndicesArray indices);

	/// Updates the existing vertex data of the mesh geometry for the requested kind.
	/// If the mesh has no geometry, it is simply returned as it is.
	external AbstractMesh updateVerticesData(String kind, List<double> data, [bool updateExtends, bool makeItUnique]);

	// ### Static Fields ##############################

	/// Billboard on all axes
	external static num get BILLBOARDMODE_ALL;

	/// No billboard
	external static num get BILLBOARDMODE_NONE;

	/// Billboard on X axis
	external static num get BILLBOARDMODE_X;

	/// Billboard on Y axis
	external static num get BILLBOARDMODE_Y;

	/// Billboard on Z axis
	external static num get BILLBOARDMODE_Z;

	/// Culling strategy with bounding sphere only and then frustum culling
	external static num get CULLINGSTRATEGY_BOUNDINGSPHERE_ONLY;

	/// Default culling strategy with bounding box and bounding sphere and then frustum culling
	external static num get CULLINGSTRATEGY_STANDARD;

	/// Use an accurante occlusion algorithm
	external static num get OCCLUSION_ALGORITHM_TYPE_ACCURATE;

	/// Use a conservative occlusion algorithm
	external static num get OCCLUSION_ALGORITHM_TYPE_CONSERVATIVE;

	/// No occlusion
	external static num get OCCLUSION_TYPE_NONE;

	/// Occlusion set to optimisitic
	external static num get OCCLUSION_TYPE_OPTIMISTIC;

	/// Occlusion set to strict
	external static num get OCCLUSION_TYPE_STRICT;

}

// ### Mesh ##############################


/// Class used to represent renderable models
@JS()
class Mesh extends AbstractMesh {
	external Mesh(String name, [Scene scene, Node parent, Mesh source, bool doNotCloneChildren, bool clonePhysicsImpostor]);

	// ### Member Fields ##############################

	/// Gets a boolean indicating if the normals aren't to be recomputed on next mesh positions array update. This property is pertinent only for updatable parametric shapes.
	external bool get areNormalsFrozen;

	/// Gets the delay loading state of the mesh (when delay loading is turned on)
	external num get delayLoadState;

	/// Gets the file containing delay loading data for this mesh
	external String get delayLoadingFile;

	/// Gets the mesh internal Geometry object
	external Geometry get geometry;

	/// Gets a boolean indicating if this mesh has LOD
	external bool get hasLODLevels;

	/// Gets the list of instances created from this mesh
	/// it is not supposed to be modified manually.
	/// Note also that the order of the InstancedMesh wihin the array is not significant and might change.
	external List<InstancedMesh> get instances;

	/// Gets or sets a boolean indicating that this mesh does not use index buffer
	external bool get isUnIndexed;
	external void set isUnIndexed(bool val);

	/// Gets or sets the morph target manager
	external MorphTargetManager get morphTargetManager;
	external void set morphTargetManager(MorphTargetManager val);

	/// An event triggered after rendering the mesh
	external Observable<Mesh> get onAfterRenderObservable;

	/// Sets a callback to call before drawing the mesh. It is recommended to use onBeforeDrawObservable instead
	external dynamic get onBeforeDraw;
	external void set onBeforeDraw(dynamic val);

	/// An event triggered before drawing the mesh
	external Observable<Mesh> get onBeforeDrawObservable;

	/// An event triggered before rendering the mesh
	external Observable<Mesh> get onBeforeRenderObservable;

	/// User defined function used to change how LOD level selection is done
	external dynamic get onLODLevelSelection;
	external void set onLODLevelSelection(dynamic val);

	/// Use this property to change the original side orientation defined at construction time
	external num get overrideMaterialSideOrientation;
	external void set overrideMaterialSideOrientation(num val);

	/// Sets a value overriding the instance count. Only applicable when custom instanced InterleavedVertexBuffer are used rather than InstancedMeshs
	external num get overridenInstanceCount;
	external void set overridenInstanceCount(num val);

	/// Gets the source mesh (the one used to clone this one from)
	external Mesh get source;

	// ### Member Methods ##############################

	/// Add a mesh as LOD level triggered at the given distance.
	external Mesh addLODLevel(num distance, Mesh mesh);

	/// Modifies the mesh geometry according to a displacement map.
	/// A displacement map is a colored image. Each pixel color value (actually a gradient computed from red, green, blue values) will give the displacement to apply to each mesh vertex.
	/// The mesh must be set as updatable. Its internal geometry is directly modified, no new buffer are allocated.
	external Mesh applyDisplacementMap(String url, num minHeight, num maxHeight, [dynamic onSuccess, Vector2 uvOffset, Vector2 uvScale, bool forceUpdate]);

	/// Modifies the mesh geometry according to a displacementMap buffer.
	/// A displacement map is a colored image. Each pixel color value (actually a gradient computed from red, green, blue values) will give the displacement to apply to each mesh vertex.
	/// The mesh must be set as updatable. Its internal geometry is directly modified, no new buffer are allocated.
	external Mesh applyDisplacementMapFromBuffer(Uint8List buffer, num heightMapWidth, num heightMapHeight, num minHeight, num maxHeight, [Vector2 uvOffset, Vector2 uvScale, bool forceUpdate]);

	/// Updates the vertex buffer by applying transformation from the bones
	external Mesh applySkeleton(Skeleton skeleton);

	/// Modifies the mesh geometry according to its own current World Matrix.
	/// The mesh World Matrix is then reset.
	/// This method returns nothing but really modifies the mesh even if it's originally not set as updatable.
	/// Note that, under the hood, this method sets a new VertexBuffer each call.
	external Mesh bakeCurrentTransformIntoVertices();

	/// Modifies the mesh geometry according to the passed transformation matrix.
	/// This method returns nothing but it really modifies the mesh even if it's originally not set as updatable.
	/// The mesh normals are modified using the same transformation.
	/// Note that, under the hood, this method sets a new VertexBuffer each call.
	external Mesh bakeTransformIntoVertices(Matrix transform);

	/// Renormalize the mesh and patch it up if there are no weights
	/// Similar to normalization by adding the weights compute the reciprocal and multiply all elements, this wil ensure that everything adds to 1.
	/// However in the case of zero weights then we set just a single influence to 1.
	/// We check in the function for extra's present and if so we use the normalizeSkinWeightsWithExtras rather than the FourWeights version.
	external void cleanMatrixWeights();

	/// Modify the mesh to get a flat shading rendering.
	/// This means each mesh facet will then have its own normals. Usually new vertices are added in the mesh geometry to get this result.
	/// Warning : the mesh is really modified even if not set originally as updatable and, under the hood, a new VertexBuffer is allocated.
	external Mesh convertToFlatShadedMesh();

	/// This method removes all the mesh indices and add new vertices (duplication) in order to unfold facets into buffers.
	/// In other words, more vertices, no more indices and a single bigger VBO.
	/// The mesh is really modified even if not set originally as updatable. Under the hood, a new VertexBuffer is allocated.
	external Mesh convertToUnIndexedMesh();

	/// Creates a new InstancedMesh object from the mesh model.
	external InstancedMesh createInstance(String name);

	/// Inverses facet orientations.
	/// Warning : the mesh is really modified even if not set originally as updatable. A new VertexBuffer is created under the hood each call.
	external Mesh flipFaces([bool flipNormals]);

	/// This function affects parametric shapes on vertex position update only : ribbons, tubes, etc. It has no effect at all on other shapes. It prevents the mesh normals from being recomputed on next positions array update.
	external Mesh freezeNormals();

	/// Returns as a new array populated with the mesh material and/or skeleton, if any.
	external List<IAnimatable> getAnimatables();

	/// Returns an array populated with IParticleSystem objects whose the mesh is the emitter
	external List<IParticleSystem> getEmittedParticleSystems();

	/// Returns an array populated with IParticleSystem objects whose the mesh or its children are the emitter
	external List<IParticleSystem> getHierarchyEmittedParticleSystems();

	/// Returns the LOD level mesh at the passed distance or null if not found.
	external Mesh getLODLevelAtDistance(num distance);

	/// Gets the list of MeshLODLevel associated with the current mesh
	external List<MeshLODLevel> getLODLevels();

	/// Returns the mesh VertexBuffer object from the requested kind
	external VertexBuffer getVertexBuffer(String kind);

	/// Returns a string which contains the list of existing kinds of Vertex Data associated with this mesh.
	external List<String> getVerticesDataKinds();

	/// Returns a boolean defining if the vertex data for the requested kind is updatable.
	external bool isVertexBufferUpdatable(String kind);

	/// Creates a un-shared specific occurence of the geometry for the mesh.
	external Mesh makeGeometryUnique();

	/// Flags an associated vertex buffer as updatable
	external void markVerticesDataAsUpdatable(String kind, [bool updatable]);

	/// Optimization of the mesh's indices, in case a mesh has duplicated vertices.
	/// The function will only reorder the indices and will not remove unused vertices to avoid problems with submeshes.
	/// This should be used together with the simplification to avoid disappearing triangles.
	external Mesh optimizeIndices([dynamic successCallback]);

	/// Registers for this mesh a javascript function called just after the rendering is complete
	external Mesh registerAfterRender(dynamic func);

	/// Registers for this mesh a javascript function called just before the rendering process
	external Mesh registerBeforeRender(dynamic func);

	/// Remove a mesh from the LOD array
	external Mesh removeLODLevel(Mesh mesh);

	/// Triggers the draw call for the mesh. Usually, you don't need to call this method by your own because the mesh rendering is handled by the scene rendering manager
	external Mesh render(SubMesh subMesh, bool enableAlphaMode);

	/// Sets the mesh material by the material or multiMaterial id property
	external Mesh setMaterialByID(String id);

	/// Prepare internal normal array for software CPU skinning
	external Float32List setNormalsForCPUSkinning();

	/// Prepare internal position array for software CPU skinning
	external Float32List setPositionsForCPUSkinning();

	/// Sets the mesh global Vertex Buffer
	external Mesh setVerticesBuffer(VertexBuffer buffer);

	/// Simplify the mesh according to the given array of settings.
	/// Function will return immediately and will simplify async
	external Mesh simplify(List<ISimplificationSettings> settings, [bool parallelProcessing, SimplificationType simplificationType, dynamic successCallback]);

	/// This function will subdivide the mesh into multiple submeshes
	external void subdivide(num count);

	/// Synchronises all the mesh instance submeshes to the current mesh submeshes, if any.
	/// After this call, all the mesh instances have the same submeshes than the current mesh.
	external Mesh synchronizeInstances();

	/// Invert the geometry to move from a right handed system to a left handed one.
	external Mesh toLeftHanded();

	/// This function affects parametric shapes on vertex position update only : ribbons, tubes, etc. It has no effect at all on other shapes. It reactivates the mesh normals computation if it was previously frozen
	external Mesh unfreezeNormals();

	/// Disposes a previously registered javascript function called after the rendering.
	external Mesh unregisterAfterRender(dynamic func);

	/// Disposes a previously registered javascript function called before the rendering
	external Mesh unregisterBeforeRender(dynamic func);

	/// This method updates the vertex positions of an updatable mesh according to the positionFunction returned values.
	external Mesh updateMeshPositions(dynamic positionFunction, [bool computeNormals]);

	/// ValidateSkinning is used to determine that a mesh has valid skinning data along with skin metrics, if missing weights,
	/// or not normalized it is returned as invalid mesh the string can be used for console logs, or on screen messages to let
	/// the user know there was an issue with importing the mesh
	external Object validateSkinning();

	// ### Static Fields ##############################

	/// Mesh side orientation : usually the internal or back surface
	external static num get BACKSIDE;

	/// Mesh cap setting : two caps, one at the beginning  and one at the end of the mesh
	external static num get CAP_ALL;

	/// Mesh cap setting : one cap at the end of the mesh
	external static num get CAP_END;

	/// Mesh cap setting : one cap at the beginning of the mesh
	external static num get CAP_START;

	/// Mesh side orientation : by default, FRONTSIDE
	external static num get DEFAULTSIDE;

	/// Mesh side orientation : both internal and external or front and back surfaces
	external static num get DOUBLESIDE;

	/// Mesh side orientation : usually the external or front surface
	external static num get FRONTSIDE;

	/// Mesh cap setting : no cap
	external static num get NO_CAP;

	// ### Static Methods ##############################

	/// Returns the center of the {min: Vector3, max: Vector3} or the center of MinMax vector3 computed from a mesh array
	external static Vector3 Center(dynamic meshesOrMinMaxVector); // TODO: Type union: [object | AbstractMesh[]]

	/// Creates a box mesh. Please consider using the same method from the MeshBuilder class instead
	external static Mesh CreateBox(String name, num size, [Scene scene, bool updatable, num sideOrientation]);

	/// Creates a cylinder or a cone mesh. Please consider using the same method from the MeshBuilder class instead
	external static Mesh CreateCylinder(String name, num height, num diameterTop, num diameterBottom, num tessellation, dynamic subdivisions, [Scene scene, dynamic updatable, num sideOrientation]);

	/// Creates a dashed line mesh. Please consider using the same method from the MeshBuilder class instead
	external static LinesMesh CreateDashedLines(String name, List<Vector3> points, num dashSize, num gapSize, num dashNb, [Scene scene, bool updatable, LinesMesh instance]);

	/// Creates a decal mesh.
	/// Please consider using the same method from the MeshBuilder class instead.
	/// A decal is a mesh usually applied as a model onto the surface of another mesh
	external static Mesh CreateDecal(String name, AbstractMesh sourceMesh, Vector3 position, Vector3 normal, Vector3 size, num angle);

	/// Creates a plane polygonal mesh.  By default, this is a disc. Please consider using the same method from the MeshBuilder class instead
	external static Mesh CreateDisc(String name, num radius, num tessellation, [Scene scene, bool updatable, num sideOrientation]);

	/// Creates a ground mesh.
	/// Please consider using the same method from the MeshBuilder class instead
	external static Mesh CreateGround(String name, num width, num height, num subdivisions, [Scene scene, bool updatable]);

	/// Creates a ground mesh from a height map.
	/// Please consider using the same method from the MeshBuilder class instead
	external static GroundMesh CreateGroundFromHeightMap(String name, String url, num width, num height, num subdivisions, num minHeight, num maxHeight, Scene scene, [bool updatable, dynamic onReady, num alphaFilter]);

	/// Creates a sphere based upon an icosahedron with 20 triangular faces which can be subdivided
	/// 
	/// The parameter radius sets the radius size (float) of the icosphere (default 1)
	/// You can set some different icosphere dimensions, for instance to build an ellipsoid, by using the parameters radiusX, radiusY and radiusZ (all by default have the same value than radius)
	/// The parameter subdivisions sets the number of subdivisions (postive integer, default 4). The more subdivisions, the more faces on the icosphere whatever its size
	/// The parameter flat (boolean, default true) gives each side its own normals. Set it to false to get a smooth continuous light reflection on the surface
	/// You can also set the mesh side orientation with the values : BABYLON.Mesh.FRONTSIDE (default), BABYLON.Mesh.BACKSIDE or BABYLON.Mesh.DOUBLESIDE
	/// If you create a double-sided mesh, you can choose what parts of the texture image to crop and stick respectively on the front and the back sides with the parameters frontUVs and backUVs (Vector4). Detail here : http://doc.babylonjs.com/babylon101/discover_basic_elements#side-orientation
	/// The mesh can be set to updatable with the boolean parameter updatable (default false) if its internal geometry is supposed to change once created
	external static Mesh CreateIcoSphere(String name, Object options, Scene scene);

	/// Creates lathe mesh.
	/// The lathe is a shape with a symetry axis : a 2D model shape is rotated around this axis to design the lathe.
	/// Please consider using the same method from the MeshBuilder class instead
	external static Mesh CreateLathe(String name, List<Vector3> shape, num radius, num tessellation, Scene scene, [bool updatable, num sideOrientation]);

	/// Creates a line mesh. Please consider using the same method from the MeshBuilder class instead.
	external static LinesMesh CreateLines(String name, List<Vector3> points, [Scene scene, bool updatable, LinesMesh instance]);

	/// Creates a plane mesh. Please consider using the same method from the MeshBuilder class instead
	external static Mesh CreatePlane(String name, num size, Scene scene, [bool updatable, num sideOrientation]);

	/// Creates a polygon mesh.Please consider using the same method from the MeshBuilder class instead
	external static Mesh CreatePolygon(String name, List<Vector3> shape, Scene scene, [List<List<Vector3>> holes, bool updatable, num sideOrientation]);

	/// Creates a polyhedron mesh.
	/// Please consider using the same method from the MeshBuilder class instead.
	/// 
	/// The parameter type (positive integer, max 14, default 0) sets the polyhedron type to build among the 15 embbeded types. Please refer to the type sheet in the tutorial to choose the wanted type
	/// The parameter size (positive float, default 1) sets the polygon size
	/// You can overwrite the size on each dimension bu using the parameters sizeX, sizeY or sizeZ (positive floats, default to size value)
	/// You can build other polyhedron types than the 15 embbeded ones by setting the parameter custom (polyhedronObject, default null). If you set the parameter custom, this overwrittes the parameter type
	/// A polyhedronObject is a formatted javascript object. You'll find a full file with pre-set polyhedra here : https://github.com/BabylonJS/Extensions/tree/master/Polyhedron
	/// You can set the color and the UV of each side of the polyhedron with the parameters faceColors (Color4, default (1, 1, 1, 1)) and faceUV (Vector4, default (0, 0, 1, 1))
	/// To understand how to set faceUV or faceColors, please read this by considering the right number of faces of your polyhedron, instead of only 6 for the box : https://doc.babylonjs.com/how_to/createbox_per_face_textures_and_colors
	/// The parameter flat (boolean, default true). If set to false, it gives the polyhedron a single global face, so less vertices and shared normals. In this case, faceColors and faceUV are ignored
	/// You can also set the mesh side orientation with the values : BABYLON.Mesh.FRONTSIDE (default), BABYLON.Mesh.BACKSIDE or BABYLON.Mesh.DOUBLESIDE
	/// If you create a double-sided mesh, you can choose what parts of the texture image to crop and stick respectively on the front and the back sides with the parameters frontUVs and backUVs (Vector4). Detail here : http://doc.babylonjs.com/babylon101/discover_basic_elements#side-orientation
	/// The mesh can be set to updatable with the boolean parameter updatable (default false) if its internal geometry is supposed to change once created
	external static Mesh CreatePolyhedron(String name, Object options, Scene scene);

	/// Creates a ribbon mesh. Please consider using the same method from the MeshBuilder class instead
	external static Mesh CreateRibbon(String name, List<List<Vector3>> pathArray, dynamic closeArray, bool closePath, num offset, [Scene scene, bool updatable, num sideOrientation, Mesh instance]); // TODO: Type union: [boolean | undefined]

	/// Creates a sphere mesh. Please consider using the same method from the MeshBuilder class instead
	external static Mesh CreateSphere(String name, num segments, num diameter, [Scene scene, bool updatable, num sideOrientation]);

	/// Creates a tiled ground mesh.
	/// Please consider using the same method from the MeshBuilder class instead
	external static Mesh CreateTiledGround(String name, num xmin, num zmin, num xmax, num zmax, Object subdivisions, Object precision, Scene scene, [bool updatable]);

	/// Creates a torus mesh. Please consider using the same method from the MeshBuilder class instead
	external static Mesh CreateTorus(String name, num diameter, num thickness, num tessellation, [Scene scene, bool updatable, num sideOrientation]);

	/// Creates a torus knot mesh. Please consider using the same method from the MeshBuilder class instead
	external static Mesh CreateTorusKnot(String name, num radius, num tube, num radialSegments, num tubularSegments, num p, num q, [Scene scene, bool updatable, num sideOrientation]);

	/// Creates a tube mesh.
	/// The tube is a parametric shape.
	/// It has no predefined shape. Its final shape will depend on the input parameters.
	/// Please consider using the same method from the MeshBuilder class instead
	external static Mesh CreateTube(String name, List<Vector3> path, num radius, num tessellation, dynamic radiusFunction, num cap, Scene scene, [bool updatable, num sideOrientation, Mesh instance]);

	/// Creates an extruded polygon mesh, with depth in the Y direction. Please consider using the same method from the MeshBuilder class instead.
	external static Mesh ExtrudePolygon(String name, List<Vector3> shape, num depth, Scene scene, [List<List<Vector3>> holes, bool updatable, num sideOrientation]);

	/// Creates an extruded shape mesh.
	/// The extrusion is a parametric shape. It has no predefined shape. Its final shape will depend on the input parameters. Please consider using the same method from the MeshBuilder class instead
	external static Mesh ExtrudeShape(String name, List<Vector3> shape, List<Vector3> path, num scale, num rotation, num cap, [Scene scene, bool updatable, num sideOrientation, Mesh instance]);

	/// Creates an custom extruded shape mesh.
	/// The custom extrusion is a parametric shape.
	/// It has no predefined shape. Its final shape will depend on the input parameters.
	/// Please consider using the same method from the MeshBuilder class instead
	external static Mesh ExtrudeShapeCustom(String name, List<Vector3> shape, List<Vector3> path, Function scaleFunction, Function rotationFunction, bool ribbonCloseArray, bool ribbonClosePath, num cap, Scene scene, [bool updatable, num sideOrientation, Mesh instance]);

	/// Merge the array of meshes into a single mesh for performance reasons.
	external static Mesh MergeMeshes(List<Mesh> meshes, [bool disposeSource, bool allow32BitsIndices, Mesh meshSubclass, bool subdivideWithSubMeshes]);

	/// Returns an object containing a min and max Vector3 which are the minimum and maximum vectors of each mesh bounding box from the passed array, in the world coordinates
	external static Object MinMax(List<AbstractMesh> meshes);
}

// ### BaseSubMesh ##############################


/// Base class for submeshes
@JS()
class BaseSubMesh {
	// ### Member Fields ##############################

	/// Gets associated effect
	external Effect get effect;

	// ### Member Methods ##############################

	/// Sets associated effect (effect used to render this submesh)
	external void setEffect(Effect effect, [MaterialDefines defines]);

}

// ### SubMesh ##############################


/// Defines a subdivision inside a mesh
@JS()
class SubMesh extends BaseSubMesh {
	external SubMesh(num materialIndex, num verticesStart, num verticesCount, num indexStart, num indexCount, AbstractMesh mesh, [Mesh renderingMesh, bool createBoundingBox]);

	// ### Member Fields ##############################

	/// Returns true if this submesh covers the entire parent mesh
	external bool get IsGlobal;
	external void set IsGlobal(bool val);

	/// indices count
	external num get indexCount;
	external void set indexCount(num val);

	/// index start
	external num get indexStart;
	external void set indexStart(num val);

	/// the material index to use
	external num get materialIndex;
	external void set materialIndex(num val);

	/// vertices count
	external num get verticesCount;
	external void set verticesCount(num val);

	/// vertex index start
	external num get verticesStart;
	external void set verticesStart(num val);

	// ### Member Methods ##############################

	/// Checks if the submesh intersects with a ray
	external bool canIntersects(Ray ray);

	/// Creates a new submesh from the passed mesh
	external SubMesh clone(AbstractMesh newMesh, [Mesh newRenderingMesh]);

	/// Release associated resources
	external void dispose();

	/// Returns the submesh BoudingInfo object
	external BoundingInfo getBoundingInfo();

	/// Returns the submesh material
	external Material getMaterial();

	/// Returns the mesh of the current submesh
	external AbstractMesh getMesh();

	/// Returns the rendering mesh of the submesh
	external Mesh getRenderingMesh();

	/// Intersects current submesh with a ray
	external IntersectionInfo intersects(Ray ray, List<Vector3> positions, IndicesArray indices, [bool fastCheck]);

	/// True is the submesh bounding box is completely inside the frustum defined by the passed array of planes
	external bool isCompletelyInFrustum(List<Plane> frustumPlanes);

	/// True is the submesh bounding box intersects the frustum defined by the passed array of planes.
	external bool isInFrustum(List<Plane> frustumPlanes);

	/// Sets a new updated BoundingInfo object to the submesh
	external SubMesh refreshBoundingInfo();

	/// Renders the submesh
	external SubMesh render(bool enableAlphaMode);

	/// Sets the submesh BoundingInfo
	external SubMesh setBoundingInfo(BoundingInfo boundingInfo);

	/// Updates the submesh BoundingInfo
	external SubMesh updateBoundingInfo(Matrix world);

	// ### Static Methods ##############################

	/// Add a new submesh to a mesh
	external static SubMesh AddToMesh(num materialIndex, num verticesStart, num verticesCount, num indexStart, num indexCount, AbstractMesh mesh, [Mesh renderingMesh, bool createBoundingBox]);

	/// Creates a new submesh from indices data
	external static SubMesh CreateFromIndices(num materialIndex, num startIndex, num indexCount, AbstractMesh mesh, [Mesh renderingMesh]);
}

// ### LinesMesh ##############################


/// Line mesh
/// 
/// 
/// see
/// https://doc.babylonjs.com/babylon101/parametric_shapes
@JS()
class LinesMesh extends Mesh {
	external LinesMesh(String name, [Scene scene, Node parent, LinesMesh source, bool doNotCloneChildren, dynamic useVertexColor, dynamic useVertexAlpha]); // TODO: Type union: [boolean | undefined], Type union: [boolean | undefined]

	// ### Member Fields ##############################

	/// Alpha of the line (Default: 1)
	external num get alpha;
	external void set alpha(num val);

	/// Color of the line (Default: White)
	external Color3 get color;
	external void set color(Color3 val);

	/// The intersection Threshold is the margin applied when intersection a segment of the LinesMesh with a Ray.
	/// This margin is expressed in world space coordinates, so its value may vary.
	/// Default value is 0.1
	external num get intersectionThreshold;
	external void set intersectionThreshold(num val);

	/// If vertex alpha should be applied to the mesh
	external dynamic get useVertexAlpha; // TODO: Type union: [boolean | undefined]
	external void set useVertexAlpha(dynamic val);

	/// If vertex color should be applied to the mesh
	external dynamic get useVertexColor; // TODO: Type union: [boolean | undefined]
	external void set useVertexColor(dynamic val);

}

// ### InstancedMesh ##############################


/// Creates an instance based on a source mesh.
@JS()
class InstancedMesh extends AbstractMesh {
	// ### Member Fields ##############################

	/// The source mesh of the instance
	external Mesh get sourceMesh;
	external void set sourceMesh(Mesh val);
}

// ### InstancedLinesMesh ##############################


/// Creates an instance based on a source LinesMesh
@JS()
class InstancedLinesMesh extends InstancedMesh {
	external InstancedLinesMesh(String name, LinesMesh source);

	// ### Member Fields ##############################

	/// The intersection Threshold is the margin applied when intersection a segment of the LinesMesh with a Ray.
	/// This margin is expressed in world space coordinates, so its value may vary.
	/// Initilized with the intersectionThreshold value of the source LinesMesh
	external num get intersectionThreshold;
	external void set intersectionThreshold(num val);

}

// ### GroundMesh ##############################


/// Mesh representing the gorund
@JS()
class GroundMesh extends Mesh {
	// ### Member Fields ##############################

	/// If octree should be generated
	external bool get generateOctree;
	external void set generateOctree(bool val);

	/// The minimum of x and y subdivisions
	external num get subdivisions;
	external void set subdivisions(num val);

	/// X subdivisions
	external num get subdivisionsX;
	external void set subdivisionsX(num val);

	/// Y subdivisions
	external num get subdivisionsY;
	external void set subdivisionsY(num val);

	// ### Member Methods ##############################

	/// Returns a height (y) value in the Worl system :
	/// the ground altitude at the coordinates (x, z) expressed in the World system.
	external num getHeightAtCoordinates(num x, num z);

	/// Returns a normalized vector (Vector3) orthogonal to the ground
	/// at the ground coordinates (x, z) expressed in the World system.
	external Vector3 getNormalAtCoordinates(num x, num z);

	/// Updates the Vector3 passed a reference with a normalized vector orthogonal to the ground
	/// at the ground coordinates (x, z) expressed in the World system.
	/// Doesn't uptade the reference Vector3 if (x, z) are outside the ground surface.
	external GroundMesh getNormalAtCoordinatesToRef(num x, num z, Vector3 ref);

	/// This function will update an octree to help to select the right submeshes for rendering, picking and collision computations.
	/// Please note that you must have a decent number of submeshes to get performance improvements when using an octree
	external void optimize(num chunksCount, [num octreeBlocksSize]);

	/// Force the heights to be recomputed for getHeightAtCoordinates() or getNormalAtCoordinates()
	/// if the ground has been updated.
	/// This can be used in the render loop.
	external GroundMesh updateCoordinateHeights();

}


