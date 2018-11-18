part of Babylon;


/// Class used to store quaternion data
/// 
/// 
/// see
/// https://en.wikipedia.org/wiki/Quaternion
/// 
/// see
/// http://doc.babylonjs.com/features/position,_rotation,_scaling
@JS()
class Quaternion {
	external Quaternion([num x, num y, num z, num w]);

	// ### Member Fields ##############################

	/// defines the fourth component (1.0 by default)
	external num get w;
	external void set w(num val);

	/// defines the first component (0 by default)
	external num get x;
	external void set x(num val);

	/// defines the second component (0 by default)
	external num get y;
	external void set y(num val);

	/// defines the third component (0 by default)
	external num get z;
	external void set z(num val);

	// ### Member Methods ##############################

	/// Adds two quaternions
	external Quaternion add(Quaternion other);

	/// Add a quaternion to the current one
	external Quaternion addInPlace(Quaternion other);

	/// Copy the quaternion to an array
	external List<num> asArray();

	/// Clone the current quaternion
	external Quaternion clone();

	/// Conjugates in place (1-q) the current quaternion
	external Quaternion conjugate();

	/// Conjugates in place (1-q) the current quaternion
	external Quaternion conjugateInPlace();

	/// Conjugates (1-q) the current quaternion and stores the result in the given quaternion
	external Quaternion conjugateToRef(Quaternion ref);

	/// Copy a quaternion to the current one
	external Quaternion copyFrom(Quaternion other);

	/// Updates the current quaternion with the given float coordinates
	external Quaternion copyFromFloats(num x, num y, num z, num w);

	/// Check if two quaternions are equals
	external bool equals(Quaternion otherQuaternion);

	/// Updates the current quaternion from the given rotation matrix values
	external Quaternion fromRotationMatrix(Matrix matrix);

	/// Gets the class name of the quaternion
	external String getClassName();

	/// Gets a hash code for this quaternion
	external num getHashCode();

	/// Gets length of current quaternion
	external num length();

	/// Multiplies two quaternions
	external Quaternion multiply(Quaternion q1);

	/// Updates the current quaternion with the multiplication of itself with the given one "q1"
	external Quaternion multiplyInPlace(Quaternion q1);

	/// Sets the given "result" as the the multiplication result of the current one with the given one "q1"
	external Quaternion multiplyToRef(Quaternion q1, Quaternion result);

	/// Normalize in place the current quaternion
	external Quaternion normalize();

	/// Multiplies the current quaternion by a scale factor
	external Quaternion scale(num value);

	/// Scale the current quaternion values by a factor and add the result to a given quaternion
	external Quaternion scaleAndAddToRef(num scale, Quaternion result);

	/// Multiplies in place the current quaternion by a scale factor
	external Quaternion scaleInPlace(num value);

	/// Scale the current quaternion values by a factor and stores the result to a given quaternion
	external Quaternion scaleToRef(num scale, Quaternion result);

	/// Updates the current quaternion from the given float coordinates
	external Quaternion set(num x, num y, num z, num w);

	/// Subtract two quaternions
	external Quaternion subtract(Quaternion other);

	/// Returns a new Vector3 set with the Euler angles translated from the current quaternion
	external Vector3 toEulerAngles([String order]);

	/// Sets the given vector3 "result" with the Euler angles translated from the current quaternion
	external Quaternion toEulerAnglesToRef(Vector3 result, [String order]);

	/// Updates the given rotation matrix with the current quaternion values
	external Quaternion toRotationMatrix(Matrix result);

	/// Gets a string representation for the current quaternion
	external String toString();

	// ### Static Methods ##############################

	/// Checks if the two quaternions are close to each other
	external static bool AreClose(Quaternion quat0, Quaternion quat1);

	/// Returns the dot product (float) between the quaternions "left" and "right"
	external static num Dot(Quaternion left, Quaternion right);

	/// Creates a new quaternion from data stored into an array
	external static Quaternion FromArray(List<num> array, [num offset]);

	/// Create a quaternion from Euler rotation angles
	external static Quaternion FromEulerAngles(num x, num y, num z);

	/// Updates a quaternion from Euler rotation angles
	external static Quaternion FromEulerAnglesToRef(num x, num y, num z, Quaternion result);

	/// Create a quaternion from Euler rotation vector
	external static Quaternion FromEulerVector(Vector3 vec);

	/// Updates a quaternion from Euler rotation vector
	external static Quaternion FromEulerVectorToRef(Vector3 vec, Quaternion result);

	/// Creates a new quaternion from a rotation matrix
	external static Quaternion FromRotationMatrix(Matrix matrix);

	/// Updates the given quaternion with the given rotation matrix values
	external static void FromRotationMatrixToRef(Matrix matrix, Quaternion result);

	/// Interpolate between two quaternions using Hermite interpolation
	external static Quaternion Hermite(Quaternion value1, Quaternion tangent1, Quaternion value2, Quaternion tangent2, num amount);

	/// Creates an identity quaternion
	external static Quaternion Identity();

	/// Inverse a given quaternion
	external static Quaternion Inverse(Quaternion q);

	/// Inverse a given quaternion
	external static Quaternion InverseToRef(Quaternion q, Quaternion result);

	/// Gets a boolean indicating if the given quaternion is identity
	external static bool IsIdentity(Quaternion quaternion);

	/// Creates a new quaternion from the given Euler float angles expressed in z-x-z orientation
	external static Quaternion RotationAlphaBetaGamma(num alpha, num beta, num gamma);

	/// Creates a new quaternion from the given Euler float angles expressed in z-x-z orientation and stores it in the target quaternion
	external static void RotationAlphaBetaGammaToRef(num alpha, num beta, num gamma, Quaternion result);

	/// Creates a quaternion from a rotation around an axis
	external static Quaternion RotationAxis(Vector3 axis, num angle);

	/// Creates a rotation around an axis and stores it into the given quaternion
	external static Quaternion RotationAxisToRef(Vector3 axis, num angle, Quaternion result);

	/// Creates a new quaternion containing the rotation value to reach the target (axis1, axis2, axis3) orientation as a rotated XYZ system (axis1, axis2 and axis3 are normalized during this operation)
	external static Quaternion RotationQuaternionFromAxis(Vector3 axis1, Vector3 axis2, Vector3 axis3);

	/// Creates a rotation value to reach the target (axis1, axis2, axis3) orientation as a rotated XYZ system (axis1, axis2 and axis3 are normalized during this operation) and stores it in the target quaternion
	external static void RotationQuaternionFromAxisToRef(Vector3 axis1, Vector3 axis2, Vector3 axis3, Quaternion ref);

	/// Creates a new quaternion from the given Euler float angles (y, x, z)
	external static Quaternion RotationYawPitchRoll(num yaw, num pitch, num roll);

	/// Creates a new rotation from the given Euler float angles (y, x, z) and stores it in the target quaternion
	external static void RotationYawPitchRollToRef(num yaw, num pitch, num roll, Quaternion result);

	/// Interpolates between two quaternions
	external static Quaternion Slerp(Quaternion left, Quaternion right, num amount);

	/// Interpolates between two quaternions and stores it into a target quaternion
	external static void SlerpToRef(Quaternion left, Quaternion right, num amount, Quaternion result);

	/// Creates an empty quaternion
	external static Quaternion Zero();
}


