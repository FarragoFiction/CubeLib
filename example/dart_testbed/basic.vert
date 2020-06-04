precision highp float;
precision highp int;

// Attributes
attribute vec3 position;
attribute vec3 normal;
attribute vec2 uv;
attribute vec4 tangent;
attribute vec4 color;
#include<instancesDeclaration>
#include<bumpVertexDeclaration>

// Uniforms
uniform mat4 worldViewProjection;
uniform mat4 viewProjection;

// Varying
varying vec4 vPosition;
varying vec3 vNormal;
varying vec2 vUV;
varying vec4 vColor;


#include<helperFunctions>

void main() {
    vec3 normalUpdated = normal;
    vec4 tangentUpdated = tangent;

    #include<instancesVertex>
    #include<bumpVertex>
    vec4 p = vec4( position, 1. );

    mat3 normalWorld = mat3(finalWorld);
    normalWorld = transposeMat3(inverseMat3(normalWorld));
    vec3 normalVec = normalize(normalWorld * normal);

    vNormal = normalVec;
    vUV = uv;
    vColor = color;

    vPosition = finalWorld * p;
    gl_Position = viewProjection * vPosition;
}