part of Babylon;

// ### Vector2 ##############################


/// Class representing a vector containing 2 coordinates
@JS()
class Vector2 {
	external Vector2(num x, num y);

	// ### Member Fields ##############################

	/// defines the first coordinate
	external num get x;
	external void set x(num val);

	/// defines the second coordinate
	external num get y;
	external void set y(num val);

	// ### Member Methods ##############################

	/// Add another vector with the current one
	external Vector2 add(Vector2 otherVector);

	/// Set the Vector2 coordinates by adding the given Vector2 coordinates
	external Vector2 addInPlace(Vector2 otherVector);

	/// Sets the "result" coordinates with the addition of the current Vector2 and the given one coordinates
	external Vector2 addToRef(Vector2 otherVector, Vector2 result);

	/// Gets a new Vector2 by adding the current Vector2 coordinates to the given Vector3 x, y coordinates
	external Vector2 addVector3(Vector3 otherVector);

	/// Copy the current vector to an array
	external List<num> asArray();

	/// Gets a new Vector2 copied from the Vector2
	external Vector2 clone();

	/// Sets the Vector2 coordinates with the given Vector2 coordinates
	external Vector2 copyFrom(Vector2 source);

	/// Sets the Vector2 coordinates with the given floats
	external Vector2 copyFromFloats(num x, num y);

	/// Returns a new Vector2 set with the Vector2 coordinates divided by the given one coordinates
	external Vector2 divide(Vector2 otherVector);

	/// Divides the current Vector2 coordinates by the given ones
	external Vector2 divideInPlace(Vector2 otherVector);

	/// Sets the "result" coordinates with the Vector2 divided by the given one coordinates
	external Vector2 divideToRef(Vector2 otherVector, Vector2 result);

	/// Gets a boolean if two vectors are equals
	external bool equals(Vector2 otherVector);

	/// Gets a boolean if two vectors are equals (using an epsilon value)
	external bool equalsWithEpsilon(Vector2 otherVector, [num epsilon]);

	/// Gets a new Vector2 from current Vector2 floored values
	external Vector2 floor();

	/// Gets a new Vector2 from current Vector2 floored values
	external Vector2 fract();

	/// Gets class name
	external String getClassName();

	/// Gets current vector hash code
	external num getHashCode();

	/// Gets the length of the vector
	external num length();

	/// Gets the vector squared length
	external num lengthSquared();

	/// Returns a new Vector2 set with the multiplication of the current Vector2 and the given one coordinates
	external Vector2 multiply(Vector2 otherVector);

	/// Gets a new Vector2 set with the Vector2 coordinates multiplied by the given floats
	external Vector2 multiplyByFloats(num x, num y);

	/// Multiplies in place the current Vector2 coordinates by the given ones
	external Vector2 multiplyInPlace(Vector2 otherVector);

	/// Sets "result" coordinates with the multiplication of the current Vector2 and the given one coordinates
	external Vector2 multiplyToRef(Vector2 otherVector, Vector2 result);

	/// Gets a new Vector2 with current Vector2 negated coordinates
	external Vector2 negate();

	/// Normalize the vector
	external Vector2 normalize();

	/// Returns a new Vector2 scaled by "scale" from the current Vector2
	external Vector2 scale(num scale);

	/// Scale the current Vector2 values by a factor and add the result to a given Vector2
	external Vector2 scaleAndAddToRef(num scale, Vector2 result);

	/// Multiply the Vector2 coordinates by scale
	external Vector2 scaleInPlace(num scale);

	/// Scale the current Vector2 values by a factor to a given Vector2
	external Vector2 scaleToRef(num scale, Vector2 result);

	/// Sets the Vector2 coordinates with the given floats
	external Vector2 set(num x, num y);

	/// Gets a new Vector2 set with the subtracted coordinates of the given one from the current Vector2
	external Vector2 subtract(Vector2 otherVector);

	/// Sets the current Vector2 coordinates by subtracting from it the given one coordinates
	external Vector2 subtractInPlace(Vector2 otherVector);

