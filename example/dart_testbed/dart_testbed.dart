import "dart:async";
import "dart:html";
import "dart:js" as JS;
import "dart:math" as Math;
import "dart:typed_data";

import "package:CommonLib/Utility.dart";
import "package:CubeLib/CubeLib.dart" as B;
import "package:CubeLib/Formats.dart";
import "package:LoaderLib/Loader.dart";

Element debugDiv = querySelector("#debugdiv");

Future<void> main() async {
    testRendering();
    //testPngCodec();
}

Future<void> testRendering() async {
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
    //scene.enableGeometryBufferRenderer()..enablePosition = true..;

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
    final List<B.Vector2> lightInfo = new List<B.Vector2>.generate(lightCount, (int i) => new B.Vector2());

    final B.UniformBuffer ubo = new B.UniformBuffer(engine, null, true)
        ..addVector3("cameraPos", camera.position)
        ..addFloat2("cameraDepth", camera.minZ, camera.maxZ)
        ..addVector3("lightDirection", B.Vector3(0.1,1.0,0.3))//light1.direction)
        ..addColor3("mainLight", B.Color3(0.08,0.08,0.075))
        ..addColor3("fillLight", B.Color3(0.05,0.05,0.055))
        ..addColor3("ambientLight", B.Color3(0.15,0.15,0.15))
        ..addArray("lightPositions", lightPositions)
        ..addArray("lightColours", lightColours)
        ..addArray("lightInfo", lightInfo)
        ..addFloat2("fogInfo", 10, 80)
        ..addColor3("fogColour", new B.Color3(scene.clearColor.r, scene.clearColor.g, scene.clearColor.b))//0.5,0.5,0.6))
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
        samplers: <String>["diffuseSampler", "normalSampler", "lightSampler", "bayerMatrix"],
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

    final TextureFormat textureFormat = new TextureFormat(scene);

    await Loader.loadDataPack("testtextures.zip");

    final B.Texture normalTest = await Loader.getResource("assets/testbox_normal.png", format: textureFormat);
    final B.Texture diffuseTest = await Loader.getResource("assets/testbox_diffuse.png", format: textureFormat);
    final B.Texture lightTest = await Loader.getResource("assets/testbox_light.png", format: textureFormat);

    final B.Texture defaultNormalTexture = new B.RawTexture(new Uint8ClampedList.fromList(<int>[128,128,255]), 1,1, B.Engine.TEXTUREFORMAT_RGB, scene);
    final B.Texture defaultLightTexture = new B.RawTexture(new Uint8ClampedList.fromList(<int>[128,128,0]), 1,1, B.Engine.TEXTUREFORMAT_RGB, scene);
    final B.Texture bayerMatrix = new B.RawTexture(new Uint8ClampedList.fromList(<int>[
         0, 32,  8, 40,  2, 34, 10, 42,
        48, 16, 56, 24, 50, 18, 58, 26,
        12, 44,  4, 36, 14, 46,  6, 38,
        60, 28, 52, 20, 62, 30, 54, 22,
         3, 35, 11, 43,  1, 33,  9, 41,
        51, 19, 59, 27, 49, 17, 57, 25,
        15, 47,  7, 39, 13, 45,  5, 37,
        63, 31, 55, 23, 61, 29, 53, 21
    ]), 8,8, B.Engine.TEXTUREFORMAT_LUMINANCE, scene, false, false, B.Texture.NEAREST_SAMPLINGMODE, B.Engine.TEXTURETYPE_UNSIGNED_BYTE)
        ..wrapU = B.Texture.WRAP_ADDRESSMODE
        ..wrapV = B.Texture.WRAP_ADDRESSMODE
    ;

    //B.Mesh sphere = B.MeshBuilder.CreateSphere("sphere", B.MeshBuilderCreateSphereOptions(diameter: 2), scene)
    B.Mesh object = B.MeshBuilder.CreateBox("box", B.MeshBuilderCreateBoxOptions(size: 2), scene)
        ..material = material
        //..receiveShadows = true
        //..isVisible = false
    ;
    B.TangentBuilder.computeTangents(object);

    B.Mesh testSphere = B.MeshBuilder.CreateSphere("testSphere", B.MeshBuilderCreateSphereOptions(diameter:4), scene)
        ..material = material
        ..position.set(5, 0, 0);
    B.TangentBuilder.computeTangents(testSphere);

    /*B.Mesh testCylinder = B.MeshBuilder.CreateCylinder("testCylinder", B.MeshBuilderCreateCylinderOptions(diameter:2), scene)
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
            //..setTexture("normalSampler", defaultNormalTexture)
            ..setVector4("normalParams", new B.Vector4(0.025, 1.0, 0.1, 0.0))
            //..setTexture("lightSampler", defaultLightTexture)
            ..setTexture("lightSampler", lightTest)
            ..setTexture("diffuseSampler", diffuseTest)
            ..setTexture("bayerMatrix", bayerMatrix)
        ;

        for (int i=0; i<lightCount; i++) {
            lightInfo[i].x = 0;
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
            lightInfo[b].x = uLight.range;
            lightInfo[b].y = uLight.intensity;

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
            ..updateVector2Array("lightInfo", lightInfo)
            ..update()
        ;
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

Future<void> testPngCodec() async {
    final ImageElement img = await Loader.getResource("ipu.png");
    final int w = img.naturalWidth;
    final int h = img.naturalHeight;
    final CanvasElement canvas = new CanvasElement(width: w, height: h);
    final CanvasRenderingContext2D ctx = canvas.context2D;

    ctx.drawImage(img, 0, 0);

    final ImageData iData = ctx.getImageData(0,0,w,h);

    for (int i=3; i<iData.data.length; i+=4) {
        iData.data[i] = 255;
    }

    ctx.putImageData(iData, 0, 0);

    document.body.append(canvas);
}