#include <stdio.h>
#include <math.h>

int power(int x, int y) {
    return pow(x, y);
}

int main() {
   printf("%i\n", power(4, 5));
}

// [
// % arch -x86_64 zsh
// % arch -arm64 zsh 
// ]
// % arch
// .dylib
// % gcc -shared -o apple-clang.dylib -fPIC apple-clang.c
// .so
// % gcc -c -fPIC apple-clang.c
// % gcc -shared -o apple-clang.so apple-clang.o
// "main"
// % gcc apple-clang.c -o apple-clang
// % ./apple-clang
