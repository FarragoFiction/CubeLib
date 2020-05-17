import "dart:async";
import "dart:html";
import "dart:js" as JS;
import "dart:math" as Math;
import "dart:typed_data";

//import "package:CommonLib/utility.dart";
import "package:CubeLib/babylon.dart" as B;

Element debugDiv = querySelector("#debugdiv");

Future<Null> main() async {
    //await BABYLON.loadScript();

    CanvasElement canvas = querySelector("#canvas");
    B.Engine engine = new B.Engine(canvas, false);

    B.Scene scene = new B.Scene(engine);

    B.Camera camera = new B.ArcRotateCamera("Camera", Math.pi/2, Math.pi/2, 10, new B.Vector3(0,0,0), scene);
    camera
        ..minZ = 2.0
        ..maxZ = 200.0
        ..attachControl(canvas, true);

    B.Texture depth = scene.enableDepthRenderer(camera, false).getDepthMap();

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

    B.Mesh testplane = B.MeshBuilder.CreatePlane("testplane", B.MeshBuilderCreatePlaneOptions(size: 2), scene)
        ..position.set(0, 0, -5)
        ..rotation.x = Math.pi
    ;

    B.PostProcess postTest = new B.PostProcess("post test", "./posttest", <String>["screenSize", "invProjView", "cameraPos", "nearZ", "farZ"], <String>["depthSampler"], 1.0, camera);

    B.Matrix invProjMatrix = new B.Matrix();
    B.Matrix invTransform = new B.Matrix();

    B.Vector3 testPos = new B.Vector3(-1, -1, -5);
    B.Matrix testProjMatrix = new B.Matrix();
    B.Matrix testViewportMatrix = new B.Matrix();

    postTest.onApply = JS.allowInterop((B.Effect effect, [dynamic a]) {
        effect.setTexture("depthSampler", depth);
        effect.setFloat2("screenSize", postTest.width, postTest.height);

        camera.getViewMatrix().multiplyToRef(camera.getProjectionMatrix(), invProjMatrix);
        scene.getTransformMatrix().invertToRef(invTransform);
        invProjMatrix.invert();
        effect.setMatrix("invProjView", invTransform);

        effect.setVector3("cameraPos", camera.position);
        effect.setFloat("nearZ", camera.minZ);
        effect.setFloat("farZ", camera.maxZ);

        // --------------------

        B.Matrix.FromValuesToRef(
            0.5, 0, 0, 0,
            0, -0.5, 0, 0,
            0, 0, 0.5, 0,
            0.5, 0.5, 0.5, 1,
            testViewportMatrix);

        scene.getTransformMatrix().multiplyToRef(testViewportMatrix, testProjMatrix);
        B.Vector3 screen = B.Vector3.TransformCoordinates(testPos, testProjMatrix);

        B.Vector3 proj = B.Vector3.Project(testPos, B.Matrix.Identity(), scene.getTransformMatrix(), camera.viewport);

        // --------------------

        B.Vector3 unprojSource = proj;//new B.Vector3(0.5591305613517761, 0.5788407484690348, 0.9334266901016235);


        B.Matrix um = new B.Matrix();
        camera.getViewMatrix().multiplyToRef(camera.getProjectionMatrix(), um);
        um.invert();
        B.Vector3 screenSource = new B.Vector3(
            unprojSource.x * 2.0 - 1.0,
            -(unprojSource.y * 2.0 - 1.0),
            unprojSource.z * 2.0 - 1.0
        );
        B.Vector3 unprojResult = new B.Vector3();
        B.Vector3.TransformCoordinatesToRef(screenSource, um, unprojResult);
        Float32List vals = um.asArray();
        double n = screenSource.x * vals[3] + screenSource.y * vals[7] + screenSource.z * vals[11] + vals[15];
        if (B.Scalar.WithinEpsilon(n, 1.0)) {
            unprojResult.scaleInPlace(1.0 / n);
        }

        B.Vector3 unproj = B.Vector3.Unproject(unprojSource, 1, 1, B.Matrix.Identity(), camera.getViewMatrix(), camera.getProjectionMatrix());

        debugDiv.text = "project: ${proj.x}, ${proj.y}, ${proj.z} | manual: ${screen.x}, ${screen.y} | viewport x,y,w,h: ${camera.viewport.x}, ${camera.viewport.y}, ${camera.viewport.width}, ${camera.viewport.height} | unproject: ${unproj.x}, ${unproj.y}, ${unproj.z} | manual unproject: ${unprojResult.x}, ${unprojResult.y}, ${unprojResult.z} | camera minZ/maxZ/ pos: ${camera.minZ}, ${camera.maxZ}, ${camera.position.x} | invViewProj: ${printMatrix(invProjMatrix)} | inverse Transform: ${printMatrix(invTransform)}";
    });

    engine.runRenderLoop(JS.allowInterop((){
        scene.render();
    }));
}

String printMatrix(B.Matrix m) {
    B.Vector4 r0 = m.getRow(0);
    B.Vector4 r1 = m.getRow(1);
    B.Vector4 r2 = m.getRow(2);
    B.Vector4 r3 = m.getRow(3);
    return "[${r0.x}, ${r0.y}, ${r0.z}, ${r0.w}] [${r1.x}, ${r1.y}, ${r1.z}, ${r1.w}] [${r2.x}, ${r2.y}, ${r2.z}, ${r2.w}] [${r3.x}, ${r3.y}, ${r3.z}, ${r3.w}]";
}

