#include <stdio.h>
int
c_code(int number) {
  return number * 10;
}

int
main() {
  printf("%i\n", c_code(5));
}
