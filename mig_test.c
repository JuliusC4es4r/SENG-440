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
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
}

void printMatrixFloat(int matrix[MATRIX_SIZE][MATRIX_SIZE])
{
    for (int i = 0; i < MATRIX_SIZE; i++)
    {
        for (int j = 0; j < MATRIX_SIZE; j++)
        {
            printf("%f ", (float)matrix[i][j]);
        }
        printf("\n");
    }
}

void convertToFloat(int inverse[MATRIX_SIZE][MATRIX_SIZE], int scale_factor)
{
    for (int i = 0; i < MATRIX_SIZE; i++)
    {
        for (int j = 0; j < MATRIX_SIZE; j++)
        {
            inverse[i][j] = (inverse[i][j] * 1.0) / scale_factor;
        }
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

        if (matrix[i][i] == 0)
        {
            // Matrix is not invertible
            return;
        }

        // Step 2: Perform row operations
        temp = matrix[i][i];
        for (j = 0; j < MATRIX_SIZE; j++)
        {
            matrix[i][j] /= temp;
            inverse[i][j] /= temp;
        }

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

int approximate_norm(int matrix[MATRIX_SIZE][MATRIX_SIZE])
{
    // Goal: estimate the condition number without calculating the norm
    // Approximate the matrix norm by finding the maximum absolute row sum

    int norm = 0;
    for (int i = 0; i < MATRIX_SIZE; i++)
    {
        int row_sum = 0;
        for (int j = 0; j < MATRIX_SIZE; j++)
        {
            if (matrix[i][j] < 0)
            {
                // Multiply index by -1 if negative
                row_sum += (matrix[i][j] * (-1));
            }
            else
            {
                row_sum += matrix[i][j];
            }
        }
        if (row_sum > norm)
            norm = row_sum;
    }
    return norm;
}

int compute_condition_num(int matrix[MATRIX_SIZE][MATRIX_SIZE], int inverse[MATRIX_SIZE][MATRIX_SIZE], int scale_factor)
{
    // Goal: estimate the condition number without calculating the norm
    // Approximate the matrix norm by finding the maximum absolute row sum
    int norm = approximate_norm(matrix);
    printf("Norm is:%d\n", norm);

    gaussJordan();

    int inverse_norm = approximate_norm(inverse);
    printf("Inverse norm is:%d\n", inverse_norm);

    int condition_num = norm * inverse_norm;

    return condition_num;
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

    // int condition_number = compute_condition_num(matrix, inverse, scale_factor);
    // printf("Condition Number: %d\n", condition_number);

    // printf("\nInverse Matrix is:\n");
    // printMatrix(inverse);
    // return 0;
}