	/// Sets the "result" coordinates with the subtraction of the given one from the current Vector2 coordinates.
	external Vector2 subtractToRef(Vector2 otherVector, Vector2 result);

	/// Sets the Vector2 coordinates in the given array or Float32Array from the given index.
	external Vector2 toArray(List<double> array, [num index]);

	/// Gets a string with the Vector2 coordinates
	external String toString();

	// ### Static Methods ##############################

	/// Gets a new Vector2 located for "amount" (float) on the CatmullRom spline defined by the given four Vector2
	external static Vector2 CatmullRom(Vector2 value1, Vector2 value2, Vector2 value3, Vector2 value4, num amount);

	/// Gets a new Vector2 located at the center of the vectors "value1" and "value2"
	external static Vector2 Center(Vector2 value1, Vector2 value2);

	/// Returns a new Vector2 set with same the coordinates than "value" ones if the vector "value" is in the square defined by "min" and "max".
	/// If a coordinate of "value" is lower than "min" coordinates, the returned Vector2 is given this "min" coordinate.
	/// If a coordinate of "value" is greater than "max" coordinates, the returned Vector2 is given this "max" coordinate
	external static Vector2 Clamp(Vector2 value, Vector2 min, Vector2 max);

	/// Gets the distance between the vectors "value1" and "value2"
	external static num Distance(Vector2 value1, Vector2 value2);

	/// Gets the shortest distance (float) between the point "p" and the segment defined by the two points "segA" and "segB".
	external static num DistanceOfPointFromSegment(Vector2 p, Vector2 segA, Vector2 segB);

	/// Returns the squared distance between the vectors "value1" and "value2"
	external static num DistanceSquared(Vector2 value1, Vector2 value2);

	/// Gets the dot product of the vector "left" and the vector "right"
	external static num Dot(Vector2 left, Vector2 right);

	/// Gets a new Vector2 set from the given index element of the given array
	external static Vector2 FromArray(List<num> array, [num offset]);

	/// Sets "result" from the given index element of the given array
	external static void FromArrayToRef(List<num> array, num offset, Vector2 result);

	/// Returns a new Vector2 located for "amount" (float) on the Hermite spline defined by the vectors "value1", "value3", "tangent1", "tangent2"
	external static Vector2 Hermite(Vector2 value1, Vector2 tangent1, Vector2 value2, Vector2 tangent2, num amount);

	/// Returns a new Vector2 located for "amount" (float) on the linear interpolation between the vector "start" adn the vector "end".
	external static Vector2 Lerp(Vector2 start, Vector2 end, num amount);

	/// Gets a new Vecto2 set with the maximal coordinate values from the "left" and "right" vectors
	external static Vector2 Maximize(Vector2 left, Vector2 right);

	/// Gets a new Vector2 set with the minimal coordinate values from the "left" and "right" vectors
	external static Vector2 Minimize(Vector2 left, Vector2 right);

	/// Returns a new Vector2 equal to the normalized given vector
	external static Vector2 Normalize(Vector2 vector);

	/// Gets a new Vector2(1, 1)
	external static Vector2 One();

	/// Determines if a given vector is included in a triangle
	external static bool PointInTriangle(Vector2 p, Vector2 p0, Vector2 p1, Vector2 p2);

	/// Gets a new Vector2 set with the transformed coordinates of the given vector by the given transformation matrix
	external static Vector2 Transform(Vector2 vector, Matrix transformation);

	/// Transforms the given vector coordinates by the given transformation matrix and stores the result in the vector "result" coordinates
	external static void TransformToRef(Vector2 vector, Matrix transformation, Vector2 result);

	/// Gets a new Vector2(0, 0)
	external static Vector2 Zero();
}

// ### Vector3 ##############################


/// Classed used to store (x,y,z) vector representation
/// A Vector3 is the main object used in 3D geometry
/// It can represent etiher the coordinates of a point the space, either a direction
/// Reminder: Babylon.js uses a left handed forward facing system
@JS()
class Vector3 {
	external Vector3(num x, num y, num z);

