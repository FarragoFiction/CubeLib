import "dart:async";
import "dart:html";
import "dart:js" as JS;
import "dart:math" as Math;
import "dart:typed_data";

import "package:CommonLib/Utility.dart";
import "package:CubeLib/CubeLib.dart" as B;
import "package:LoaderLib/Loader.dart";

Element debugDiv = querySelector("#debugdiv");

Future<void> main() async {
    //await BABYLON.loadScript();

    final CanvasElement canvas = querySelector("#canvas");
    final B.Engine engine = new B.Engine(canvas, false,
        //B.EngineOptions(disableWebGL2Support: true)
    );

    final B.Scene scene = new B.Scene(engine);

    final B.Camera camera = new B.ArcRotateCamera("Camera", Math.pi/2, Math.pi/2, 10, new B.Vector3(0,0,0), scene);
    camera
        //..minZ = 2.0
        ..maxZ = 500.0
        ..attachControl(canvas, true);

    final B.Texture depth = scene.enableDepthRenderer(camera, false).getDepthMap();

    //B.HemisphericLight light1 = new B.HemisphericLight("light1", new B.Vector3(1,1,0), scene)
    //..diffuse.set(0.15, 0.15, 0.15);
    //B.Light light2 = new B.PointLight("light2", new B.Vector3(0,1,-1), scene);
    //B.DirectionalLight light2 = new B.DirectionalLight("light2", new B.Vector3(1,0.6,1), scene);

    //B.CascadedShadowGenerator shadows = new B.CascadedShadowGenerator(1024, light2);

    final String mspaVert = await Loader.getResource("basic.vert");
    final String mspaFrag = await Loader.getResource("stylised.frag");
    await B.CubeLibUtils.registerShaderInclude("commonUBO", "shaderIncludes.fx");

    const int lightCount = 100;
    final List<B.Vector3> lightPositions = new List<B.Vector3>(lightCount);
    final List<B.Color3> lightColours = new List<B.Color3>(lightCount);
    final List<double> lightRanges = new Float32List(lightCount);

    final B.UniformBuffer ubo = new B.UniformBuffer(engine, null, true)
        ..addVector3("cameraPos", camera.position)
        ..addFloat2("cameraDepth", camera.minZ, camera.maxZ)
        ..addVector3("lightDirection", B.Vector3(0.1,1.0,0.3))//light1.direction)
        ..addColor3("mainLight", B.Color3(0.08,0.08,0.075))
        ..addColor3("fillLight", B.Color3(0.05,0.05,0.055))
        ..addColor3("ambientLight", B.Color3(0.15,0.15,0.15))
        ..addVector3Array("lightPositions", lightPositions)
        ..addColor3Array("lightColours", lightColours)
        ..addFloatArray("lightRanges", lightRanges)
        ..create()
    ;

    final B.ShaderMaterial material = new B.ShaderMaterial("stylised", scene, B.ShaderMaterialShaderPath(
        vertexSource: mspaVert,
        fragmentSource: mspaFrag
    ), B.IShaderMaterialOptions(
        attributes: <String>["position", "normal", "uv", "color", "tangent", "world0","world1","world2","world3"],
        uniforms: <String>["world", "viewProjection", "worldViewProjection", "cameraPos", "cameraDepth", "normalParams",
            "lightDirection", "mainLight", "fillLight", "ambientLight", "lightPositions", "lightColours", "lightRanges"
        ],
        samplers: <String>["normalSampler"],
        uniformBuffers: <String>["CommonUBO"],
        defines: <String>[
            "#define NORMAL",
            "#define TANGENT",
            "#define BUMP",
            "#define DEPTH",
            if (engine.supportsUniformBuffers) "#define UBO",
            //"#define INSTANCES",
        ]
    ));

    final B.Texture normalTest = await awaitify((Lambda<B.Texture> consumer) {
        B.Texture t;
        t = new B.Texture("normaltest.png", scene, false, true, B.Texture.BILINEAR_SAMPLINGMODE, JS.allowInterop(() { consumer(t); }));
    });

    //B.Mesh sphere = B.MeshBuilder.CreateSphere("sphere", B.MeshBuilderCreateSphereOptions(diameter: 2), scene)
    B.Mesh object = B.MeshBuilder.CreateBox("box", B.MeshBuilderCreateBoxOptions(size: 2), scene)
        ..material = material
        //..receiveShadows = true
        //..isVisible = false
    ;
    B.TangentBuilder.computeTangents(object);

    /*B.Mesh testSphere = B.MeshBuilder.CreateSphere("testSphere", B.MeshBuilderCreateSphereOptions(diameter:4), scene)
        ..material = material
        ..position.set(5, 0, 0);
    B.TangentBuilder.computeTangents(testSphere);

    B.Mesh testCylinder = B.MeshBuilder.CreateCylinder("testCylinder", B.MeshBuilderCreateCylinderOptions(diameter:2), scene)
        ..material = material
        ..position.set(-5, 0, 0);
    B.TangentBuilder.computeTangents(testCylinder);

    B.Mesh testHedron = B.MeshBuilder.CreatePolyhedron("testHedron", B.MeshBuilderCreatePolyhedronOptions(type: 1, size:1), scene)
        ..material = material
        ..position.set(0, 0, -5);
    B.TangentBuilder.computeTangents(testHedron);

    B.Mesh testKnot = B.MeshBuilder.CreateTorusKnot("testKnot", B.MeshBuilderCreateTorusKnotOptions(radius: 3, tubularSegments: 16, radialSegments: 128), scene)
        ..material = material
        ..position.set(0, 0, 5);
    B.TangentBuilder.computeTangents(testKnot);*/

    //Random rand = new Random(1);
    final Math.Random rand = new Math.Random(1);

    const int range = 6;
    const double spacing = 7.0;
    final List<B.Mesh> objects = <B.Mesh>[];

    for (int x = -range; x<=range; x++) {
        for (int y = -range; y<=range; y++) {
            for (int z = -range; z<=range; z++) {
                if(x == 0 && y == 0 && z == 0) {
                    objects.add(object
                        ..position.set(spacing * x, spacing * y, spacing * z)
                        ..rotation.set(rand.nextDouble() * Math.pi * 2, rand.nextDouble() * Math.pi * 2, 0)
                    );
                    //object.createInstance("test");
                } else {
                    objects.add(object.clone("i_${x}_${y}_$z")
                        ..position.set(spacing * x, spacing * y, spacing * z)
                        ..rotation.set(rand.nextDouble() * Math.pi * 2, rand.nextDouble() * Math.pi * 2, 0)
                    );
                }

                /*B.InstancedMesh instance = object.createInstance("i_${x}_${y}_$z")
                    ..position.set(spacing * x, spacing * y, spacing * z)
                    ..rotation.set(rand.nextDouble() * Math.pi * 2, rand.nextDouble() * Math.pi * 2, 0)
                ;*/

                //shadows.getShadowMap().renderList.add(instance);
            }
        }
    }
    object = B.Mesh.MergeMeshes(objects)
        ..alwaysSelectAsActiveMesh = true
        ..doNotSyncBoundingInfo = true
        ..freezeWorldMatrix()
    ;



    final B.TransformNode lightNode = new B.Mesh("lightParent", scene);
    const double scatterRange = 2 * range * spacing;

    for(int i=0; i<lightCount; i++) {
        new B.PointLight("PointLight$i", new B.Vector3((rand.nextDouble() - 0.5) * scatterRange, (rand.nextDouble() - 0.5) * scatterRange, (rand.nextDouble() - 0.5) * scatterRange), scene)
            ..diffuse.set(rand.nextDouble() * 0.75 + 0.25, rand.nextDouble() * 0.75 + 0.25, rand.nextDouble() * 0.75 + 0.25)
        //..diffuse.set(1, 0, 0)
            ..range = spacing * 3
            ..parent = lightNode

        ;
    }

    object.onBeforeDrawObservable.add(JS.allowInterop((dynamic a, dynamic b) {
        //print("object");
        material
            ..setTexture("normalSampler", normalTest)
            ..setVector4("normalParams", new B.Vector4(0.025, 1.0, 0.1, 0.0))
        ;
        //print(normalTest.getSize());

        for (int i=0; i<lightCount; i++) {
            lightRanges[i] = 0;
        }
        int b = 0;
        B.Vector3 pos;
        for (final B.Light iLight in scene.lights) {
            final B.ShadowLight uLight = iLight;
            if (uLight.getClassName() != "PointLight") {
                continue;
            }
            uLight.computeTransformedInformation();
            pos = uLight.getAbsolutePosition();

            lightPositions[b] = pos;
            lightColours[b] = uLight.diffuse;
            lightRanges[b] = uLight.range;

            b++;
            if (b >= lightCount) {
                break;
            }
        }
        ubo.bindToEffect(material.getEffect(), "CommonUBO");
        ubo
            ..updateVector3("cameraPos", camera.position)
            ..updateVector3Array("lightPositions", lightPositions)
            ..updateColor3Array("lightColours", lightColours)
            ..updateFloatArray("lightRanges", lightRanges)
            ..update()
        ;

        /*
        for (int i=0; i<object.lightSources.length; i++) {
            final B.ShadowLight uLight = object.lightSources[i];
            if (uLight.getClassName() != "PointLight") {
                continue;
            }
            uLight.computeTransformedInformation();
            pos = uLight.getAbsolutePosition();

            lightPositions[b * 3] = pos.x;
            lightPositions[b * 3 + 1] = pos.y;
            lightPositions[b * 3 + 2] = pos.z;
            lightColours[b] = uLight.diffuse;
            lightRanges[b] = uLight.range;
            b++;
            if (b >= lightCount) {
                break;
            }
        }
        material
            ..setArray3("lightPositions", lightPositions)
            ..setColor3Array("lightColours", lightColours)
            ..setFloats("lightRanges", lightRanges);*/

        lightNode.rotation.addInPlaceFromFloats(0.002, 0.005, -0.0005);
        //print(lightNode.position);
    }));



    /*B.Mesh testplane = B.MeshBuilder.CreatePlane("testplane", B.MeshBuilderCreatePlaneOptions(size: 2), scene)
        ..position.set(0, 0, -5)
        ..rotation.x = Math.pi
    ;*/

    B.PostProcess postTest = new B.PostProcess("post test", "./posttest", <String>["screenSize", "invProjView", "nearZ", "farZ"], <String>["depthSampler"], 1.0, camera);

    B.Matrix invTransform = new B.Matrix();

    postTest.onApply = JS.allowInterop((B.Effect effect, [dynamic a]) {
        //print("post");
        effect.setTexture("depthSampler", depth);
        effect.setFloat2("screenSize", postTest.width, postTest.height);

        scene.getTransformMatrix().invertToRef(invTransform);
        effect.setMatrix("invProjView", invTransform);

        effect.setFloat("nearZ", camera.minZ);
        effect.setFloat("farZ", camera.maxZ);
    });

    engine.runRenderLoop(JS.allowInterop((){
        scene.render();
    }));

    document.body.append(new DivElement()..append(new ButtonElement()..text="show inspector"..onClick.listen((MouseEvent e) { scene.debugLayer.show(); })));
}

String printMatrix(B.Matrix m) {
    B.Vector4 r0 = m.getRow(0);
    B.Vector4 r1 = m.getRow(1);
    B.Vector4 r2 = m.getRow(2);
    B.Vector4 r3 = m.getRow(3);
    return "[${r0.x}, ${r0.y}, ${r0.z}, ${r0.w}] [${r1.x}, ${r1.y}, ${r1.z}, ${r1.w}] [${r2.x}, ${r2.y}, ${r2.z}, ${r2.w}] [${r3.x}, ${r3.y}, ${r3.z}, ${r3.w}]";
}

