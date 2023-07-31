#include <stdio.h>

#define MatrixSize 6
#define MaxScale 65536 // 2^16

int hardwareMultiplier(){

}

void scaleMatrix(int matrix[MatrixSize][MatrixSize], int scale_factor){
    //Scale each element in the matrix
    for(int i = 0; i < MatrixSize; i+=2){
        for(int j = 0; j < MatrixSize; j+=2){
            matrix[i][j] = hardwareMultiplier(scale_factor,  matrix[i][j]);
            matrix[i][j+1] = hardwareMultiplier(scale_factor, matrix[i][j+1]);

            matrix[i+1][j] = hardwareMultiplier(scale_factor, matrix[i+1][j]);
            matrix[i+1][j+1] = hardwareMultiplier(scale_factor, matrix[i+1][j+1]);
        }
    }
}