	// ### Member Fields ##############################

	/// Gets a boolean indicating that the vector is non uniform meaning x, y or z are not all the same
	external bool get isNonUniform;

	/// Defines the first coordinates (on X axis)
	external num get x;
	external void set x(num val);

	/// Defines the second coordinates (on Y axis)
	external num get y;
	external void set y(num val);

	/// Defines the third coordinates (on Z axis)
	external num get z;
	external void set z(num val);

	// ### Member Methods ##############################

	/// Gets a new Vector3, result of the addition the current Vector3 and the given vector
	external Vector3 add(Vector3 otherVector);

	/// Adds the given vector to the current Vector3
	external Vector3 addInPlace(Vector3 otherVector);

	/// Adds the given coordinates to the current Vector3
	external Vector3 addInPlaceFromFloats(num x, num y, num z);

	/// Adds the current Vector3 to the given one and stores the result in the vector "result"
	external Vector3 addToRef(Vector3 otherVector, Vector3 result);

	/// Creates an array containing three elements : the coordinates of the Vector3
	external List<num> asArray();

	/// Creates a new Vector3 copied from the current Vector3
	external Vector3 clone();

	/// Copies the given vector coordinates to the current Vector3 ones
	external Vector3 copyFrom(Vector3 source);

	/// Copies the given floats to the current Vector3 coordinates
	external Vector3 copyFromFloats(num x, num y, num z);

	/// Returns a new Vector3 set with the result of the division of the current Vector3 coordinates by the given ones
	external Vector3 divide(Vector3 otherVector);

	/// Divides the current Vector3 coordinates by the given ones.
	external Vector3 divideInPlace(Vector3 otherVector);

	/// Divides the current Vector3 coordinates by the given ones and stores the result in the given vector "result"
	external Vector3 divideToRef(Vector3 otherVector, Vector3 result);

	/// Returns true if the current Vector3 and the given vector coordinates are strictly equal
	external bool equals(Vector3 otherVector);

	/// Returns true if the current Vector3 coordinates equals the given floats
	external bool equalsToFloats(num x, num y, num z);

	/// Returns true if the current Vector3 and the given vector coordinates are distant less than epsilon
	external bool equalsWithEpsilon(Vector3 otherVector, [num epsilon]);

	/// Gets a new Vector3 from current Vector3 floored values
	external Vector3 floor();

	/// Gets a new Vector3 from current Vector3 floored values
	external Vector3 fract();

	/// Gets the class name
	external String getClassName();

	/// Creates the Vector3 hash code
	external num getHashCode();

	/// Gets the length of the Vector3
	external num length();

	/// Gets the squared length of the Vector3
	external num lengthSquared();

	/// Updates the current Vector3 with the maximal coordinate values between its and the given vector ones.
	external Vector3 maximizeInPlace(Vector3 other);

	/// Updates the current Vector3 with the maximal coordinate values between its and the given coordinates.
	external Vector3 maximizeInPlaceFromFloats(num x, num y, num z);

	/// Updates the current Vector3 with the minimal coordinate values between its and the given vector ones
	external Vector3 minimizeInPlace(Vector3 other);

	/// Updates the current Vector3 with the minimal coordinate values between its and the given coordinates
	external Vector3 minimizeInPlaceFromFloats(num x, num y, num z);

	/// Returns a new Vector3, result of the multiplication of the current Vector3 by the given vector
	external Vector3 multiply(Vector3 otherVector);

	/// Returns a new Vector3 set with the result of the mulliplication of the current Vector3 coordinates by the given floats
	external Vector3 multiplyByFloats(num x, num y, num z);

	/// Multiplies the current Vector3 coordinates by the given ones
	external Vector3 multiplyInPlace(Vector3 otherVector);

	/// Multiplies the current Vector3 by the given one and stores the result in the given vector "result"
	external Vector3 multiplyToRef(Vector3 otherVector, Vector3 result);

