part of Babylon;

// ### Color3 ##############################


/// Class used to hold a RBG color
@JS()
class Color3 {
	external Color3([num r, num g, num b]);

	// ### Member Fields ##############################

	/// Defines the blue component (between 0 and 1, default is 0)
	external num get b;
	external void set b(num val);

	/// Defines the green component (between 0 and 1, default is 0)
	external num get g;
	external void set g(num val);

	/// Defines the red component (between 0 and 1, default is 0)
	external num get r;
	external void set r(num val);

	// ### Member Methods ##############################

	/// Creates a new Color3 set with the added values of the current Color3 and of the given one
	external Color3 add(Color3 otherColor);

	/// Stores the result of the addition of the current Color3 and given one rgb values into "result"
	external Color3 addToRef(Color3 otherColor, Color3 result);

	/// Returns a new array populated with 3 numeric elements : red, green and blue values
	external List<num> asArray();

	/// Clamps the rgb values by the min and max values and stores the result into "result"
	external Color3 clampToRef(dynamic min, dynamic max, Color3 result); // TODO: Type union: [number | undefined], Type union: [number | undefined]

	/// Copy the current object
	external Color3 clone();

	/// Copies the rgb values from the source in the current Color3
	external Color3 copyFrom(Color3 source);

	/// Updates the Color3 rgb values from the given floats
	external Color3 copyFromFloats(num r, num g, num b);

	/// Determines equality between Color3 objects
	external bool equals(Color3 otherColor);

	/// Determines equality between the current Color3 object and a set of r,b,g values
	external bool equalsFloats(num r, num g, num b);

	/// Returns the string "Color3"
	external String getClassName();

	/// Compute the Color3 hash code
	external num getHashCode();

	/// Multiply each Color3 rgb values by the given Color3 rgb values in a new Color3 object
	external Color3 multiply(Color3 otherColor);

	/// Multiply the rgb values of the Color3 and the given Color3 and stores the result in the object "result"
	external Color3 multiplyToRef(Color3 otherColor, Color3 result);

	/// Multiplies in place each rgb value by scale
	external Color3 scale(num scale);

	/// Scale the current Color3 values by a factor and add the result to a given Color3
	external Color3 scaleAndAddToRef(num scale, Color3 result);

	/// Multiplies the rgb values by scale and stores the result into "result"
	external Color3 scaleToRef(num scale, Color3 result);

	/// Updates the Color3 rgb values from the given floats
	external Color3 set(num r, num g, num b);

	/// Returns a new Color3 set with the subtracted values of the given one from the current Color3
	external Color3 subtract(Color3 otherColor);

	/// Stores the result of the subtraction of given one from the current Color3 rgb values into "result"
	external Color3 subtractToRef(Color3 otherColor, Color3 result);

	/// Stores in the given array from the given starting index the red, green, blue values as successive elements
	external Color3 toArray(List<double> array, [num index]);

	/// Returns a new Color4 object from the current Color3 and the given alpha
	external Color4 toColor4([num alpha]);

	/// Computes a new Color3 converted from the current one to gamma space
	external Color3 toGammaSpace();

	/// Converts the Color3 values to gamma space and stores the result in "convertedColor"
	external Color3 toGammaSpaceToRef(Color3 convertedColor);

	/// Compute the Color3 hexadecimal code as a string
	external String toHexString();

	/// Computes a new Color3 converted from the current one to linear space
	external Color3 toLinearSpace();

	/// Converts the Color3 values to linear space and stores the result in "convertedColor"
	external Color3 toLinearSpaceToRef(Color3 convertedColor);

	/// Returns the luminance value
	external num toLuminance();

	/// Creates a string with the Color3 current values
	external String toString();

	// ### Static Methods ##############################

	/// Returns a Color3 value containing a black color
	external static Color3 Black();

	/// Returns a Color3 value containing a blue color
	external static Color3 Blue();

	/// Creates a new Vector3 from the starting index of the given array
	external static Color3 FromArray(List<num> array, [num offset]);

	/// Creates a new Color3 from the string containing valid hexadecimal values
	external static Color3 FromHexString(String hex);

	/// Creates a new Color3 from integer values (< 256)
	external static Color3 FromInts(num r, num g, num b);

	/// Returns a Color3 value containing a gray color
	external static Color3 Gray();

	/// Returns a Color3 value containing a green color
	external static Color3 Green();

	/// Creates a new Color3 with values linearly interpolated of "amount" between the start Color3 and the end Color3
	external static Color3 Lerp(Color3 start, Color3 end, num amount);

	/// Creates a new Color3 with values linearly interpolated of "amount" between the start Color3 and the end Color3
	external static void LerpToRef(Color3 left, Color3 right, num amount, Color3 result);

	/// Returns a Color3 value containing a magenta color
	external static Color3 Magenta();

	/// Returns a Color3 value containing a purple color
	external static Color3 Purple();

	/// Returns a Color3 value containing a random color
	external static Color3 Random();

	/// Returns a Color3 value containing a red color
	external static Color3 Red();

	/// Returns a Color3 value containing a teal color
	external static Color3 Teal();

	/// Returns a Color3 value containing a white color
	external static Color3 White();

	/// Returns a Color3 value containing a yellow color
	external static Color3 Yellow();
}

// ### Color4 ##############################


/// Class used to hold a RBGA color
@JS()
class Color4 {
	external Color4([num r, num g, num b, num a]);

