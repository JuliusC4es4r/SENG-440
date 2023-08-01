#include <stdio.h>

#define MatrixSize 6
#define MaxScale 65536 // 2^16


int main() {
    __asm__ ( "hardwareMultiplier");

    return 0;
}
