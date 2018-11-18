part of Babylon;


/// Represens a plane by the equation ax + by + cz + d = 0
@JS()
class Plane {
	external Plane(num a, num b, num c, num d);

	// ### Member Fields ##############################

	/// d component of the plane
	external num get d;
	external void set d(num val);

	/// Normal of the plane (a,b,c)
	external Vector3 get normal;
	external void set normal(Vector3 val);

	// ### Member Methods ##############################
	external List<num> asArray();
	external Plane clone();

	/// Updates the current Plane from the plane defined by the three given points.
	external Plane copyFromPoints(Vector3 point1, Vector3 point2, Vector3 point3);

	/// Calcualtte the dot product between the point and the plane normal
	external num dotCoordinate(Vector3 point);
	external String getClassName();
	external num getHashCode();

	/// Checks if the plane is facing a given direction
	external bool isFrontFacingTo(Vector3 direction, num epsilon);

	/// Normalize the current Plane in place.
	external Plane normalize();

	/// Calculates the distance to a point
	external num signedDistanceTo(Vector3 point);

	/// Applies a transformation the plane and returns the result
	external Plane transform(Matrix transformation);

	// ### Static Methods ##############################

	/// Creates a plane from an  array
	external static Plane FromArray(List<num> array);

	/// Creates a plane from three points
	external static Plane FromPoints(Vector3 point1, Vector3 point2, Vector3 point3);

	/// Creates a plane from an origin point and a normal
	external static Plane FromPositionAndNormal(Vector3 origin, Vector3 normal);

	/// Calculates the distance from a plane and a point
	external static num SignedDistanceToPlaneFromPositionAndNormal(Vector3 origin, Vector3 normal, Vector3 point);
}