	// ### Member Fields ##############################

	/// Defines the alpha component (between 0 and 1, default is 1)
	external num get a;
	external void set a(num val);

	/// Defines the blue component (between 0 and 1, default is 0)
	external num get b;
	external void set b(num val);

	/// Defines the green component (between 0 and 1, default is 0)
	external num get g;
	external void set g(num val);

	/// Defines the red component (between 0 and 1, default is 0)
	external num get r;
	external void set r(num val);

	// ### Member Methods ##############################

	/// Creates a new Color4 set with the added values of the current Color4 and of the given one
	external Color4 add(Color4 right);

	/// Adds in place the given Color4 values to the current Color4 object
	external Color4 addInPlace(Color4 right);

	/// Creates a new array populated with 4 numeric elements : red, green, blue, alpha values
	external List<num> asArray();

	/// Clamps the rgb values by the min and max values and stores the result into "result"
	external Color4 clampToRef(dynamic min, dynamic max, Color4 result); // TODO: Type union: [number | undefined], Type union: [number | undefined]

	/// Creates a new Color4 copied from the current one
	external Color4 clone();

	/// Copies the given Color4 values into the current one
	external Color4 copyFrom(Color4 source);

	/// Copies the given float values into the current one
	external Color4 copyFromFloats(num r, num g, num b, num a);

	/// Determines equality between Color4 objects
	external bool equals(Color4 otherColor);

	/// Returns the string "Color4"
	external String getClassName();

	/// Compute the Color4 hash code
	external num getHashCode();

	/// Multipy an Color4 value by another and return a new Color4 object
	external Color4 multiply(Color4 color);

	/// Multipy a Color4 value by another and push the result in a reference value
	external Color4 multiplyToRef(Color4 color, Color4 result);

	/// Creates a new Color4 with the current Color4 values multiplied by scale
	external Color4 scale(num scale);

	/// Scale the current Color4 values by a factor and add the result to a given Color4
	external Color4 scaleAndAddToRef(num scale, Color4 result);

	/// Multiplies the current Color4 values by scale and stores the result in "result"
	external Color4 scaleToRef(num scale, Color4 result);

	/// Copies the given float values into the current one
	external Color4 set(num r, num g, num b, num a);

	/// Creates a new Color4 set with the subtracted values of the given one from the current Color4
	external Color4 subtract(Color4 right);

	/// Subtracts the given ones from the current Color4 values and stores the results in "result"
	external Color4 subtractToRef(Color4 right, Color4 result);

	/// Stores from the starting index in the given array the Color4 successive values
	external Color4 toArray(List<num> array, [num index]);

	/// Computes a new Color4 converted from the current one to gamma space
	external Color4 toGammaSpace();

	/// Converts the Color4 values to gamma space and stores the result in "convertedColor"
	external Color4 toGammaSpaceToRef(Color4 convertedColor);

	/// Compute the Color4 hexadecimal code as a string
	external String toHexString();

	/// Computes a new Color4 converted from the current one to linear space
	external Color4 toLinearSpace();

	/// Converts the Color4 values to linear space and stores the result in "convertedColor"
	external Color4 toLinearSpaceToRef(Color4 convertedColor);

	/// Creates a string with the Color4 current values
	external String toString();

	// ### Static Methods ##############################

	/// Check the content of a given array and convert it to an array containing RGBA data
	/// If the original array was already containing count * 4 values then it is returned directly
	external static List<num> CheckColors4(List<num> colors, num count);

	/// Creates a new Color4 from the starting index element of the given array
	external static Color4 FromArray(List<num> array, [num offset]);

	/// Creates a new Color4 from a Color3 and an alpha value
	external static Color4 FromColor3(Color3 color3, [num alpha]);

	/// Creates a new Color4 from the string containing valid hexadecimal values
	external static Color4 FromHexString(String hex);

	/// Creates a new Color3 from integer values (< 256)
	external static Color4 FromInts(num r, num g, num b, num a);

	/// Creates a new Color4 object set with the linearly interpolated values of "amount" between the left Color4 object and the right Color4 object
	external static Color4 Lerp(Color4 left, Color4 right, num amount);

	/// Set the given "result" with the linearly interpolated values of "amount" between the left Color4 object and the right Color4 object
	external static void LerpToRef(Color4 left, Color4 right, num amount, Color4 result);
}

// ### Color3Gradient ##############################


/// Class used to store color 3 gradient
@JS()
class Color3Gradient {
	// ### Member Fields ##############################

	/// Gets or sets the associated color
	external Color3 get color;
	external void set color(Color3 val);

	/// Gets or sets the gradient value (between 0 and 1)
	external num get gradient;
	external void set gradient(num val);

}

// ### ColorGradient ##############################


/// Class used to store color4 gradient
@JS()
class ColorGradient {
	// ### Member Fields ##############################

	/// Gets or sets first associated color
	external Color4 get color1;
	external void set color1(Color4 val);

	/// Gets or sets second associated color
	external Color4 get color2;
	external void set color2(Color4 val);

	/// Gets or sets the gradient value (between 0 and 1)
	external num get gradient;
	external void set gradient(num val);

	// ### Member Methods ##############################

	/// Will get a color picked randomly between color1 and color2.
	/// If color2 is undefined then color1 will be used
	external void getColorToRef(Color4 result);

}


