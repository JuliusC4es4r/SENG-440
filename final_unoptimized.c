#include <stdio.h>

#define MatrixSize 6
#define MaxScale 65536 // 2^16

int wellConditionedMatrix[MatrixSize][MatrixSize] =
{
    {1, 2, 1, 1, 2, 1},
    {5, 2, 7, 1, 1, 3},
    {7, 1, 1, 4, 1, 2},
    {1, 1, 5, 2, 3, 7},
    {1, 2, 5, 2, 2, 1},
    {1, 2, 1, 1, 1, 2}
};

int wellConditionedInversionResult[MatrixSize][MatrixSize] =
{
    {1, 0, 0, 0, 0, 0},
    {0, 1, 0, 0, 0, 0},
    {0, 0, 1, 0, 0, 0},
    {0, 0, 0, 1, 0, 0},
    {0, 0, 0, 0, 1, 0},
    {0, 0, 0, 0, 0, 1},
};

int illConditionedMatrix[MatrixSize][MatrixSize] =
{
    {1, 2, 1, 1, 2, 1},
    {5, 33, 7, 1, 1, 3},
    {7, 1, 1, 4, 1, 2},
    {1, 1, 5, 2, 3, 7},
    {1, 2, 5, 50, 2, 1},
    {1, 20, 1, 1, 1, 2}
};

int illConditionedInversionResult[MatrixSize][MatrixSize] =
{
    {1, 0, 0, 0, 0, 0},
    {0, 1, 0, 0, 0, 0},
    {0, 0, 1, 0, 0, 0},
    {0, 0, 0, 1, 0, 0},
    {0, 0, 0, 0, 1, 0},
    {0, 0, 0, 0, 0, 1},
};

// Function declarations
void invertMatrix(int (*matrix)[MatrixSize], int (*invertedMatrix)[MatrixSize], int size, int scaleFactor);
void printMatrix(int (*matrix)[MatrixSize], int matrixSize);
int scaleUp(int (*matrix)[MatrixSize], int (*invertedMatrix)[MatrixSize], int matrixSize);
int calculateConditionNumber(int (*matrix)[MatrixSize], int matrixSize);
void swapRows(int matrix[MatrixSize][MatrixSize], int row1, int row2);
void scaleElement(int matrix[MatrixSize][MatrixSize], int row, int column, int scalar);
void addElement(int matrix[MatrixSize][MatrixSize], int srcRow, int destRow, int column, int scalar);

void invertMatrix(int (*matrix)[MatrixSize], int (*invertedMatrix)[MatrixSize], int size, int scaleFactor)
{
    int i, j, k, scalar;
    int colMax, colMaxIndex;

    for (i = 0; i < size; i++)
    {
        colMax = 0;
        colMaxIndex = i;

        // this loop finds the rows to be swapped to get the next pivot
        for (k = i; k < size; k++)
        {
            colMax = matrix[k][i];
            if (matrix[k][i] > colMax)
            {
                colMax = matrix[k][i];
                colMaxIndex = k;
            }
        }

        // if the new pivot isn't on the right row
        if (colMaxIndex != i)
        {
            // swap rows to move the new pivot to the right position for the matrix
            for (k = 0; k < size; k++)
            {
                swapRows(matrix, i, k);
            }

            // swap rows to move the new pivot to the right position for the inverted matrix
            for (k = 0; k < size; k++)
            {
                swapRows(invertedMatrix, i, k);
            }
        }

        // this is the pivot
        scalar = matrix[i][i];

        // if the pivot is zero throw an error
        if (scalar == 0)
        {
            printf("divide by zero error\n\n");
            return;
        }

        // scale the rows for both the matrix and inverse matrix to make the pivot become 1
        for (j = 0; j < size; j++)
        {
            scaleElement(matrix, i, j, scalar);
            scaleElement(invertedMatrix, i, j, scalar);
        }

        // subtracting the scaled pivot row from the remaining rows while stepping through rows
        for (k = 0; k < size; k++)
        {
            scalar = matrix[k][i];
            if (k != i)
            {
                for (j = 0; j < size; j++)
                {
                    addElement(matrix, i, k, j, -scalar);
                    addElement(invertedMatrix, i, k, j, -scalar);
                }
            }
        }
    }
}

