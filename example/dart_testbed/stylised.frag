precision highp float;
precision highp int;

uniform vec3 lightDirection;
uniform vec3 ambientLight;
uniform vec3 mainLight;
uniform vec3 fillLight;

// ###############################

const int lightCount = 100;
uniform vec3 lightPositions[lightCount];
uniform vec3 lightColours[lightCount];
uniform float lightRanges[lightCount];

// ###############################

varying vec4 vPosition;
varying vec3 vNormal;
varying vec2 vUV;
varying vec4 vColor;

void main() {
    vec4 colour = vec4(1.0,1.0,1.0,1.0);

    float mainLightFraction = dot(normalize(lightDirection), vNormal);

    colour.rgb = (colour.rgb * ambientLight) + // ambient term
    (colour.rgb * clamp(mainLightFraction, 0.0,1.0) * mainLight) + // main term
    (abs(clamp(mainLightFraction, -1.0, 0.0)) * fillLight); // filler term

    for (int i=0; i<lightCount; i++) {
        if (lightRanges[i] < 0.1) {
            continue;
        }
        vec3 diff = lightPositions[i] - vPosition.xyz;
        float distance = length(diff);
        if (distance > lightRanges[i]) {
            continue;
        }
        float lightFraction = dot(normalize(diff), vNormal);
        float intensity = clamp(1.0 - (distance * distance) / (lightRanges[i] * lightRanges[i]), 0.0,1.0);
        intensity *= intensity;
        colour.rgb += lightColours[i] * clamp(lightFraction, 0.0,1.0) * intensity;
    }

    gl_FragColor = colour;
    //gl_FragColor = vec4(1.0,1.0,1.0,1.0);
}