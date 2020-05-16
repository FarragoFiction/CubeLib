#ifdef GL_ES
precision highp float;
#endif

// Samplers
varying vec2 vUV;
uniform sampler2D textureSampler;
uniform sampler2D depthSampler;

// Parameters
uniform vec2 screenSize;
uniform mat4 projection;
uniform mat4 view;
uniform mat4 invProjView;

struct DepthInfo {
    float depth;
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

vec2 colourVariance(vec2 coord, vec2 dim) {
    vec4 middle = texture2D(textureSampler, coord);
    vec2 total = vec2(0.0);

    total += colourDifference(middle, texture2D(textureSampler, coord + vec2(   0.0, -dim.y))) * vec2( 0.0, -1.0);
    total += colourDifference(middle, texture2D(textureSampler, coord + vec2(-dim.x,    0.0))) * vec2(-1.0,  0.0);
    total += colourDifference(middle, texture2D(textureSampler, coord + vec2( dim.x,    0.0))) * vec2( 1.0,  0.0);
    total += colourDifference(middle, texture2D(textureSampler, coord + vec2(   0.0,  dim.y))) * vec2( 0.0,  1.0);

    return total * 0.25;
}

vec3 worldPos(float depth) {
    /*float z = depth * 2.0 - 1.0;

    vec4 clipSpacePosition = vec4(vUV * 2.0 - 1.0, z, 1.0);
    vec4 viewSpacePosition = inverse(projection) * clipSpacePosition;

    // Perspective division
    viewSpacePosition /= viewSpacePosition.w;

    vec4 worldSpacePosition = inverse(view) * viewSpacePosition;

    return worldSpacePosition.xyz;*/

    vec4 H = vec4(vUV * 2.0 - 1.0, depth, 1.0);
    vec4 D = invProjView * H; //inverse(projection * view) * H; //
    return (D / D.w).xyz;
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

DepthInfo depthVariance(vec2 coord, vec2 dim) {
    float middle = texture2D(depthSampler, coord).r;
    vec2 dir = vec2(0.0);
    float mag = 0.0;

    float d;
    d = middle - texture2D(depthSampler, coord + vec2(   0.0, -dim.y)).r;
    dir += clamp(d, 0.0,1.0) * vec2( 0.0, -1.0);
    mag += d;

    d = middle - texture2D(depthSampler, coord + vec2(-dim.x,    0.0)).r;
    dir += clamp(d, 0.0,1.0) * vec2(-1.0,  0.0);
    mag += d;

    d = middle - texture2D(depthSampler, coord + vec2( dim.x,    0.0)).r;
    dir += clamp(d, 0.0,1.0) * vec2( 1.0,  0.0);
    mag += d;

    d = middle - texture2D(depthSampler, coord + vec2(   0.0,  dim.y)).r;
    dir += clamp(d, 0.0,1.0) * vec2( 0.0,  1.0);
    mag += d;

    return DepthInfo(middle, dir * 0.25, mag * 0.25);
}

void main(void)
{
    vec2 dim = vec2(1.0) / screenSize;
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

    vec3 world = worldPos(depth.depth);

    /*if (checker3d(world)) {
        gl_FragColor.rgb *= 0.5;
    }*/
    if (depth.depth < 1.0) {
        gl_FragColor.rgb *= worldColour(world);
        //gl_FragColor = vec4(depth.depth, depth.depth, depth.depth, 1.0);
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