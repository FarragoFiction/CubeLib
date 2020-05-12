import "dart:html";

import "package:LoaderLib/Loader.dart";

Future<ScriptElement> loadScript() => Loader.loadJavaScript("package:CubeLib/js/babylon.js");