	/// Gets a new Vector3 set with the current Vector3 negated coordinates
	external Vector3 negate();

	/// Normalize the current Vector3.
	/// Please note that this is an in place operation.
	external Vector3 normalize();

	/// Normalize the current Vector3 with the given input length.
	/// Please note that this is an in place operation.
	external Vector3 normalizeFromLength(num len);

	/// Normalize the current Vector3 to a new vector
	external Vector3 normalizeToNew();

	/// Normalize the current Vector3 to the reference
	external Vector3 normalizeToRef(Vector3 reference);

	/// Reorders the x y z properties of the vector in place
	external Vector3 reorderInPlace(String order);

	/// Rotates a vector around a given point
	external Vector3 rotateByQuaternionAroundPointToRef(Quaternion quaternion, Vector3 point, Vector3 result);

	/// Rotates the vector around 0,0,0 by a quaternion
	external Vector3 rotateByQuaternionToRef(Quaternion quaternion, Vector3 result);

	/// Returns a new Vector3 set with the current Vector3 coordinates multiplied by the float "scale"
	external Vector3 scale(num scale);

	/// Scale the current Vector3 values by a factor and add the result to a given Vector3
	external Vector3 scaleAndAddToRef(num scale, Vector3 result);

	/// Multiplies the Vector3 coordinates by the float "scale"
	external Vector3 scaleInPlace(num scale);

	/// Multiplies the current Vector3 coordinates by the float "scale" and stores the result in the given vector "result" coordinates
	external Vector3 scaleToRef(num scale, Vector3 result);

	/// Copies the given floats to the current Vector3 coordinates
	external Vector3 set(num x, num y, num z);

	/// Copies the given float to the current Vector3 coordinates
	external Vector3 setAll(num v);

	/// Returns a new Vector3, result of the subtraction of the given vector from the current Vector3
	external Vector3 subtract(Vector3 otherVector);

	/// Returns a new Vector3 set with the subtraction of the given floats from the current Vector3 coordinates
	external Vector3 subtractFromFloats(num x, num y, num z);

	/// Subtracts the given floats from the current Vector3 coordinates and set the given vector "result" with this result
	external Vector3 subtractFromFloatsToRef(num x, num y, num z, Vector3 result);

	/// Subtract the given vector from the current Vector3
	external Vector3 subtractInPlace(Vector3 otherVector);

	/// Subtracts the given vector from the current Vector3 and stores the result in the vector "result".
	external Vector3 subtractToRef(Vector3 otherVector, Vector3 result);

	/// Populates the given array or Float32Array from the given index with the successive coordinates of the Vector3
	external Vector3 toArray(List<double> array, [num index]);

	/// Converts the current Vector3 into a quaternion (considering that the Vector3 contains Euler angles representation of a rotation)
	external Quaternion toQuaternion();

	/// Creates a string representation of the Vector3
	external String toString();

	// ### Static Methods ##############################

	/// Returns a new Vector3 set to (0.0, 0.0, -1.0)
	external static Vector3 Backward();

	/// Returns a new Vector3 located for "amount" on the CatmullRom interpolation spline defined by the vectors "value1", "value2", "value3", "value4"
	external static Vector3 CatmullRom(Vector3 value1, Vector3 value2, Vector3 value3, Vector3 value4, num amount);

	/// Returns a new Vector3 located at the center between "value1" and "value2"
	external static Vector3 Center(Vector3 value1, Vector3 value2);

	/// Returns a new Vector3 set with the coordinates of "value", if the vector "value" is in the cube defined by the vectors "min" and "max"
	/// If a coordinate value of "value" is lower than one of the "min" coordinate, then this "value" coordinate is set with the "min" one
	/// If a coordinate value of "value" is greater than one of the "max" coordinate, then this "value" coordinate is set with the "max" one
	external static Vector3 Clamp(Vector3 value, Vector3 min, Vector3 max);

