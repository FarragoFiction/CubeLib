part of Babylon;


/// Class used to store matrix data (4x4)
@JS()
class Matrix {
	external Matrix();

	// ### Member Fields ##############################

	/// Gets the internal data of the matrix
	external Float32List get m;

	/// Gets the update flag of the matrix which is an unique number for the matrix.
	/// It will be incremented every time the matrix data change.
	/// You can use it to speed the comparison between two versions of the same matrix.
	external num get updateFlag;

	// ### Member Methods ##############################

	/// Adds the current matrix with a second one
	external Matrix add(Matrix other);

	/// add a value at the specified position in the current Matrix
	external Matrix addAtIndex(num index, num value);

	/// Sets the given matrix "result" to the addition of the current matrix and the given one
	external Matrix addToRef(Matrix other, Matrix result);

	/// Adds in place the given matrix to the current matrix
	external Matrix addToSelf(Matrix other);

	/// Returns the matrix as a Float32Array
	external Float32List asArray();

	/// Clone the current matrix
	external Matrix clone();

	/// Copy the current matrix from the given one
	external Matrix copyFrom(Matrix other);

	/// Populates the given array from the starting index with the current matrix values
	external Matrix copyToArray(Float32List array, [num offset]);

	/// Decomposes the current Matrix into a translation, rotation and scaling components
	external bool decompose([Vector3 scale, Quaternion rotation, Vector3 translation]);

	/// Gets the determinant of the matrix
	external num determinant();

	/// Check equality between this matrix and a second one
	external bool equals(Matrix value);

	/// Returns the name of the current matrix class
	external String getClassName();

	/// Gets the hash code of the current matrix
	external num getHashCode();

	/// Gets only rotation part of the current matrix
	external Matrix getRotationMatrix();

	/// Extracts the rotation matrix from the current one and sets it as the given "result"
	external Matrix getRotationMatrixToRef(Matrix result);

	/// Gets specific row of the matrix
	external Vector4 getRow(num index);

	/// Gets the translation value of the current matrix
	external Vector3 getTranslation();

	/// Fill a Vector3 with the extracted translation from the matrix
	external Matrix getTranslationToRef(Vector3 result);

	/// Inverts the current matrix in place
	external Matrix invert();

	/// Sets the given matrix to the current inverted Matrix
	external Matrix invertToRef(Matrix other);

	/// Check if the current matrix is identity
	external bool isIdentity();

	/// Check if the current matrix is identity as a texture matrix (3x2 store in 4x4)
	external bool isIdentityAs3x2();

	/// Multiply two matrices
	external Matrix multiply(Matrix other);

	/// mutiply the specified position in the current Matrix by a value
	external Matrix multiplyAtIndex(num index, num value);

	/// Sets the Float32Array "result" from the given index "offset" with the multiplication of the current matrix and the given one
	external Matrix multiplyToArray(Matrix other, Float32List result, num offset);

	/// Sets the given matrix "result" with the multiplication result of the current Matrix and the given one
	external Matrix multiplyToRef(Matrix other, Matrix result);

	/// Remove rotation and scaling part from the matrix
	external Matrix removeRotationAndScaling();

	/// Sets all the matrix elements to zero
	external Matrix reset();

	/// Compute a new matrix set with the current matrix values multiplied by scale (float)
	external Matrix scale(num scale);

	/// Scale the current matrix values by a factor and add the result to a given matrix
	external Matrix scaleAndAddToRef(num scale, Matrix result);

	/// Scale the current matrix values by a factor to a given result matrix
	external Matrix scaleToRef(num scale, Matrix result);

	/// Sets the index-th row of the current matrix to the vector4 values
	external Matrix setRow(num index, Vector4 row);

	/// Sets the index-th row of the current matrix with the given 4 x float values
	external Matrix setRowFromFloats(num index, num x, num y, num z, num w);

	/// Inserts the translation vector in the current matrix
	external Matrix setTranslation(Vector3 vector3);

	/// Inserts the translation vector (using 3 floats) in the current matrix
	external Matrix setTranslationFromFloats(num x, num y, num z);

	/// Returns the matrix as a Float32Array
	external Float32List toArray();

	/// Writes to the given matrix a normal matrix, computed from this one (using values from identity matrix for fourth row and column).
	external void toNormalMatrix(Matrix ref);

	/// Toggles model matrix from being right handed to left handed in place and vice versa
	external void toggleModelMatrixHandInPlace();

	/// Toggles projection matrix from being right handed to left handed in place and vice versa
	external void toggleProjectionMatrixHandInPlace();

	/// Compute the transpose of the matrix
	external Matrix transpose();

	/// Compute the transpose of the matrix and store it in a given matrix
	external Matrix transposeToRef(Matrix result);

	// ### Static Fields ##############################

