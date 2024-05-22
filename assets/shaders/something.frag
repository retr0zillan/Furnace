#pragma header

// Arbitrary random, can be replaced with a function of your choice
float rand(vec2 co)
{
    return fract(sin(dot(co.xy, vec2(.24, 1.023))) * 330.5453);
}

vec2 hash22(vec2 p)
{
	vec3 p3 = fract(vec3(p.xyx) * vec3(443.8975,397.2973, 491.1871));
    p3 += dot(p3, p3.yzx+19.19);
    return fract(vec2((p3.x + p3.y)*p3.z, (p3.x+p3.z)*p3.y));
}

vec2 getCellPoint(vec2 cell, float numCells) 
{
    return (cell + hash22(cell)) / numCells;
}

vec2 getCell(vec2 coord, float numCells) 
{
    return floor(vec2(coord * numCells));
}

// computes worley noise by checking all adjacent cells
// and comparing the distance to their points
vec3 worley(vec2 coord, float numCells) {
    vec2 cell = getCell(coord, numCells);
    float dist = 1.0;
    vec2 dist_cell;
    vec2 dist2_cell;
    
    for (int x = -1; x <=1; x++)
    { 
        for (int y = -1; y <=1; y++) 
        {
        	vec2 cell_point = getCellPoint(cell + vec2(x, y), numCells) - coord;
            float len = dot(cell_point, cell_point);
            if (len < dist)
            {
                dist = len;
                dist_cell = cell_point;
            }
        }
    }
    
    return vec3(dist_cell.xy+coord, dist);
}

float sigmoid(float x)
{
    return 1.0f/(1.0f + exp(-x)) - 0.5;
}

float rgb2gray(vec3 color)
{
    return 0.2989*color.r + 0.5870 *color.g + 0.1140*color.b; 
}

void main(void)
{
	vec2 iResolution = openfl_TextureSize;
	vec2 uv = openfl_TextureCoordv;
	vec2 fragCoord = uv * iResolution;

    vec2 pixCoord = fragCoord/iResolution.xy;
    float ySum = 0.0f;
    float xSum = 0.0f;
    vec2 xOffset, yOffset;
    float fi, sigfi;
    for(int i = -2; i <= 2; ++i)
    {
        fi = float(i);
        sigfi = sigmoid(fi);
        xOffset = vec2(fi, 0.0f);
        yOffset = vec2(0.0f, fi);
        xSum += sigfi*rgb2gray(textureCam(bitmap, (pixCoord + xOffset)/iResolution.xy).rgb);
        ySum += sigfi*rgb2gray(textureCam(bitmap, (pixCoord + yOffset)/iResolution.xy).rgb);
    }
        
    float edge = max(abs(xSum),abs(ySum));
    float numCells = 56.0;
    vec3 sampWorley = worley(fragCoord/iResolution.xy, numCells);
    if(edge < 0.04)
    {
        gl_FragColor = textureCam(bitmap, sampWorley.xy);
    }
    else
    {
        gl_FragColor = textureCam(bitmap, fragCoord/iResolution.xy);
    }
}