	/// Sets the given vector "result" with the coordinates of "value", if the vector "value" is in the cube defined by the vectors "min" and "max"
	/// If a coordinate value of "value" is lower than one of the "min" coordinate, then this "value" coordinate is set with the "min" one
	/// If a coordinate value of "value" is greater than one of the "max" coordinate, then this "value" coordinate is set with the "max" one
	external static void ClampToRef(Vector3 value, Vector3 min, Vector3 max, Vector3 result);

	/// Returns a new Vector3 as the cross product of the vectors "left" and "right"
	/// The cross product is then orthogonal to both "left" and "right"
	external static Vector3 Cross(Vector3 left, Vector3 right);

	/// Sets the given vector "result" with the cross product of "left" and "right"
	/// The cross product is then orthogonal to both "left" and "right"
	external static void CrossToRef(Vector3 left, Vector3 right, Vector3 result);

	/// Returns the distance between the vectors "value1" and "value2"
	external static num Distance(Vector3 value1, Vector3 value2);

	/// Returns the squared distance between the vectors "value1" and "value2"
	external static num DistanceSquared(Vector3 value1, Vector3 value2);

	/// Returns the dot product (float) between the vectors "left" and "right"
	external static num Dot(Vector3 left, Vector3 right);

	/// Returns a new Vector3 set to (0.0, -1.0, 0.0)
	external static Vector3 Down();

	/// Returns a new Vector3 set to (0.0, 0.0, 1.0)
	external static Vector3 Forward();

	/// Returns a new Vector3 set from the index "offset" of the given array
	external static Vector3 FromArray(List<num> array, [num offset]);

	/// Sets the given vector "result" with the element values from the index "offset" of the given array
	external static void FromArrayToRef(List<num> array, num offset, Vector3 result);

	/// Returns a new Vector3 set from the index "offset" of the given Float32Array
	/// This function is deprecated. Use FromArray instead
	external static Vector3 FromList<double>(Float32List array, [num offset]);

	/// Sets the given vector "result" with the element values from the index "offset" of the given Float32Array
	/// This function is deprecated.  Use FromArrayToRef instead.
	external static void FromArrayListToRef(Float32List array, num offset, Vector3 result);

	/// Sets the given vector "result" with the given floats.
	external static void FromFloatsToRef(num x, num y, num z, Vector3 result);

	/// Get angle between two vectors
	external static num GetAngleBetweenVectors(Vector3 vector0, Vector3 vector1, Vector3 normal);

	/// Get the clip factor between two vectors
	external static num GetClipFactor(Vector3 vector0, Vector3 vector1, Vector3 axis, num size);

	/// Returns a new Vector3 located for "amount" (float) on the Hermite interpolation spline defined by the vectors "value1", "tangent1", "value2", "tangent2"
	external static Vector3 Hermite(Vector3 value1, Vector3 tangent1, Vector3 value2, Vector3 tangent2, num amount);

	/// Returns a new Vector3 set to (-1.0, 0.0, 0.0)
	external static Vector3 Left();

	/// Returns a new Vector3 located for "amount" (float) on the linear interpolation between the vectors "start" and "end"
	external static Vector3 Lerp(Vector3 start, Vector3 end, num amount);

	/// Sets the given vector "result" with the result of the linear interpolation from the vector "start" for "amount" to the vector "end"
	external static void LerpToRef(Vector3 start, Vector3 end, num amount, Vector3 result);

	/// Gets the maximal coordinate values between two Vector3
	external static Vector3 Maximize(Vector3 left, Vector3 right);

	/// Gets the minimal coordinate values between two Vector3
	external static Vector3 Minimize(Vector3 left, Vector3 right);

	/// Returns a new Vector3 as the normalization of the given vector
	external static Vector3 Normalize(Vector3 vector);

	/// Sets the given vector "result" with the normalization of the given first vector
	external static void NormalizeToRef(Vector3 vector, Vector3 result);

	/// Returns a new Vector3 set to (1.0, 1.0, 1.0)
	external static Vector3 One();

	/// Project a Vector3 onto screen space
	external static Vector3 Project(Vector3 vector, Matrix world, Matrix transform, Viewport viewport);

