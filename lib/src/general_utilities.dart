import "package:js/js_util.dart" as JSU;

import "package:LoaderLib/Loader.dart";

import "../CubeLib.dart";

abstract class CubeLibUtils {
    static Future<void> registerShaderInclude(String name, String path) async {
        registerShaderIncludeString(name, await Loader.getResource(path, format: Formats.text));
    }

    static void registerShaderIncludeString(String name, String source) {
        final dynamic store = Effect.IncludesShadersStore;
        JSU.setProperty(store, name, source);
    }
}