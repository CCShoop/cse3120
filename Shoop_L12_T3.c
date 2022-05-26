#include <stdlib.h>
#include <stdio.h>
/* extern C */
int square_root_proc(int);
int main(int argc, char**argv) {
    if (argc <= 1) {printf("Parameter absent\n"); return 0;}
    int in = atoi(argv[1]);
    int in2 = in*in;
    int a = square_root_proc(in2);
    if (in != a) printf("Wrong val=%d rather than %d\n", a, in);
    else printf ("Flag: flag{RootOfAllFlags}");
    return a;
}
