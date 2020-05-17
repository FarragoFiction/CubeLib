#ifdef GL_ES
precision highp float;
#endif

// Samplers
varying vec2 vUV;
uniform sampler2D textureSampler;
uniform sampler2D depthSampler;

// Parameters
uniform vec2 screenSize;
uniform mat4 invProjView;
uniform vec3 cameraPos;
uniform float nearZ;
uniform float farZ;

struct DepthInfo {
    float depth;
    float left;
    float right;
    float top;
    float bottom;
    vec2 dir;
    float mag;
};

float colourDifference(vec4 c1, vec4 c2) {
    float dr = abs(c1.r - c2.r);
    float dg = abs(c1.g - c2.g);
    float db = abs(c1.b - c2.b);

    float l1 = 0.299 * c1.r + 0.587 * c1.g + 0.114 * c1.b;
    float l2 = 0.299 * c2.r + 0.587 * c2.g + 0.114 * c2.b;

    float dl = abs(l1-l2);

    return dl * 0.65 + (0.299 * dr + 0.587 * dg + 0.114 * db) * 0.35;
}

vec2 colourVariance(vec2 coord, vec3 dim) {
    vec4 middle = texture2D(textureSampler, coord);
    vec2 total = vec2(0.0);

    total += colourDifference(middle, texture2D(textureSampler, coord - dim.zy)) * vec2( 0.0, -1.0);
    total += colourDifference(middle, texture2D(textureSampler, coord - dim.xz)) * vec2(-1.0,  0.0);
    total += colourDifference(middle, texture2D(textureSampler, coord + dim.xz)) * vec2( 1.0,  0.0);
    total += colourDifference(middle, texture2D(textureSampler, coord + dim.zy)) * vec2( 0.0,  1.0);

    return total * 0.25;
}

vec3 applyTransform(vec3 v, mat4 m) {

    float rx = v.x * m[0][0] + v.y * m[1][0] + v.z * m[2][0] + m[3][0];
    float ry = v.x * m[0][1] + v.y * m[1][1] + v.z * m[2][1] + m[3][1];
    float rz = v.x * m[0][2] + v.y * m[1][2] + v.z * m[2][2] + m[3][2];
    float rw = 1.0 / (v.x * m[0][3] + v.y * m[1][3] + v.z * m[2][3] + m[3][3]);

    vec3 coord = vec3(rx * rw, ry * rw, rz * rw);
    return coord;
}

vec3 worldPos(float depth, vec2 uv) {

    // coord at near frustum
    vec3 screenSource = vec3(uv * 2.0 - 1.0, 0.0);
    vec3 nearCoord = applyTransform(screenSource, invProjView);
    float val = screenSource.x * invProjView[0][3] + screenSource.y * invProjView[1][3] + screenSource.z * invProjView[2][3] + invProjView[3][3];
    if (abs(1.0 - val) < 1.4e-45) {
        nearCoord = nearCoord / val;
    }

    vec3 diff = nearCoord - cameraPos;
    vec3 dir = normalize(diff);

    vec3 finalCoord = nearCoord + dir * depth * (farZ - nearZ);

    return finalCoord;

    // correctly placed but loses precision
    /*float z = 2.0 * depth - 1.0;

    vec3 screenSource = vec3(uv * 2.0 - 1.0, z);

    vec3 coord = applyTransform(screenSource, invProjView);

    float val = screenSource.x * invProjView[0][3] + screenSource.y * invProjView[1][3] + screenSource.z * invProjView[2][3] + invProjView[3][3];
    if (abs(1.0 - val) < 1.4e-45) {
        //coord = coord / val;
    }

    return coord;*/
}

bool checker3d(vec3 position) {
    float size = 0.5;
    vec3 v = floor(position / size);

    return mod(v.x + v.y + v.z, 2.0) < 0.000001;
}

vec3 worldColour(vec3 position) {
    float size = 0.5;

    vec3 pos = fract(position * size);

    return pos;
}

DepthInfo depthVariance(vec2 coord, vec3 dim) {
    float middle = texture2D(depthSampler, coord).r;
    vec2 dir = vec2(0.0);
    float mag = 0.0;

    float d;

    float top = texture2D(depthSampler, coord - dim.zy).r;
    d = middle - top;
    dir += clamp(d, 0.0,1.0) * vec2( 0.0, -1.0);
    mag += d;

    float left = texture2D(depthSampler, coord - dim.xz).r;
    d = middle - left;
    dir += clamp(d, 0.0,1.0) * vec2(-1.0,  0.0);
    mag += d;

    float right = texture2D(depthSampler, coord + dim.xz).r;
    d = middle - right;
    dir += clamp(d, 0.0,1.0) * vec2( 1.0,  0.0);
    mag += d;

    float bottom = texture2D(depthSampler, coord + dim.zy).r;
    d = middle - bottom;
    dir += clamp(d, 0.0,1.0) * vec2( 0.0,  1.0);
    mag += d;

    return DepthInfo(middle, left, right, top, bottom, dir * 0.25, mag * 0.25);
}

void main(void)
{
    vec3 dim = vec3(vec2(1.0) / screenSize, 0.0);
    gl_FragColor = texture2D(textureSampler, vUV);

    DepthInfo depth = depthVariance(vUV, dim);
    vec2 depthDiff = depth.dir;
    vec2 colourDiff = colourVariance(vUV, dim);

    float depthMag = length(depthDiff);
    float colourMag = length(colourDiff);

    float depthThreshold = 0.005;
    float colourDepthThreshold = -0.01;
    float colourThreshold = 0.02;

    if (depthMag > depthThreshold || (depth.mag > colourDepthThreshold && colourMag > colourThreshold)) {
        gl_FragColor.rgb *= 0.5;
        gl_FragColor.r += 0.75;
    }



    vec3 world = (worldPos(depth.depth, vUV) );
    /*    + worldPos(depth.top,    vUV - dim.zy)
        + worldPos(depth.left,   vUV - dim.xz)
        + worldPos(depth.right,  vUV + dim.xz)
        + worldPos(depth.bottom, vUV + dim.zy)
    ) / 5.0;*/

    if (depth.depth < 1.0) {
        gl_FragColor.rgb *= worldColour(world);
        //gl_FragColor = vec4(depth.depth, depth.depth, depth.depth, 1.0);

        //gl_FragColor = vec4(vUV, depth.depth, 1.0);
    }

    //gl_FragColor = vec4(depthMag,depthMag,depthMag,1);
    /*gl_FragColor = vec4(0,0,0,1);
    if (depthMag > depthThreshold) {
        gl_FragColor.r = 1.0;
    }
    if (depth.mag > -0.1) {
        gl_FragColor.g = 1.0;
    }*/
}