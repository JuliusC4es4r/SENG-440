#include <stdio.h>
#include <math.h>

#define MATRIX_SIZE 6
#define SCALE_FACTOR (1 << 16) // 2^16

int matrix[MATRIX_SIZE][MATRIX_SIZE];
int inverse[MATRIX_SIZE][MATRIX_SIZE];
int temp;

int matrix[MATRIX_SIZE][MATRIX_SIZE] =
    {
        {5, 2, 1, 1, 2, 1},
        {5, 1, 7, 1, 1, 3},
        {7, 1, 7, 9, 1, 2},
        {1, 1, 5, 3, 3, 5},
        {1, 2, 5, 2, 2, 1},
        {1, 9, 0, 5, 1, 7}};

int inverse[MATRIX_SIZE][MATRIX_SIZE] =
    {
        {1, 0, 0, 0, 0, 0},
        {0, 1, 0, 0, 0, 0},
        {0, 0, 1, 0, 0, 0},
        {0, 0, 0, 1, 0, 0},
        {0, 0, 0, 0, 1, 0},
        {0, 0, 0, 0, 0, 1},
};

void printMatrix(int matrix[MATRIX_SIZE][MATRIX_SIZE])
{
    int i, j;
    for (i = 0; i < MATRIX_SIZE; i++)
    {
        for (j = 0; j < MATRIX_SIZE; j++)
        {
            printf("%10d ", matrix[i][j]);
        }
        printf("\n");
    }
}

void switchEquation(int rowTotal1, int rowTotal2)
{
    for (int columnIndex = 0; columnIndex < (7); columnIndex++)
    {
        float temp = matrix[rowTotal1][columnIndex];
        matrix[rowTotal1][columnIndex] = matrix[rowTotal2][columnIndex];
        matrix[rowTotal2][columnIndex] = temp;
    }
}

void gaussJordan()
{
    int i, j, k;
    int temp;

    // Step 1: Swap rows with zero entries to the bottom
    for (i = 0; i < MATRIX_SIZE; i++)
    {
        if (matrix[i][i] == 0)
        {
            for (k = i + 1; k < MATRIX_SIZE; k++)
            {
                if (matrix[k][i] != 0)
                {
                    // Swap rows in the matrix
                    for (j = 0; j < MATRIX_SIZE; j++)
                    {
                        temp = matrix[i][j];
                        matrix[i][j] = matrix[k][j];
                        matrix[k][j] = temp;
                    }
                    // Swap rows in the inverse matrix
                    for (j = 0; j < MATRIX_SIZE; j++)
                    {
                        temp = inverse[i][j];
                        inverse[i][j] = inverse[k][j];
                        inverse[k][j] = temp;
                    }
                    break;
                }
            }
        }

        // Step 2: Swap rows to make largest, leftmost nonzero entry on top
        int maxIndex = i;
        for (k = i + 1; k < MATRIX_SIZE; k++)
        {
            if (matrix[k][i] > matrix[maxIndex][i])
            {
                maxIndex = k;
            }
        }
        if (maxIndex != i)
        {
            // Swap rows in the matrix
            for (j = 0; j < MATRIX_SIZE; j++)
            {
                temp = matrix[i][j];
                matrix[i][j] = matrix[maxIndex][j];
                matrix[maxIndex][j] = temp;
            }
            // Swap rows in the inverse matrix
            for (j = 0; j < MATRIX_SIZE; j++)
            {
                temp = inverse[i][j];
                inverse[i][j] = inverse[maxIndex][j];
                inverse[maxIndex][j] = temp;
            }
        }

        // Step 3: Multiply top row by a scalar to make leading entry 1
        temp = matrix[i][i];
        for (j = 0; j < MATRIX_SIZE; j++)
        {
            matrix[i][j] /= temp;
            inverse[i][j] /= temp;
        }

        // Step 4: Perform row operations to make other entries in the column zero
        for (k = 0; k < MATRIX_SIZE; k++)
        {
            if (k != i)
            {
                temp = matrix[k][i];
                for (j = 0; j < MATRIX_SIZE; j++)
                {
                    matrix[k][j] -= matrix[i][j] * temp;
                    inverse[k][j] -= inverse[i][j] * temp;
                }
            }
        }
    }
}

int scale_factor_calculation(int matrix[MATRIX_SIZE][MATRIX_SIZE])
{
    int scale_factor = 0;
    int max = 0;

    // Loop through matrix to find the maximum element
    for (int i = 0; i < MATRIX_SIZE; i++)
    {
        for (int j = 0; j < MATRIX_SIZE; j++)
        {
            if (matrix[i][j] > max)
                max = matrix[i][j];
        }
    }
    if (max > 0)
        scale_factor = SCALE_FACTOR / max;

    return scale_factor;
}

void scale_matrix(int matrix[MATRIX_SIZE][MATRIX_SIZE], int scale_factor)
{
    // Scale each element in the matrix
    for (int i = 0; i < MATRIX_SIZE; i++)
    {
        for (int j = 0; j < MATRIX_SIZE; j++)
        {
            matrix[i][j] *= scale_factor;
        }
    }
}

int main()
{
    int i, j;
    printf("Original Matrix:\n");
    printMatrix(matrix);
    int scale_factor = scale_factor_calculation(matrix);

    printf("\nScale factor: %d\n\n", scale_factor);
    printf("Scaled Matrix:\n");
    scale_matrix(matrix, scale_factor);
    printMatrix(matrix);

    gaussJordan();

    printf("\nAfter Gauss Jordan:\n");
    printf("Matrix:\n");
    printMatrix(matrix);
    printf("Inverse:\n");
    printMatrix(inverse);

    return 0;
}