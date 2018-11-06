@JS('BABYLON')
library Babylon;

import "package:js/js.dart";

@JS()
class Engine {
    external Engine(dynamic canvasOrContext, [bool antialias, EngineOptions options, bool adaptToDeviceRatio]);
}

@JS()
@anonymous
class EngineOptions {
    external factory EngineOptions({
        bool alpha,
        bool antialias,
        bool autoEnableWebVR,
        bool depth,
        bool deterministicLockstep,
        bool disableWebGL2Support,
        bool doNotHandleContextLost,
        bool failIfMajorPerformanceCaveat,
        num limitDeviceRatio,
        int lockstepMaxSteps,
        bool premultipliedAlpha,
        bool preserveDrawingBuffer,
        bool stencil,
    });
}