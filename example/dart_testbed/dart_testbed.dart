import "dart:async";
import "dart:html";
import "dart:js" as JS;
import "dart:math" as Math;

//import "package:CommonLib/utility.dart";
import "package:CubeLib/babylon.dart" as B;

Future<Null> main() async {
    //await BABYLON.loadScript();

    CanvasElement canvas = querySelector("#canvas");
    B.Engine engine = new B.Engine(canvas, true);

    B.Scene scene = new B.Scene(engine);

    B.Camera camera = new B.ArcRotateCamera("Camera", Math.pi/2, Math.pi/2, 10, new B.Vector3(0,0,0), scene);
    camera
        ..minZ = 0.2
        ..maxZ = 200.0
        ..attachControl(canvas, true);

    B.Texture depth = scene.enableDepthRenderer(camera).getDepthMap();

    B.Light light1 = new B.HemisphericLight("light1", new B.Vector3(1,1,0), scene);
    //B.Light light2 = new B.PointLight("light2", new B.Vector3(0,1,-1), scene);
    //B.DirectionalLight light2 = new B.DirectionalLight("light2", new B.Vector3(1,0.6,1), scene);

    //B.CascadedShadowGenerator shadows = new B.CascadedShadowGenerator(1024, light2);

    //B.Mesh sphere = B.MeshBuilder.CreateSphere("sphere", B.MeshBuilderCreateSphereOptions(diameter: 2), scene)
    B.Mesh sphere = B.MeshBuilder.CreateBox("sphere", B.MeshBuilderCreateBoxOptions(size: 2), scene)
        //..receiveShadows = true
        ..isVisible = false;

    //Random rand = new Random(1);
    Math.Random rand = new Math.Random(1);

    int range = 10;
    double spacing = 7.0;
    for (int x = -range; x<=range; x++) {
        for (int y = -range; y<=range; y++) {
            for (int z = -range; z<=range; z++) {
                B.InstancedMesh instance = sphere.createInstance("i_${x}_${y}_$z")
                    ..position.set(spacing * x, spacing * y, spacing * z)
                    ..rotation.set(rand.nextDouble() * Math.pi * 2, rand.nextDouble() * Math.pi * 2, 0)
                ;

                //shadows.getShadowMap().renderList.add(instance);
            }
        }
    }

    B.PostProcess postTest = new B.PostProcess("post test", "./posttest", <String>["screenSize", "highlightThreshold"], <String>["depthSampler"], 1.0, camera);

    postTest.onApply = JS.allowInterop((B.Effect effect, [dynamic a]) {
        effect.setTexture("depthSampler", depth);
        effect.setFloat2("screenSize", postTest.width, postTest.height);
        effect.setFloat("highlightThreshold", 0.90);
    });

    engine.runRenderLoop(JS.allowInterop((){
        scene.render();
    }));
}

