#include <stdio.h>
#include <stdlib.h>

#define N 6

void printMatrix(int matrix[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
}

void integerMatrixInverse(int matrix[N][N]) {
    int scaled_matrix[N][N];
    int inv_scaled_matrix[N][N];
    int augmented_matrix[N][2 * N];
    int scale_factor = 0;

    // Compute the scale factor
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (abs(matrix[i][j]) > scale_factor) {
                scale_factor = abs(matrix[i][j]);
            }
        }
    }

    // Scale the matrix
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            scaled_matrix[i][j] = (matrix[i][j] * (1 << 32)) / scale_factor;
        }
    }

    // Perform Gauss-Jordan elimination
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            augmented_matrix[i][j] = scaled_matrix[i][j];
            augmented_matrix[i][j + N] = (i == j) ? 1 : 0;
        }
    }

    for (int k = 0; k < N; k++) {
        int pivot = augmented_matrix[k][k];

        // Scale the pivot row
        int scale = (1 << 32) / pivot;
        for (int j = 0; j < 2 * N; j++) {
            augmented_matrix[k][j] = ((int64_t) augmented_matrix[k][j] << 32) / scale;
        }

        // Eliminate other rows
        for (int i = 0; i < N; i++) {
            if (i != k) {
                int factor = ((int64_t) augmented_matrix[i][k] << 32) / pivot;
                for (int j = 0; j < 2 * N; j++) {
                    augmented_matrix[i][j] ^= ((int64_t) augmented_matrix[k][j] << 32) / factor;
                }
            }
        }
    }

    // Extract the inverted matrix
    for (int i = 0; i < N; i++) {
        for (int j = N; j < 2 * N; j++) {
            inv_scaled_matrix[i][j - N] = augmented_matrix[i][j];
        }
    }

    // Rescale the inverted matrix
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            matrix[i][j] = (inv_scaled_matrix[i][j] * scale_factor) / (1 << 32);
        }
    }
}

int main() {
    int matrix[N][N] = {
        {1, 2, 1, 1, 2, 1},
        {5, 2, 7, 1, 1, 3},
        {7, 1, 1, 4, 1, 2},
        {1, 1, 5, 2, 3, 7},
        {1, 2, 5, 2, 2, 1},
        {1, 2, 1, 1, 1, 2}
    };

    printf("Original Matrix:\n");
    printMatrix(matrix);

    integerMatrixInverse(matrix);

    printf("Inverted Matrix:\n");
    printMatrix(matrix);

    return 0;
}
