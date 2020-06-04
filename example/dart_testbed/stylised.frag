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

uniform vec3 cameraPos;

uniform sampler2D depthSampler;
uniform sampler2D normalSampler;

varying vec4 vPosition;
varying vec3 vNormal;
varying vec2 vUV;
varying vec4 vColor;
varying mat3 vTBN;

float mapRange(float value, float inLower, float inUpper, float outLower, float outUpper) {
    float fraction = clamp((value - inLower) / (inUpper - inLower), 0.0,1.0);
    return outLower + fraction * (outUpper - outLower);
}

float lightStep(float brightness) {
    if (brightness < 0.1) {
        return brightness;
    } else if (brightness < 0.25) {
        return mapRange(brightness, 0.1, 0.25, 0.2, 0.25); //0.25;
    } else if (brightness < 0.5) {
        return mapRange(brightness, 0.25, 0.5, 0.35, 0.5); //0.5;
    } else if (brightness < 0.8) {
        return mapRange(brightness, 0.5, 0.8, 0.6, 0.85); //0.75;
    }
    return 1.0;
}

vec3 calculateNormal(vec3 normal, vec4 map) {
    vec3 n = map.rgb;
    n = n * 2.0 - 1.0;
    n = normalize(vTBN * n);
    return n;
}

void main() {
    vec4 colour = vec4(1.0,1.0,1.0,1.0);


    vec3 normal = vNormal;
    vec4 normalMap = texture2D(normalSampler, vUV);
    //if (vUV.x > 0.5) {
        normal = calculateNormal(normal, normalMap);
    //}

    //colour = normalMap;

    float mainLightFraction = dot(normalize(lightDirection), normal);

    colour.rgb = (colour.rgb * ambientLight) + // ambient term
    (colour.rgb * clamp(mainLightFraction, 0.0,1.0) * mainLight) + // main term
    (abs(clamp(mainLightFraction, -1.0, 0.0)) * fillLight); // filler term

    vec3 lightColour = vec3(0,0,0);
    float brightness = 0.0;

    vec3 toCamera = normalize(cameraPos - vPosition.xyz);
    bool isRim = dot(toCamera,normal) < 0.125;

    /*if (isRim) {
        lightColour += vec3(2.0,0.0,0.0);
    }*/

    vec3 rimColour = vec3(0,0,0);
    float rimBrightness = 0.0;

    for (int i=0; i<lightCount; i++) {
        if (lightRanges[i] < 0.1) {
            continue;
        }
        vec3 diff = lightPositions[i] - vPosition.xyz;
        float distance = length(diff);
        vec3 dir = normalize(diff);
        if (distance > lightRanges[i]) {
            continue;
        }
        float lightFraction = dot(dir, normal);
        float intensity = clamp(1.0 - (distance * distance) / (lightRanges[i] * lightRanges[i]), 0.0,1.0);
        intensity *= intensity;

        if (isRim && lightFraction < 0.0) {
            float rimFraction = clamp(-lightFraction, 0.0, 1.0) * clamp(-dot(dir, toCamera), 0.0, 1.0);
            rimColour += lightColours[i] * intensity * rimFraction;
            rimBrightness += intensity * rimFraction;
        }

        brightness += intensity * clamp(lightFraction, 0.0,1.0);
        lightColour += lightColours[i] * intensity * clamp(lightFraction, 0.0,1.0);;
        //colour.rgb += lightColours[i] * clamp(lightFraction, 0.0,1.0) * intensity;
    }

    if(brightness > 0.0) {
        colour.rgb += normalize(lightColour) * lightStep(brightness);
    }

    if (rimBrightness > 0.0) {
        colour.rgb += normalize(rimColour) * lightStep(rimBrightness);
    }
    //colour.rgb += lightColour;
    //colour.rgb = vTBN[0] * 0.5 + 0.5;
    gl_FragColor = colour;
    //gl_FragColor = vec4(1.0,1.0,1.0,1.0);
}