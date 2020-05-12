console.log("hello from js");

window.TESTTHING = {
    blah: function() {
        console.log("whee");
    }
};

console.log("test:");
console.log(window.TESTTHING);
console.log("---");

import("/packages/CubeLib/js/babylon.js").then((module) => {
    console.log(module);

    new module.Engine();
});

