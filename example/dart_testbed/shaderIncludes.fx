const int lightCount = 100;
#ifdef UBO
    layout (std140) uniform CommonUBO
    {
        vec3 cameraPos;
        vec2 cameraDepth;
        vec3 lightDirection;
        vec3 mainLight;
        vec3 fillLight;
        vec3 ambientLight;

        vec3 lightPositions[lightCount];
        vec3 lightColours[lightCount];
        float lightRanges[lightCount];
    };
    //uniform vec3 lightPositions[lightCount];
    //uniform vec3 lightColours[lightCount];
    //uniform float lightRanges[lightCount];
#else
    uniform vec3 cameraPos;
    uniform vec2 cameraDepth;
    uniform vec3 lightDirection;
    uniform vec3 mainLight;
    uniform vec3 fillLight;
    uniform vec3 ambientLight;

    uniform vec3 lightPositions[lightCount];
    uniform vec3 lightColours[lightCount];
    uniform float lightRanges[lightCount];
#endif

#ifdef DEPTH
    uniform sampler2D depthSampler;
#endif