	/// Returns a new Vector3 set to (1.0, 0.0, 0.0)
	external static Vector3 Right();

	/// Given three orthogonal normalized left-handed oriented Vector3 axis in space (target system),
	/// RotationFromAxis() returns the rotation Euler angles (ex : rotation.x, rotation.y, rotation.z) to apply
	/// to something in order to rotate it from its local system to the given target system
	/// Note: axis1, axis2 and axis3 are normalized during this operation
	external static Vector3 RotationFromAxis(Vector3 axis1, Vector3 axis2, Vector3 axis3);

	/// The same than RotationFromAxis but updates the given ref Vector3 parameter instead of returning a new Vector3
	external static void RotationFromAxisToRef(Vector3 axis1, Vector3 axis2, Vector3 axis3, Vector3 ref);

	/// Returns a new Vector3 set with the result of the transformation by the given matrix of the given vector.
	/// This method computes tranformed coordinates only, not transformed direction vectors (ie. it takes translation in account)
	external static Vector3 TransformCoordinates(Vector3 vector, Matrix transformation);

	/// Sets the given vector "result" coordinates with the result of the transformation by the given matrix of the given floats (x, y, z)
	/// This method computes tranformed coordinates only, not transformed direction vectors
	external static void TransformCoordinatesFromFloatsToRef(num x, num y, num z, Matrix transformation, Vector3 result);

	/// Sets the given vector "result" coordinates with the result of the transformation by the given matrix of the given vector
	/// This method computes tranformed coordinates only, not transformed direction vectors (ie. it takes translation in account)
	external static void TransformCoordinatesToRef(Vector3 vector, Matrix transformation, Vector3 result);

	/// Returns a new Vector3 set with the result of the normal transformation by the given matrix of the given vector
	/// This methods computes transformed normalized direction vectors only (ie. it does not apply translation)
	external static Vector3 TransformNormal(Vector3 vector, Matrix transformation);

	/// Sets the given vector "result" with the result of the normal transformation by the given matrix of the given floats (x, y, z)
	/// This methods computes transformed normalized direction vectors only (ie. it does not apply translation)
	external static void TransformNormalFromFloatsToRef(num x, num y, num z, Matrix transformation, Vector3 result);

	/// Sets the given vector "result" with the result of the normal transformation by the given matrix of the given vector
	/// This methods computes transformed normalized direction vectors only (ie. it does not apply translation)
	external static void TransformNormalToRef(Vector3 vector, Matrix transformation, Vector3 result);

	/// Unproject from screen space to object space
	external static Vector3 Unproject(Vector3 source, num viewportWidth, num viewportHeight, Matrix world, Matrix view, Matrix projection);

	/// Unproject from screen space to object space
	external static void UnprojectFloatsToRef(double sourceX, double sourceY, double sourceZ, num viewportWidth, num viewportHeight, Matrix world, Matrix view, Matrix projection, Vector3 result);

	/// Unproject from screen space to object space
	external static Vector3 UnprojectFromTransform(Vector3 source, num viewportWidth, num viewportHeight, Matrix world, Matrix transform);

	/// Unproject a ray from screen space to object space
	external static void UnprojectRayToRef(double sourceX, double sourceY, num viewportWidth, num viewportHeight, Matrix world, Matrix view, Matrix projection, Ray ray);

	/// Unproject from screen space to object space
	external static void UnprojectToRef(Vector3 source, num viewportWidth, num viewportHeight, Matrix world, Matrix view, Matrix projection, Vector3 result);

	/// Returns a new Vector3 set to (0.0, 1.0, 0.0)
	external static Vector3 Up();

	/// Returns a new Vector3 set to (0.0, 0.0, 0.0)
	external static Vector3 Zero();
}

// ### Vector4 ##############################


/// Vector4 class created for EulerAngle class conversion to Quaternion
@JS()
class Vector4 {
	external Vector4(num x, num y, num z, num w);

	// ### Member Fields ##############################

