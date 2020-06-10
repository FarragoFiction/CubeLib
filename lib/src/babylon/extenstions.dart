import "dart:js" as JS;
import "dart:typed_data";

import "package:js/js_util.dart" as JSU;

import "babylon.dart";

abstract class _UBOTempBuffers {
    static Map<int, Float32List> buffers = <int, Float32List>{};
    static Float32List getBuffer(int length) {
        if(!buffers.containsKey(length)) {
            buffers[length] = new Float32List(length);
        }
        return buffers[length];
    }
}

extension UniformBufferTypes on UniformBuffer {
    void addArray<T>(String name, List<T> array) {
        final int bufferLength = array.length * 4;
        this.addUniform(name, bufferLength);
        for (int i=4; i<bufferLength; i++) {
            JSU.callMethod(this, "_fillAlignment", <dynamic>[1]);
        }
    }

    void updateFloatArray(String name, List<double> array) {
        if (this.useUbo) {
            final List<double> tempBuffer = _UBOTempBuffers.getBuffer(array.length*4);
            for (int i=0; i<array.length; i++) {
                tempBuffer[i*4] = array[i];
            }
            this.updateUniform(name, tempBuffer, tempBuffer.length);
        } else {
            final dynamic e = JSU.getProperty(this, "_currentEffect");
            final Effect effect = e;
            effect.setFloatArray(name, array);
        }
    }

    void updateVector2Array(String name, List<Vector2> array) {
        if (this.useUbo) {
            final List<double> tempBuffer = _UBOTempBuffers.getBuffer(array.length*4);
            for (int i=0; i<array.length; i++) {
                tempBuffer[i*4] = array[i].x;
                tempBuffer[i*4+1] = array[i].y;
            }
            this.updateUniform(name, tempBuffer, tempBuffer.length);
        } else {
            final dynamic e = JSU.getProperty(this, "_currentEffect");
            final Effect effect = e;
            final List<double> tempBuffer = _UBOTempBuffers.getBuffer(array.length*2);
            for (int i=0; i<array.length; i++) {
                tempBuffer[i*2] = array[i].x;
                tempBuffer[i*2+1] = array[i].y;
            }
            effect.setFloatArray2(name, tempBuffer);
        }
    }

    void updateVector3Array(String name, List<Vector3> array) {
        if (this.useUbo) {
            final List<double> tempBuffer = _UBOTempBuffers.getBuffer(array.length*4);
            for (int i=0; i<array.length; i++) {
                tempBuffer[i*4] = array[i].x;
                tempBuffer[i*4+1] = array[i].y;
                tempBuffer[i*4+2] = array[i].z;
            }
            this.updateUniform(name, tempBuffer, tempBuffer.length);
        } else {
            final dynamic e = JSU.getProperty(this, "_currentEffect");
            final Effect effect = e;
            final List<double> tempBuffer = _UBOTempBuffers.getBuffer(array.length*3);
            for (int i=0; i<array.length; i++) {
                tempBuffer[i*3] = array[i].x;
                tempBuffer[i*3+1] = array[i].y;
                tempBuffer[i*3+2] = array[i].z;
            }
            effect.setFloatArray3(name, tempBuffer);
        }
    }

    void updateColor3Array(String name, List<Color3> array) {
        if (this.useUbo) {
            final List<double> tempBuffer = _UBOTempBuffers.getBuffer(array.length*4);
            for (int i=0; i<array.length; i++) {
                tempBuffer[i*4] = array[i].r;
                tempBuffer[i*4+1] = array[i].g;
                tempBuffer[i*4+2] = array[i].b;
            }
            this.updateUniform(name, tempBuffer, tempBuffer.length);
        } else {
            final dynamic e = JSU.getProperty(this, "_currentEffect");
            final Effect effect = e;
            final List<double> tempBuffer = _UBOTempBuffers.getBuffer(array.length*3);
            for (int i=0; i<array.length; i++) {
                tempBuffer[i*3] = array[i].r;
                tempBuffer[i*3+1] = array[i].g;
                tempBuffer[i*3+2] = array[i].b;
            }
            effect.setFloatArray3(name, tempBuffer);
        }
    }

    void debugPrint() {
        final List<dynamic> data = JSU.getProperty(this, "_data");
        final int pointer = JSU.getProperty(this, "_uniformLocationPointer");
        print("length: ${data.length}, pointer: $pointer");

        final dynamic sizes = JSU.getProperty(this, "_uniformSizes");
        final dynamic locations = JSU.getProperty(this, "_uniformLocations");

        final JS.JsObject console = JS.context["console"];
        console.callMethod("log", <dynamic>[sizes]);
        console.callMethod("log", <dynamic>[locations]);
    }
}