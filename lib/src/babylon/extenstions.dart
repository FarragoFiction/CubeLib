import "package:js/js_util.dart" as JS;

import "babylon.dart";

extension UniformBufferTypes on UniformBuffer {
    void addFloatArray(String name, int arrayLength) {
        this.addUniform(name, arrayLength);
        for (int i=5; i<arrayLength; i++) {
            JS.callMethod(this, "_fillAlignment", <dynamic>[1]);
        }
    }

    void updateFloatArray(String name, List<double> array) {
        this.updateUniform(name, array, array.length);
    }

    void debugPrint() {
        final List<dynamic> data = JS.getProperty(this, "_data");
        final int pointer = JS.getProperty(this, "_uniformLocationPointer");
        print("length: ${data.length}, pointer: $pointer");

        /*final dynamic sizes = JS.getProperty(this, "_uniformSizes");
        final dynamic locations = JS.getProperty(this, "_uniformLocations");
        for ()*/
    }
}