	/// w value of the vector
	external num get w;
	external void set w(num val);

	/// x value of the vector
	external num get x;
	external void set x(num val);

	/// y value of the vector
	external num get y;
	external void set y(num val);

	/// z value of the vector
	external num get z;
	external void set z(num val);

	// ### Member Methods ##############################

	/// Returns a new Vector4 as the result of the addition of the current Vector4 and the given one.
	external Vector4 add(Vector4 otherVector);

	/// Adds the given vector to the current Vector4.
	external Vector4 addInPlace(Vector4 otherVector);

	/// Updates the given vector "result" with the result of the addition of the current Vector4 and the given one.
	external Vector4 addToRef(Vector4 otherVector, Vector4 result);

	/// Returns a new array populated with 4 elements : the Vector4 coordinates.
	external List<num> asArray();

	/// Returns a new Vector4 copied from the current one.
	external Vector4 clone();

	/// Updates the current Vector4 with the given one coordinates.
	external Vector4 copyFrom(Vector4 source);

	/// Updates the current Vector4 coordinates with the given floats.
	external Vector4 copyFromFloats(num x, num y, num z, num w);

	/// Returns a new Vector4 set with the division result of the current Vector4 by the given one.
	external Vector4 divide(Vector4 otherVector);

	/// Divides the current Vector3 coordinates by the given ones.
	external Vector4 divideInPlace(Vector4 otherVector);

	/// Updates the given vector "result" with the division result of the current Vector4 by the given one.
	external Vector4 divideToRef(Vector4 otherVector, Vector4 result);

	/// Boolean : True if the current Vector4 coordinates are stricly equal to the given ones.
	external bool equals(Vector4 otherVector);

	/// Boolean : True if the given floats are strictly equal to the current Vector4 coordinates.
	external bool equalsToFloats(num x, num y, num z, num w);

	/// Boolean : True if the current Vector4 coordinates are each beneath the distance "epsilon" from the given vector ones.
	external bool equalsWithEpsilon(Vector4 otherVector, [num epsilon]);

	/// Gets a new Vector4 from current Vector4 floored values
	external Vector4 floor();

	/// Gets a new Vector4 from current Vector3 floored values
	external Vector4 fract();

	/// Returns the string "Vector4".
	external String getClassName();

	/// Returns the Vector4 hash code.
	external num getHashCode();

	/// Returns the Vector4 length (float).
	external num length();

	/// Returns the Vector4 squared length (float).
	external num lengthSquared();

	/// Updates the Vector4 coordinates with the maximum values between its own and the given vector ones
	external Vector4 maximizeInPlace(Vector4 other);

	/// Updates the Vector4 coordinates with the minimum values between its own and the given vector ones
	external Vector4 minimizeInPlace(Vector4 other);

	/// Returns a new Vector4 set with the multiplication result of the current Vector4 and the given one.
	external Vector4 multiply(Vector4 otherVector);

	/// Returns a new Vector4 set with the multiplication result of the given floats and the current Vector4 coordinates.
	external Vector4 multiplyByFloats(num x, num y, num z, num w);

	/// Multiplies in place the current Vector4 by the given one.
	external Vector4 multiplyInPlace(Vector4 otherVector);

	/// Updates the given vector "result" with the multiplication result of the current Vector4 and the given one.
	external Vector4 multiplyToRef(Vector4 otherVector, Vector4 result);

	/// Returns a new Vector4 set with the current Vector4 negated coordinates.
	external Vector4 negate();

	/// Normalizes in place the Vector4.
	external Vector4 normalize();

	/// Returns a new Vector4 set with the current Vector4 coordinates multiplied by scale (float).
	external Vector4 scale(num scale);

	/// Scale the current Vector4 values by a factor and add the result to a given Vector4
	external Vector4 scaleAndAddToRef(num scale, Vector4 result);

	/// Multiplies the current Vector4 coordinates by scale (float).
	external Vector4 scaleInPlace(num scale);

