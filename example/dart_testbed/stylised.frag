precision highp float;
precision highp int;

#include<commonUBO>

uniform sampler2D diffuseSampler;
uniform sampler2D normalSampler;
uniform vec4 normalParams;
uniform sampler2D lightSampler;
uniform sampler2D bayerMatrix;

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

vec3 calculateNormal(vec3 normal, vec4 map, float depth) {
    vec3 n = map.rgb;
    n = n * 2.0 - 1.0;

    float scale = mapRange(depth, normalParams.x, normalParams.z, normalParams.y, normalParams.w);

    n.xy *= scale;
    n = normalize(n);

    n = normalize(vTBN * n);

    return n;
}

void main() {
    vec4 diffuse = texture2D(diffuseSampler, vUV);
    vec4 colour = diffuse;

    vec3 cameraDiff = cameraPos - vPosition.xyz;
    vec3 cameraDir = normalize(cameraDiff);
    float cameraDist = length(cameraDiff);
    float depth = clamp((cameraDist - cameraDepth.x) / (cameraDepth.y - cameraDepth.x), 0.0,1.0);

    float fogVal = mapRange(cameraDist, fogInfo.x, fogInfo.y, 0.0, 1.0);

    vec3 normal = vNormal;
    vec4 normalMap = texture2D(normalSampler, vUV);
    //if (vUV.x > 0.5) {
        normal = calculateNormal(normal, normalMap, depth);
    //}

    vec4 lightMap = texture2D(lightSampler, vUV);

    //colour = normalMap;

    bool isRim = dot(cameraDir,normal) < 0.1;//0.125;

    float mainLightFraction = dot(normalize(lightDirection), normal);

    colour.rgb *= ((colour.rgb * ambientLight) + // ambient term
    (colour.rgb * clamp(mainLightFraction, 0.0,1.0) * mainLight) + // main term
    (abs(clamp(mainLightFraction, -1.0, 0.0)) * fillLight)); // filler term

    colour.rgb += diffuse.rgb * lightMap.z; // emissive term

    vec3 lightColour = vec3(0,0,0);
    float brightness = 0.0;

    vec3 rimColour = vec3(0,0,0);
    float rimBrightness = 0.0;

    vec3 specularColour = vec3(0,0,0);
    float specularBrightness = 0.0;

    for (int i=0; i<lightCount; i++) {
        float range = lightInfo[i].x;
        if (range < 0.1) {
            continue;
        }
        vec3 diff = lightPositions[i] - vPosition.xyz;
        float distance = length(diff);
        vec3 dir = normalize(diff);
        if (distance > range) {
            continue;
        }
        float lightFraction = dot(dir, normal);
        float intensity = clamp(1.0 - (distance * distance) / (range * range), 0.0,1.0);
        intensity *= intensity;

        if (isRim && lightFraction < 0.0) {
            float rimFraction = clamp(-lightFraction, 0.0, 1.0) * clamp(-dot(dir, cameraDir), 0.0, 1.0);
            rimColour += lightColours[i] * intensity * rimFraction;
            rimBrightness += intensity * rimFraction;
        }

        if (lightFraction > 0.0) {
            vec3 halfVector = normalize(dir + cameraDir);
            float specularFraction = clamp(dot(halfVector, normal), 0.0,1.0);
            float specularVal = pow(specularFraction, 1.0 + 127.0 * lightMap.g) * lightMap.r;
            specularBrightness += intensity * specularVal * lightInfo[i].y;
            specularColour += intensity * specularVal * lightColours[i];
        }

        brightness += intensity * clamp(lightFraction, 0.0,1.0);
        lightColour += lightColours[i] * intensity * clamp(lightFraction, 0.0,1.0);
        //colour.rgb += lightColours[i] * clamp(lightFraction, 0.0,1.0) * intensity;
    }

    if(brightness > 0.0) {
        colour.rgb += normalize(lightColour) * lightStep(brightness) * diffuse.rgb;
        if (specularBrightness > 0.0) {
            float colourMag = length(specularColour);
            if (colourMag > 0.0) {
                colour.rgb += (specularColour / colourMag) * lightStep(specularBrightness);
            }
        }
    }

    if (rimBrightness > 0.0) {
        colour.rgb += normalize(rimColour) * lightStep(rimBrightness) * diffuse.rgb;
    }

    //colour.rgb += lightColour;
    //colour.rgb = vTBN[0] * 0.5 + 0.5;

    //float nscale = mapRange(depth, normalParams.x, normalParams.z, normalParams.y, normalParams.w);
    //colour.rgb = vec3(nscale,nscale,nscale);
    //colour.rgb = vec3(depth,depth,depth);

    gl_FragColor = mix(colour, vec4(fogColour, 1.0), fogVal);

    float dither = (texture2D(bayerMatrix, gl_FragCoord.xy / 8.0).r - 0.125) / 64.0;

    gl_FragColor.rgb += vec3(dither);
    //gl_FragColor = vec4(1.0,1.0,1.0,1.0);
    //gl_FragColor = normalMap;
    //gl_FragColor = vec4((mod(gl_FragCoord.xy, 32.0) / 32.0),0.5,1.0);
}