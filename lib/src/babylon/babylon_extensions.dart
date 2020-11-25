@JS("BABYLON")
library BabylonExtensions;

import "dart:html";
import "package:js/js.dart";

import "babylon.dart";
import "babylon_debug.dart";
import "interop_globals.dart";

@anonymous
@JS()
class ShaderMaterialShaderPath {
    external factory ShaderMaterialShaderPath({
        String vertex, String fragment,
        ScriptElement vertexElement, ScriptElement fragmentElement,
        String vertexSource, String fragmentSource
    });
}

@JS()
class ShaderMaterialWithAlphaTestTexture extends ShaderMaterial {
    external factory ShaderMaterialWithAlphaTestTexture(String name, Scene scene, dynamic shaderPath, [IShaderMaterialOptions options, Texture alphaTexture]);
}

@JS()
class Vector2WithCallback extends Vector2 {
    external factory Vector2WithCallback(num x, num y);

    external void extension_setCallback(void Function(Vector2) callback);
}