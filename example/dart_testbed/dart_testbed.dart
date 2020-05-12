import "dart:async";
import "dart:html";
import "dart:js" as JS;
import "dart:math" as Math;

import "package:CubeLib/babylon.dart" as BABYLON;

Future<Null> main() async {
    //await BABYLON.loadScript();

    CanvasElement canvas = querySelector("#canvas");
    BABYLON.Engine engine = new BABYLON.Engine(canvas, true);

    BABYLON.Scene scene = new BABYLON.Scene(engine);

    BABYLON.Camera camera = new BABYLON.ArcRotateCamera("Camera", Math.pi/2, Math.pi/2, 2, new BABYLON.Vector3(0,0,5), scene);
    camera.attachControl(canvas, true);

    BABYLON.Light light1 = new BABYLON.HemisphericLight("light1", new BABYLON.Vector3(1,1,0), scene);
    BABYLON.Light light2 = new BABYLON.PointLight("light2", new BABYLON.Vector3(0,1,-1), scene);

    BABYLON.Mesh sphere = BABYLON.MeshBuilder.CreateSphere("sphere", BABYLON.MeshBuilderCreateSphereOptions(diameter: 2), scene);

    engine.runRenderLoop(JS.allowInterop((){
        scene.render();
    }));
}

