#include <stdio.h>

typedef float vec4 __attribute__ ((vector_size (16)));
typedef float vec2 __attribute__ ((vector_size ( 8)));
// typedef float vec3 __attribute__ ((vector_size (12)));
typedef vec4 vec3;



typedef float float4 __attribute__((ext_vector_type(4)));

#define X 0
#define Y 1
#define Z 2
#define W 3

int main() {
    vec4 a = {0, 1, 2, 3};
    vec4 b = {1, 1, 1, 1};
    vec4 c = a + b;
    printf("%f\t%f\t%f\t%f\n", c[X], c[Y], c[Z], c[W]);
    vec4 i = {0, 1, 2};
    vec4 j = {1, 1, 1};
    vec4 k = i + j;
    printf("%f\t%f\t%f\n", k[X], k[Y], k[Z]);
    vec2 e = {0, 1};
    vec2 f = {1, 1};
    vec2 g = e + f;
    printf("%f\t%f\n", g[X], g[Y]);

    float4 p = {11, 22, 33, 44};
    float4 q = {11, 11, 11, 11};
    float4 r = p + q;
    printf("%f\t%f\t%f\t%f\n", r[X], r[Y], r[Z], r[W]);
    printf("%f\t%f\t%f\t%f\n", r.x, r.y, r.z, r.w);
    

    return 0;
     
}
