part of Babylon;


/// Class used to represent a viewport on screen
@JS()
class Viewport {
	external Viewport(num x, num y, num width, num height);

	// ### Member Fields ##############################

	/// viewport height
	external num get height;
	external void set height(num val);

	/// viewport width
	external num get width;
	external void set width(num val);

	/// viewport left coordinate
	external num get x;
	external void set x(num val);

	/// viewport top coordinate
	external num get y;
	external void set y(num val);

	// ### Member Methods ##############################

	/// Returns a new Viewport copied from the current one
	external Viewport clone();

	/// Creates a new viewport using absolute sizing (from 0-> width, 0-> height instead of 0->1)
	external Viewport toGlobal(dynamic renderWidthOrEngine, num renderHeight); // TODO: Type union: [number | Engine]

}


