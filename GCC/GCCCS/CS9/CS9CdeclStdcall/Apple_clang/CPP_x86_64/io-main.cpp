#include <stdio.h>

extern "C" {
    void hello_io(char *x) {  
        printf("%s\n", x);
    }
}

int 
main() {
    char *a = (char*)"Hello, io!";
    hello_io(a);
}