	/// Gets an identity matrix that must not be updated
	external static Matrix get IdentityReadOnly;

	// ### Static Methods ##############################

	/// Creates a new matrix composed by merging scale (vector3), rotation (quaternion) and translation (vector3)
	external static Matrix Compose(Vector3 scale, Quaternion rotation, Vector3 translation);

	/// Sets a matrix to a value composed by merging scale (vector3), rotation (quaternion) and translation (vector3)
	external static void ComposeToRef(Vector3 scale, Quaternion rotation, Vector3 translation, Matrix result);

	/// Builds a new matrix whose values are computed by:
	/// 
	/// decomposing the the "startValue" and "endValue" matrices into their respective scale, rotation and translation matrices
	/// interpolating for "gradient" (float) the values between each of these decomposed matrices between the start and the end
	/// recomposing a new matrix from these 3 interpolated scale, rotation and translation matrices
	external static Matrix DecomposeLerp(Matrix startValue, Matrix endValue, num gradient);

	/// Update a matrix to values which are computed by:
	/// 
	/// decomposing the the "startValue" and "endValue" matrices into their respective scale, rotation and translation matrices
	/// interpolating for "gradient" (float) the values between each of these decomposed matrices between the start and the end
	/// recomposing a new matrix from these 3 interpolated scale, rotation and translation matrices
	external static void DecomposeLerpToRef(Matrix startValue, Matrix endValue, num gradient, Matrix result);

	/// Creates a matrix from an array
	external static Matrix FromArray(List<num> array, [num offset]);

	/// Copy the content of an array into a given matrix
	external static void FromArrayToRef(List<num> array, num offset, Matrix result);

	/// Stores an array into a matrix after having multiplied each component by a given factor
	external static void FromFloat32ArrayToRefScaled(Float32List array, num offset, num scale, Matrix result);

	/// Creates a rotation matrix from a quaternion and stores it in a target matrix
	external static void FromQuaternionToRef(Quaternion quat, Matrix result);

	/// Creates new matrix from a list of values (16)
	external static Matrix FromValues(num initialM11, num initialM12, num initialM13, num initialM14, num initialM21, num initialM22, num initialM23, num initialM24, num initialM31, num initialM32, num initialM33, num initialM34, num initialM41, num initialM42, num initialM43, num initialM44);

	/// Stores a list of values (16) inside a given matrix
	external static void FromValuesToRef(num initialM11, num initialM12, num initialM13, num initialM14, num initialM21, num initialM22, num initialM23, num initialM24, num initialM31, num initialM32, num initialM33, num initialM34, num initialM41, num initialM42, num initialM43, num initialM44, Matrix result);

	/// Sets the given matrix as a rotation matrix composed from the 3 left handed axes
	external static void FromXYZAxesToRef(Vector3 xaxis, Vector3 yaxis, Vector3 zaxis, Matrix result);

	/// Extracts a 2x2 matrix from a given matrix and store the result in a Float32Array
	external static Float32List GetAsMatrix2x2(Matrix matrix);

	/// Extracts a 3x3 matrix from a given matrix and store the result in a Float32Array
	external static Float32List GetAsMatrix3x3(Matrix matrix);

	/// Computes a complete transformation matrix
	external static Matrix GetFinalMatrix(Viewport viewport, Matrix world, Matrix view, Matrix projection, num zmin, num zmax);

	/// Creates a new identity matrix
	external static Matrix Identity();

	/// Creates a new identity matrix and stores the result in a given matrix
	external static void IdentityToRef(Matrix result);

	/// Creates a new matrix as the invert of a given matrix
	external static Matrix Invert(Matrix source);

	/// Returns a new Matrix whose values are the interpolated values for "gradient" (float) between the ones of the matrices "startValue" and "endValue".
	external static Matrix Lerp(Matrix startValue, Matrix endValue, num gradient);

	/// Set the given matrix "result" as the interpolated values for "gradient" (float) between the ones of the matrices "startValue" and "endValue".
	external static void LerpToRef(Matrix startValue, Matrix endValue, num gradient, Matrix result);

	/// Gets a new rotation matrix used to rotate an entity so as it looks at the target vector3, from the eye vector3 position, the up vector3 being oriented like "up"
	/// This function works in left handed mode
	external static Matrix LookAtLH(Vector3 eye, Vector3 target, Vector3 up);

	/// Sets the given "result" Matrix to a rotation matrix used to rotate an entity so that it looks at the target vector3, from the eye vector3 position, the up vector3 being oriented like "up".
	/// This function works in left handed mode
	external static void LookAtLHToRef(Vector3 eye, Vector3 target, Vector3 up, Matrix result);

