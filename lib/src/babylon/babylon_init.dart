import "dart:async";

import "package:LoaderLib/Loader.dart";

bool _scriptInit = false;

Future<Null> loadScript() async {
    if (!_scriptInit) {
        _scriptInit = true;
        await Loader.loadJavaScript("package:CubeLib/js/babylon.custom.js");
    }
}