import "dart:async";
import "dart:html";

import "package:CubeLib/Babylon.dart" as BABYLON;

Future<Null> main() async {
    await BABYLON.loadScript();

    BABYLON.Engine engine = new BABYLON.Engine(querySelector("#canvas"));
    print(BABYLON.Engine.ALPHA_ADD);
}