void printMatrix(int (*matrix)[MatrixSize], int matrixSize)
{
    int i, j;

    for (i = 0; i < matrixSize; i++)
    {
        for (j = 0; j < matrixSize; j++)
        {
            printf("%12d ", matrix[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

int scale_factor_calculation(int matrix[MatrixSize][MatrixSize]){
    int scale_factor = 0;
    int max = 0;

    //Loop through matrix to find the maximum element
    for(int i = 0; i < MatrixSize; i++){
        for(int j = 0; j < MatrixSize; j++){
            if (matrix[i][j] > max) max = matrix[i][j];
        }
    }
    
    return MaxScale/max;
}

void scale_matrix(int matrix[MatrixSize][MatrixSize], int scale_factor){
    //Scale each element in the matrix
    for(int i = 0; i < MatrixSize; i++){
        for(int j = 0; j < MatrixSize; j++){
            matrix[i][j] *= scale_factor;
        }
    }
}

float approximate_norm(int matrix[MatrixSize][MatrixSize]){
    //Goal: estimate the condition number without calculating the norm
    //Approximate the matrix norm by finding the maximum absolute row sum

    int norm = 0;
    for(int i = 0; i < MatrixSize; i++){
        int row_sum = 0;
        for(int j = 0; j < MatrixSize; j++){
            if(matrix[i][j] < 0){
                //Multiply index by -1 if negative
                row_sum += (matrix[i][j] * (-1));
            }else{
                row_sum += matrix[i][j];
            }
        }
        if(row_sum > norm) norm = row_sum;
    }
    return norm;
}

void swapRows(int matrix[MatrixSize][MatrixSize], int row1, int row2)
{
    for (int i = 0; i < MatrixSize; i++)
    {
        int temp = matrix[row1][i];
        matrix[row1][i] = matrix[row2][i];
        matrix[row2][i] = temp;
    }
}

void scaleElement(int matrix[MatrixSize][MatrixSize], int row, int column, int scalar)
{
        matrix[row][column] = (matrix[row][column]) / scalar;
}

void addElement(int matrix[MatrixSize][MatrixSize], int srcRow, int destRow, int column, int scalar)
{
    matrix[destRow][column] += matrix[srcRow][column] * scalar;
}


int main(void)
{
    int scaleFactor;
    float conditionNumber, matrixNorm, inverseNorm;

    printf("Original Well Conditioned Matrix: \n");
    printMatrix(wellConditionedMatrix, MatrixSize);

    // scale factor calculations
    scaleFactor = scale_factor_calculation(wellConditionedMatrix);
    printf("Well Conditioned Matrix Scale Factor: %d \n", scaleFactor);

    // finding matrix norm
    matrixNorm = approximate_norm(wellConditionedMatrix);
    printf("Matrix Norm: %f \n", matrixNorm);

    // scaling inverted matrix result with the scale factor
    scale_matrix(wellConditionedInversionResult, scaleFactor);

    // inverting matrices
    invertMatrix(wellConditionedMatrix, wellConditionedInversionResult, MatrixSize, scaleFactor);

    // calculating inverse norm
    inverseNorm = approximate_norm(wellConditionedInversionResult);
    printf("Inverse Matrix Norm: %f \n", inverseNorm/MaxScale);

    // calculating condition number
    conditionNumber = (inverseNorm * matrixNorm)/MaxScale;
    printf("Condition Number: %f \n", conditionNumber);

    printf("\nOriginal Well Conditioned Matrix (After Inversion): \n");
    printMatrix(wellConditionedMatrix, MatrixSize);

    printf("\nResulting Inverse Matrix: \n");
    printMatrix(wellConditionedInversionResult, MatrixSize);

    return 0;
}
