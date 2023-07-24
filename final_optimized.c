#include <stdio.h>
#include <sys/time.h>

#define MatrixSize 6
#define MaxScale 65536 // 2^16

int wellConditionedMatrix[MatrixSize][MatrixSize] =
{
    {5, 2, 1, 1, 2, 1},
    {5, 1, 7, 5, 9, 3},
    {7, 1, 1, 1, 1, 2},
    {1, 1, 4, 1, 3, 2},
    {1, 2, 8, 2, 2, 1},
    {1, 9, 0, 5, 1, 3}
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

void printMatrix(int (*matrix)[MatrixSize], int matrixSize){
    register int i, j;

    for(int i = 0; i < MatrixSize; i++){
        for(int j = 0; j < MatrixSize; j++){
            printf("%12d ", matrix[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

int scaleFactorCalculation(int matrix[MatrixSize][MatrixSize]){
    register int max = matrix[0][0];
    register int i, j;

    //Loop through matrix to find the maximum element
    for(i = 0; i < MatrixSize; i+=2){
        for(j = 1; j < MatrixSize-1; j+=2){
            if (matrix[i][j] > max) max = matrix[i][j];
            if (matrix[i][j+1] > max) max = matrix[i][j+1];

            if (matrix[i+1][j] > max) max = matrix[i+1][j];
            if (matrix[i+1][j+1] > max) max = matrix[i+1][j+1];
        }
    }
    
    return MaxScale/max;
}


void scaleMatrix(int matrix[MatrixSize][MatrixSize], int scale_factor){
    //Scale each element in the matrix
    for(int i = 0; i < MatrixSize; i+=2){
        for(int j = 0; j < MatrixSize; j+=2){
            matrix[i][j] *= scale_factor;
            matrix[i][j+1] *= scale_factor;

            matrix[i+1][j] *= scale_factor;
            matrix[i+1][j+1] *= scale_factor;
        }
    }
}

float approximateNorm(int matrix[MatrixSize][MatrixSize]){
    //Goal: estimate the condition number without calculating the norm
    //Approximate the matrix norm by finding the maximum absolute row sum

    register int norm = 0;
    for(int i = 0; i < MatrixSize; i+=2){
        int row_sum = 0;
        for(int j = 0; j < MatrixSize; j+=2){
            if(matrix[i][j] < 0){
                row_sum -= (matrix[i][j]);
            }else{
                row_sum += matrix[i][j];
            }
            if(matrix[i][j+1] < 0){
                row_sum -= (matrix[i][j+1]);
            }else{
                row_sum += matrix[i][j+1];
            }

            if(matrix[i+1][j] < 0){
                row_sum -= (matrix[i+1][j]);
            }else{
                row_sum += matrix[i+1][j];
            }
            if(matrix[i+1][j+1] < 0){
                row_sum -= (matrix[i+1][j+1]);
            }else{
                row_sum += matrix[i+1][j+1];
            }
        }
        if(row_sum > norm) norm = row_sum;
    }
    return norm;
}

void swapRows(int matrix[MatrixSize][MatrixSize], int row1, int row2){
    register int i;
    for (i = 0; i < MatrixSize; i+=2)
    {
        int temp = matrix[row1][i];
        matrix[row1][i] = matrix[row2][i];
        matrix[row2][i] = temp;

        temp = matrix[row1][i+1];
        matrix[row1][i+1] = matrix[row2][i+1];
        matrix[row2][i+1] = temp;
    }
}

void scaleElement(int matrix[MatrixSize][MatrixSize], int row, int column, int scalar){
    matrix[row][column] = (matrix[row][column]) / scalar;
}

void addElement(int matrix[MatrixSize][MatrixSize], int srcRow, int destRow, int column, int scalar){
    matrix[destRow][column] += matrix[srcRow][column] * scalar;
}

void inversionProcess(int (*matrix)[MatrixSize], int (*invertedMatrix)[MatrixSize], int size, int scaleFactor, int colMax, int colMaxIndex, int i){
    register int j, k, scalar;
    // this loop finds the rows to be swapped to get the next pivot
        for (k = i; k < size; k+=3)
        {
            colMax = matrix[k][i];
            if (matrix[k][i] > colMax)
            {
                colMax = matrix[k][i];
                colMaxIndex = k;
            }

            colMax = matrix[k+1][i];
            if (matrix[k+1][i] > colMax)
            {
                colMax = matrix[k+1][i];
                colMaxIndex = k+1;
            }

            colMax = matrix[k+2][i];
            if (matrix[k+2][i] > colMax)
            {
                colMax = matrix[k+2][i];
                colMaxIndex = k+2;
            }
        }

        // if the new pivot isn't on the right row
        if (colMaxIndex != i)
        {
            // swap rows to move the new pivot to the right position for both matrices
            swapRows(matrix, i, 0);
            swapRows(invertedMatrix, i, 0);

            swapRows(matrix, i, 1);
            swapRows(invertedMatrix, i, 1);
            for (k = 2; k < size; k+=2)
            {
                swapRows(matrix, i, k);
                swapRows(invertedMatrix, i, k);

                swapRows(matrix, i, k+1);
                swapRows(invertedMatrix, i, k+1);
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
        scaleElement(matrix, i, 0, scalar);
        scaleElement(invertedMatrix, i, 0, scalar);

        scaleElement(matrix, i, 1, scalar);
        scaleElement(invertedMatrix, i, 1, scalar);
        for (j = 2; j < size; j+=2)
        {
            scaleElement(matrix, i, j, scalar);
            scaleElement(invertedMatrix, i, j, scalar);

            scaleElement(matrix, i, j+1, scalar);
            scaleElement(invertedMatrix, i, j+1, scalar);
        }

        // subtracting the scaled pivot row from the remaining rows while stepping through rows
        for (k = 0; k < size; k++)
        {
            scalar = matrix[k][i];
            if (k != i)
            {
                addElement(matrix, i, k, 0, -scalar);
                addElement(invertedMatrix, i, k, 0, -scalar);

                addElement(matrix, i, k, 1, -scalar);
                addElement(invertedMatrix, i, k, 1, -scalar);
                for (j = 2; j < size; j+=2)
                {
                    addElement(matrix, i, k, j, -scalar);
                    addElement(invertedMatrix, i, k, j, -scalar);

                    addElement(matrix, i, k, j+1, -scalar);
                    addElement(invertedMatrix, i, k, j+1, -scalar);
                }
            }
        }
}


void invertMatrix(int (*matrix)[MatrixSize], int (*invertedMatrix)[MatrixSize], int size, int scaleFactor)
{
    register int i, scalar;
    register int colMax, colMaxIndex;

    for (i = 0; i < size; i+=2)
    {
        colMax = 0;
        colMaxIndex = i;

        inversionProcess(matrix, invertedMatrix, size, scalar, colMax, colMaxIndex, i);

        colMaxIndex = i+1;
        inversionProcess(matrix, invertedMatrix, size, scalar, colMax, colMaxIndex, i+1);
    }
}

void startProcess(){
    register int scaleFactor;
    float conditionNumber, matrixNorm, inverseNorm;

    // printf("Original Well Conditioned Matrix: \n");
    // printMatrix(wellConditionedMatrix, MatrixSize);

    // scale factor calculations
    scaleFactor = scaleFactorCalculation(wellConditionedMatrix);
    // printf("Well Conditioned Matrix Scale Factor: %d \n", scaleFactor);

    // finding matrix norm
    matrixNorm = approximateNorm(wellConditionedMatrix);
    // printf("Matrix Norm: %f \n", matrixNorm);

    // scaling inverted matrix result with the scale factor
    scaleMatrix(wellConditionedInversionResult, scaleFactor);

    // inverting matrices
    invertMatrix(wellConditionedMatrix, wellConditionedInversionResult, MatrixSize, scaleFactor);

    // calculating inverse norm
    inverseNorm = approximateNorm(wellConditionedInversionResult);
    // printf("Inverse Matrix Norm: %f \n", inverseNorm/MaxScale);

    // calculating condition number
    conditionNumber = (inverseNorm * matrixNorm)/MaxScale;
    // printf("Condition Number: %f \n", conditionNumber);

    // printf("\nOriginal Well Conditioned Matrix (After Inversion): \n");
    // printMatrix(wellConditionedMatrix, MatrixSize);

    // printf("\nResulting Inverse Matrix: \n");
    // printMatrix(wellConditionedInversionResult, MatrixSize);
}


int main(void)
{
    double runtime = 0;

   //startProcess();

    for(int i = 0; i < 100; i++){

        struct timeval start, end;
        double elapsed_time;

        // Timing the runtime of your program
        gettimeofday(&start, NULL);

        startProcess(); // Call your program

        gettimeofday(&end, NULL);
        elapsed_time = (end.tv_sec - start.tv_sec) * 1000000.0 + (end.tv_usec - start.tv_usec);

        runtime += elapsed_time;
    }

    printf("Run time avg: %.2f\n", runtime/100);

    return 0;
}
