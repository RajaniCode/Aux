#include <stdio.h>

void
c_code(void) {
  printf("C!\n");
}

int
main() {
  c_code();
}

// % arch -x86_64 zsh
// [
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