	/// Sets the given vector "result" with the current Vector4 coordinates multiplied by scale (float).
	external Vector4 scaleToRef(num scale, Vector4 result);

	/// Updates the current Vector4 coordinates with the given floats.
	external Vector4 set(num x, num y, num z, num w);

	/// Copies the given float to the current Vector3 coordinates
	external Vector4 setAll(num v);

	/// Returns a new Vector4 with the result of the subtraction of the given vector from the current Vector4.
	external Vector4 subtract(Vector4 otherVector);

	/// Returns a new Vector4 set with the result of the subtraction of the given floats from the current Vector4 coordinates.
	external Vector4 subtractFromFloats(num x, num y, num z, num w);

	/// Sets the given vector "result" set with the result of the subtraction of the given floats from the current Vector4 coordinates.
	external Vector4 subtractFromFloatsToRef(num x, num y, num z, num w, Vector4 result);

	/// Subtract in place the given vector from the current Vector4.
	external Vector4 subtractInPlace(Vector4 otherVector);

	/// Sets the given vector "result" with the result of the subtraction of the given vector from the current Vector4.
	external Vector4 subtractToRef(Vector4 otherVector, Vector4 result);

	/// Populates the given array from the given index with the Vector4 coordinates.
	external Vector4 toArray(List<double> array, [num index]);

	/// Returns the string with the Vector4 coordinates.
	external String toString();

	/// Returns a new Vector3 from the Vector4 (x, y, z) coordinates.
	external Vector3 toVector3();

	// ### Static Methods ##############################

	/// Returns a new Vector4 located at the center between the vectors "value1" and "value2".
	external static Vector4 Center(Vector4 value1, Vector4 value2);

	/// Returns the distance (float) between the vectors "value1" and "value2".
	external static num Distance(Vector4 value1, Vector4 value2);

	/// Returns the squared distance (float) between the vectors "value1" and "value2".
	external static num DistanceSquared(Vector4 value1, Vector4 value2);

	/// Returns a new Vector4 set from the starting index of the given array.
	external static Vector4 FromArray(List<num> array, [num offset]);

	/// Updates the given vector "result" from the starting index of the given array.
	external static void FromArrayToRef(List<num> array, num offset, Vector4 result);

	/// Updates the given vector "result" from the starting index of the given Float32Array.
	external static void FromFloatArrayToRef(Float32List array, num offset, Vector4 result);

	/// Updates the given vector "result" coordinates from the given floats.
	external static void FromFloatsToRef(num x, num y, num z, num w, Vector4 result);

	/// Returns a vector with the maximum values from the left and right vectors
	external static Vector4 Maximize(Vector4 left, Vector4 right);

	/// Returns a vector with the minimum values from the left and right vectors
	external static Vector4 Minimize(Vector4 left, Vector4 right);

	/// Returns a new normalized Vector4 from the given one.
	external static Vector4 Normalize(Vector4 vector);

	/// Updates the given vector "result" from the normalization of the given one.
	external static void NormalizeToRef(Vector4 vector, Vector4 result);

	/// Returns a new Vector4 set to (1.0, 1.0, 1.0, 1.0)
	external static Vector4 One();

	/// Returns a new Vector4 set with the result of the normal transformation by the given matrix of the given vector.
	/// This methods computes transformed normalized direction vectors only.
	external static Vector4 TransformNormal(Vector4 vector, Matrix transformation);

	/// Sets the given vector "result" with the result of the normal transformation by the given matrix of the given floats (x, y, z, w).
	/// This methods computes transformed normalized direction vectors only.
	external static void TransformNormalFromFloatsToRef(num x, num y, num z, num w, Matrix transformation, Vector4 result);

	/// Sets the given vector "result" with the result of the normal transformation by the given matrix of the given vector.
	/// This methods computes transformed normalized direction vectors only.
	external static void TransformNormalToRef(Vector4 vector, Matrix transformation, Vector4 result);

	/// Returns a new Vector4 set to (0.0, 0.0, 0.0, 0.0)
	external static Vector4 Zero();
}


