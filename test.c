#include <stdio.h>

#define MATRIX_SIZE 6

//the well-conditioned matrix to be inverted
// line below for matlab debugging
// [1,2,1,1,2,1; 5, 2, 7, 1, 1, 3;7, 1, 1, 4, 1, 2;1, 1, 5, 2, 3, 7;1, 2, 5, 2, 2, 1;1, 2, 1, 1, 1, 2]
float well_conditioned_matrix[MATRIX_SIZE][MATRIX_SIZE] = 
{
    {1, 2, 1, 1, 2, 1},
    {5, 2, 7, 1, 1, 3},
    {7, 1, 1, 4, 1, 2},
    {1, 1, 5, 2, 3, 7},
    {1, 2, 5, 2, 2, 1},
    {1, 2, 1, 1, 1, 2}
};

//allocating memory and defining the identity matrix to have row operations completed on it for the inversion
float well_conditioned_inversion_result[MATRIX_SIZE][MATRIX_SIZE] = 
{
    {1, 0, 0, 0, 0, 0},
    {0, 1, 0, 0, 0, 0},
    {0, 0, 1, 0, 0, 0},
    {0, 0, 0, 1, 0, 0},
    {0, 0, 0, 0, 1, 0},
    {0, 0, 0, 0, 0, 1},
};

//the ill-conditioned matrix to be inverted
float ill_conditioned_matrix[MATRIX_SIZE][MATRIX_SIZE] = 
{
    {1, 2, 1, 1, 2, 1},
    {5, 33, 7, 1, 1, 3},
    {7, 1, 1, 4, 1, 2},
    {1, 1, 5, 2, 3, 7},
    {1, 2, 5, 50, 2, 1},
    {1, 20, 1, 1, 1, 2}
};

//creating another matrix for the ill-conditioned result
float ill_conditioned_inversion_result[MATRIX_SIZE][MATRIX_SIZE] = 
{
    {1, 0, 0, 0, 0, 0},
    {0, 1, 0, 0, 0, 0},
    {0, 0, 1, 0, 0, 0},
    {0, 0, 0, 1, 0, 0},
    {0, 0, 0, 0, 1, 0},
    {0, 0, 0, 0, 0, 1},
};

void printMatrix(float matrix[MATRIX_SIZE][MATRIX_SIZE]) {
    for (int i = 0; i < MATRIX_SIZE; i++) {
        for (int j = 0; j < MATRIX_SIZE; j++) {
            printf("%.4f\t", matrix[i][j]);
        }
        printf("\n");
    }
}

void swapRows(float matrix[MATRIX_SIZE][MATRIX_SIZE], int row1, int row2) {
    for (int i = 0; i < MATRIX_SIZE; i++) {
        float temp = matrix[row1][i];
        matrix[row1][i] = matrix[row2][i];
        matrix[row2][i] = temp;
    }
}

void scaleRow(float matrix[MATRIX_SIZE][MATRIX_SIZE], int row, float scalar) {
    for (int i = 0; i < MATRIX_SIZE; i++) {
        matrix[row][i] *= scalar;
    }
}

void addRows(float matrix[MATRIX_SIZE][MATRIX_SIZE], int srcRow, int destRow, float scalar) {
    for (int i = 0; i < MATRIX_SIZE; i++) {
        matrix[destRow][i] += scalar * matrix[srcRow][i];
    }
}

void invertMatrix(float matrix[MATRIX_SIZE][MATRIX_SIZE], float inverse[MATRIX_SIZE][MATRIX_SIZE]) {
    // Initialize the inverse matrix as the identity matrix
    for (int i = 0; i < MATRIX_SIZE; i++) {
        for (int j = 0; j < MATRIX_SIZE; j++) {
            inverse[i][j] = (i == j) ? 1.0 : 0.0;
        }
    }

    // Apply Gauss-Jordan elimination
    for (int i = 0; i < MATRIX_SIZE; i++) {
        // If the pivot element is zero, swap rows
        if (matrix[i][i] == 0) {
            int j;
            for (j = i + 1; j < MATRIX_SIZE; j++) {
                if (matrix[j][i] != 0) {
                    swapRows(matrix, i, j);
                    swapRows(inverse, i, j);
                    break;
                }
            }
            if (j == MATRIX_SIZE) {
                printf("Matrix is not invertible\n");
                return;
            }
        }

        // Scale the pivot row
        float pivot = matrix[i][i];
        scaleRow(matrix, i, 1.0 / pivot);
        scaleRow(inverse, i, 1.0 / pivot);

        // Eliminate other rows
        for (int j = 0; j < MATRIX_SIZE; j++) {
            if (j != i) {
                float factor = matrix[j][i];
                addRows(matrix, i, j, -factor);
                addRows(inverse, i, j, -factor);
            }
        }
    }
}

int main() {

    printf("Original Matrix:\n");
    printMatrix(well_conditioned_matrix);

    invertMatrix(well_conditioned_matrix, well_conditioned_inversion_result);

    printf("Inverted Matrix:\n");
    printMatrix(well_conditioned_inversion_result);

    return 0;
}
