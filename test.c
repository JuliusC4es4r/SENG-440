#include <stdio.h>

#define N 3

void printMatrix(float matrix[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            printf("%.2f\t", matrix[i][j]);
        }
        printf("\n");
    }
}

void swapRows(float matrix[N][N], int row1, int row2) {
    for (int i = 0; i < N; i++) {
        float temp = matrix[row1][i];
        matrix[row1][i] = matrix[row2][i];
        matrix[row2][i] = temp;
    }
}

void scaleRow(float matrix[N][N], int row, float scalar) {
    for (int i = 0; i < N; i++) {
        matrix[row][i] *= scalar;
    }
}

void addRows(float matrix[N][N], int srcRow, int destRow, float scalar) {
    for (int i = 0; i < N; i++) {
        matrix[destRow][i] += scalar * matrix[srcRow][i];
    }
}

void invertMatrix(float matrix[N][N], float inverse[N][N]) {
    // Initialize the inverse matrix as the identity matrix
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            inverse[i][j] = (i == j) ? 1.0 : 0.0;
        }
    }

    // Apply Gauss-Jordan elimination
    for (int i = 0; i < N; i++) {
        // If the pivot element is zero, swap rows
        if (matrix[i][i] == 0) {
            int j;
            for (j = i + 1; j < N; j++) {
                if (matrix[j][i] != 0) {
                    swapRows(matrix, i, j);
                    swapRows(inverse, i, j);
                    break;
                }
            }
            if (j == N) {
                printf("Matrix is not invertible\n");
                return;
            }
        }

        // Scale the pivot row
        float pivot = matrix[i][i];
        scaleRow(matrix, i, 1.0 / pivot);
        scaleRow(inverse, i, 1.0 / pivot);

        // Eliminate other rows
        for (int j = 0; j < N; j++) {
            if (j != i) {
                float factor = matrix[j][i];
                addRows(matrix, i, j, -factor);
                addRows(inverse, i, j, -factor);
            }
        }
    }
}

int main() {
    float matrix[N][N] = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    };

    float inverse[N][N];

    //invertMatrix(matrix, inverse);

    printf("Original Matrix:\n");
    printMatrix(matrix);

    printf("\nInverse Matrix:\n");
    printMatrix(inverse);

    return 0;
}
