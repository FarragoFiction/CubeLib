

function main() {

    var canvas = document.getElementById("canvas");
    var engine = new BABYLON.Engine(canvas, true);

    var scene = new BABYLON.Scene(engine);

    var camera = new BABYLON.ArcRotateCamera("Camera", Math.PI / 2, Math.PI / 2, 2, new BABYLON.Vector3(0,0,5), scene);
    camera.attachControl(canvas, true);

    var light1 = new BABYLON.HemisphericLight("light1", new BABYLON.Vector3(1, 1, 0), scene);
    var light2 = new BABYLON.PointLight("light2", new BABYLON.Vector3(0, 1, -1), scene);

    var sphere = BABYLON.MeshBuilder.CreateSphere("sphere", {diameter:2}, scene);

    engine.runRenderLoop(function () {
        scene.render();
    });
}
window.addEventListener("DOMContentLoaded", main);