	/// Gets a new rotation matrix used to rotate an entity so as it looks at the target vector3, from the eye vector3 position, the up vector3 being oriented like "up"
	/// This function works in right handed mode
	external static Matrix LookAtRH(Vector3 eye, Vector3 target, Vector3 up);

	/// Sets the given "result" Matrix to a rotation matrix used to rotate an entity so that it looks at the target vector3, from the eye vector3 position, the up vector3 being oriented like "up".
	/// This function works in right handed mode
	external static void LookAtRHToRef(Vector3 eye, Vector3 target, Vector3 up, Matrix result);

	/// Create a left-handed orthographic projection matrix
	external static Matrix OrthoLH(num width, num height, num znear, num zfar);

	/// Store a left-handed orthographic projection to a given matrix
	external static void OrthoLHToRef(num width, num height, num znear, num zfar, Matrix result);

	/// Create a left-handed orthographic projection matrix
	external static Matrix OrthoOffCenterLH(num left, num right, num bottom, num top, num znear, num zfar);

	/// Stores a left-handed orthographic projection into a given matrix
	external static void OrthoOffCenterLHToRef(num left, num right, num bottom, num top, num znear, num zfar, Matrix result);

	/// Creates a right-handed orthographic projection matrix
	external static Matrix OrthoOffCenterRH(num left, num right, num bottom, num top, num znear, num zfar);

	/// Stores a right-handed orthographic projection into a given matrix
	external static void OrthoOffCenterRHToRef(num left, num right, num bottom, num top, num znear, num zfar, Matrix result);

	/// Creates a left-handed perspective projection matrix
	external static Matrix PerspectiveFovLH(num fov, num aspect, num znear, num zfar);

	/// Stores a left-handed perspective projection into a given matrix
	external static void PerspectiveFovLHToRef(num fov, num aspect, num znear, num zfar, Matrix result, [bool isVerticalFovFixed]);

	/// Creates a right-handed perspective projection matrix
	external static Matrix PerspectiveFovRH(num fov, num aspect, num znear, num zfar);

	/// Stores a right-handed perspective projection into a given matrix
	external static void PerspectiveFovRHToRef(num fov, num aspect, num znear, num zfar, Matrix result, [bool isVerticalFovFixed]);

	/// Stores a perspective projection for WebVR info a given matrix
	external static void PerspectiveFovWebVRToRef(Object fov, num znear, num zfar, Matrix result, [bool rightHanded]);

	/// Creates a left-handed perspective projection matrix
	external static Matrix PerspectiveLH(num width, num height, num znear, num zfar);

	/// Computes a reflection matrix from a plane
	external static Matrix Reflection(Plane plane);

	/// Computes a reflection matrix from a plane
	external static void ReflectionToRef(Plane plane, Matrix result);

	/// Creates a new rotation matrix for "angle" radians around the given axis
	external static Matrix RotationAxis(Vector3 axis, num angle);

	/// Creates a new rotation matrix for "angle" radians around the given axis and stores it in a given matrix
	external static void RotationAxisToRef(Vector3 axis, num angle, Matrix result);

	/// Creates a new rotation matrix for "angle" radians around the X axis
	external static Matrix RotationX(num angle);

	/// Creates a new rotation matrix for "angle" radians around the X axis and stores it in a given matrix
	external static void RotationXToRef(num angle, Matrix result);

	/// Creates a new rotation matrix for "angle" radians around the Y axis
	external static Matrix RotationY(num angle);

	/// Creates a new rotation matrix for "angle" radians around the Y axis and stores it in a given matrix
	external static void RotationYToRef(num angle, Matrix result);

	/// Creates a rotation matrix
	external static Matrix RotationYawPitchRoll(num yaw, num pitch, num roll);

	/// Creates a rotation matrix and stores it in a given matrix
	external static void RotationYawPitchRollToRef(num yaw, num pitch, num roll, Matrix result);

	/// Creates a new rotation matrix for "angle" radians around the Z axis
	external static Matrix RotationZ(num angle);

	/// Creates a new rotation matrix for "angle" radians around the Z axis and stores it in a given matrix
	external static void RotationZToRef(num angle, Matrix result);

	/// Creates a scaling matrix
	external static Matrix Scaling(num x, num y, num z);

	/// Creates a scaling matrix and stores it in a given matrix
	external static void ScalingToRef(num x, num y, num z, Matrix result);

	/// Creates a translation matrix
	external static Matrix Translation(num x, num y, num z);

	/// Creates a translation matrix and stores it in a given matrix
	external static void TranslationToRef(num x, num y, num z, Matrix result);

	/// Compute the transpose of a given matrix
	external static Matrix Transpose(Matrix matrix);

	/// Compute the transpose of a matrix and store it in a target matrix
	external static void TransposeToRef(Matrix matrix, Matrix result);

	/// Creates a new zero matrix
	external static Matrix Zero();
}


