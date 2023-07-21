#include <stdio.h>
#include <sys/time.h>

#define MATRIX_SIZE 3
#define MAX_SCALER 65536

//the well-conditioned matrix to be inverted
// line below for matlab debugging
// [1,2,1,1,2,1; 5, 2, 7, 1, 1, 3;7, 1, 1, 4, 1, 2;1, 1, 5, 2, 3, 7;1, 2, 5, 2, 2, 1;1, 2, 1, 1, 1, 2]
// float well_conditioned_matrix[MATRIX_SIZE][MATRIX_SIZE] = 
// {
//     {1, 2, 1, 1, 2, 1},
//     {5, 2, 7, 1, 1, 3},
//     {7, 1, 1, 4, 1, 2},
//     {1, 1, 5, 2, 3, 7},
//     {1, 2, 5, 2, 2, 1},
//     {1, 2, 1, 1, 1, 2}
// };

// //allocating memory and defining the identity matrix to have row operations completed on it for the inversion
// float well_conditioned_inversion_result[MATRIX_SIZE][MATRIX_SIZE] = 
// {
//     {1, 0, 0, 0, 0, 0},
//     {0, 1, 0, 0, 0, 0},
//     {0, 0, 1, 0, 0, 0},
//     {0, 0, 0, 1, 0, 0},
//     {0, 0, 0, 0, 1, 0},
//     {0, 0, 0, 0, 0, 1},
// };

// int m_well[MATRIX_SIZE][MATRIX_SIZE] = 
// {
//     {5, 2, 1, 1, 2, 1},
//     {5, 1, 7, 1, 1, 3},
//     {7, 1, 7, 9, 1, 2},
//     {1, 1, 5, 3, 3, 5},
//     {1, 2, 5, 2, 2, 1},
//     {1, 9, 0, 5, 1, 7}
// };

// int m_well_result[MATRIX_SIZE][MATRIX_SIZE] = 
// {
//     {1, 0, 0, 0, 0, 0},
//     {0, 1, 0, 0, 0, 0},
//     {0, 0, 1, 0, 0, 0},
//     {0, 0, 0, 1, 0, 0},
//     {0, 0, 0, 0, 1, 0},
//     {0, 0, 0, 0, 0, 1},
// };

// float m_well_result_float[MATRIX_SIZE][MATRIX_SIZE] = 
// {
//     {1, 0, 0, 0, 0, 0},
//     {0, 1, 0, 0, 0, 0},
//     {0, 0, 1, 0, 0, 0},
//     {0, 0, 0, 1, 0, 0},
//     {0, 0, 0, 0, 1, 0},
//     {0, 0, 0, 0, 0, 1},
// };

// int m_ill[MATRIX_SIZE][MATRIX_SIZE] = 
// {
//     {5, 5, 1, 1, 2, 1},
//     {5, 1, 14, 1, 1, 7},
//     {7, 8, 7, 9, 1, 2},
//     {1, 1, 5, 3, 3, 5},
//     {20, 2, 5, 2, 5, 1},
//     {1, 9, 7, 5, 1, 7},
// };

// int m_ill_result[MATRIX_SIZE][MATRIX_SIZE] = 
// {
//     {1, 0, 0, 0, 0, 0},
//     {0, 1, 0, 0, 0, 0},
//     {0, 0, 1, 0, 0, 0},
//     {0, 0, 0, 1, 0, 0},
//     {0, 0, 0, 0, 1, 0},
//     {0, 0, 0, 0, 0, 1},
// };

// //the ill-conditioned matrix to be inverted
// float ill_conditioned_matrix[MATRIX_SIZE][MATRIX_SIZE] = 
// {
//     {1, 2, 1, 1, 2, 1},
//     {5, 33, 7, 1, 1, 3},
//     {7, 1, 1, 4, 1, 2},
//     {1, 1, 5, 2, 3, 7},
//     {1, 2, 5, 50, 2, 1},
//     {1, 20, 1, 1, 1, 2}
// };

// //creating another matrix for the ill-conditioned result
// float ill_conditioned_inversion_result[MATRIX_SIZE][MATRIX_SIZE] = 
// {
//     {1, 0, 0, 0, 0, 0},
//     {0, 1, 0, 0, 0, 0},
//     {0, 0, 1, 0, 0, 0},
//     {0, 0, 0, 1, 0, 0},
//     {0, 0, 0, 0, 1, 0},
//     {0, 0, 0, 0, 0, 1},
// };

int matrix_exaxmple[3][3] =
{
    {-1, 1, 4},
    {2, 1, 5},
    {1, 1, 6}
};

int matrix_exaxmple_result[3][3] =
{
    {1, 0, 0},
    {0, 1, 0},
    {0, 0, 1}
};

void printMatrix(int matrix[MATRIX_SIZE][MATRIX_SIZE]) {
    for (int i = 0; i < MATRIX_SIZE; i++) {
        for (int j = 0; j < MATRIX_SIZE; j++) {
            printf("%d\t", matrix[i][j]);
        }
        printf("\n");
    }
}

// void printMatrixFloat(int matrix[MATRIX_SIZE][MATRIX_SIZE], float scale) {
//     for (int i = 0; i < MATRIX_SIZE; i++) {
//         for (int j = 0; j < MATRIX_SIZE; j++) {
//             matrix[i][j]*=scale;
//             printf("%.4f\t", (float)matrix[i][j]);
//         }
//         printf("\n");
//     }
// }


void swapRows(int matrix[MATRIX_SIZE][MATRIX_SIZE], int row1, int row2) {
    for (int i = 0; i < MATRIX_SIZE; i++) {
        int temp = matrix[row1][i];
        matrix[row1][i] = matrix[row2][i];
        matrix[row2][i] = temp;
    }
}

void scaleRow(int matrix[MATRIX_SIZE][MATRIX_SIZE], int row, int scalar, int scaleFactor) {
    for (int i = 0; i < MATRIX_SIZE; i++) {
        matrix[row][i] = (matrix[row][i]) * scalar;
    }
}

void addRows(int matrix[MATRIX_SIZE][MATRIX_SIZE], int srcRow, int destRow, int scalar) {
    for (int i = 0; i < MATRIX_SIZE; i++) {
        matrix[destRow][i] += scalar * (matrix[srcRow][i]<<16);
        matrix[destRow][i] = matrix[destRow][i] >> 16;
        printf("source row: %d\n", srcRow);
        printf("dest row: %d\n", destRow);
        printf("scalar: %d\n", scalar);
    }
}

void invertMatrix(int matrix[MATRIX_SIZE][MATRIX_SIZE], int inverse[MATRIX_SIZE][MATRIX_SIZE], int scale_factor) {

printf("Starting invert matrix\n");
    printMatrix(matrix);

    // Proceed with matrix inversion
    for (int i = 0; i < MATRIX_SIZE; i++) {
        // If the pivot element is zero, swap rows
        int pivot = matrix[i][i];
        if (pivot == 0) {
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
            // Update the pivot after swapping rows
            pivot = matrix[i][i];
        }

        printf("After pivoting: \n");
        printMatrix(matrix);

        // // Divide the pivot row by the pivot element
        // int scalar = matrix[i][i];
        // for (int j = 0; j < MATRIX_SIZE; j++) {
        //     matrix[i][j] /= scalar;
        //     inverse[i][j] = (inverse[i][j] * scale_factor) / scalar;
        // }

        // // Eliminate other rows
        // for (int j = 0; j < MATRIX_SIZE; j++) {
        //     if (j != i) {
        //         int factor = matrix[j][i];
        //         addRows(matrix, i, j, -factor);
        //         addRows(inverse, i, j, -factor);
        //     }
        // }
    }
}

int findGreatestColumnVal(int matrix[MATRIX_SIZE][MATRIX_SIZE], int column){
    int greatestInColumn = matrix[0][column];
    int greatestIndex = 0;
    for(int i = 1; i < MATRIX_SIZE; i++){
        if(matrix[i][column] > greatestInColumn){
            greatestInColumn = matrix[i][column];
            greatestIndex = i;
        }
        printf(" %d\n", greatestInColumn);
    }
    return greatestIndex;
}

int findScalar(int matrix[MATRIX_SIZE][MATRIX_SIZE], int row, int column){
    printf("Val: %d\n",matrix[row][column]);
    return (matrix[row][column] << 16)/matrix[0][0];
}

void gaussJordan(int matrix[MATRIX_SIZE][MATRIX_SIZE], int inverse[MATRIX_SIZE][MATRIX_SIZE]) {

    int pivot = matrix[0][0];
    printMatrix(matrix_exaxmple);
    for(int i = 0; i < MATRIX_SIZE; i++) // i is the current row
    {
        pivot = matrix[i][i];
        printf("Scale Factor: %d\n", MAX_SCALER/pivot);
        scaleRow(matrix_exaxmple, i, MAX_SCALER/pivot, MAX_SCALER);
        matrix[i][i] = MAX_SCALER;
        printf("Current Pivot at row %d: %d\n", i, pivot);
    }
    printf("Before Adding Rows\n");
    printMatrix(matrix_exaxmple);

        for(int i = 0; i < 1; i++) // i is the current row
    {
        pivot = matrix[i][i];
        printf("Current Pivot at row %d: %d\n", i, pivot);
        //printf("%d\n", matrix[i][1]);
        addRows(matrix_exaxmple, 0, 1, -matrix[1][0]/pivot);
        addRows(matrix_exaxmple, 0, 2, -matrix[2][0]/pivot);
        // for(int j = 0; j < 1; j++)
        // {
        //     if(j != i)
        //     {
        //         printf("Matrix/pivot = %d\n", matrix[j][i]/pivot);
        //         printf("Matrix: %d\n", matrix[j][i]);
        //         addRows(matrix_exaxmple, i, j, -matrix[j][i]/pivot);
        //     }
        // }
    }

    printf("After Adding Rows\n");
    printMatrix(matrix_exaxmple);
}



int scale_factor_calculation(int matrix[MATRIX_SIZE][MATRIX_SIZE]){
    int scale_factor = 0;
    int max = 0;

    //Loop through matrix to find the maximum element
    for(int i = 0; i < MATRIX_SIZE; i++){
        for(int j = 0; j < MATRIX_SIZE; j++){
            if (matrix[i][j] > max) max = matrix[i][j];
        }
    }
    if(max > 0) scale_factor = MAX_SCALER/max;

    return scale_factor;
}

void scale_matrix(int matrix[MATRIX_SIZE][MATRIX_SIZE], int scale_factor){
    //Scale each element in the matrix
    for(int i = 0; i < MATRIX_SIZE; i++){
        for(int j = 0; j < MATRIX_SIZE; j++){
            matrix[i][j] *= scale_factor;
        }
    }
}

int approximate_norm(int matrix[MATRIX_SIZE][MATRIX_SIZE]){
    //Goal: estimate the condition number without calculating the norm
    //Approximate the matrix norm by finding the maximum absolute row sum

    int norm = 0;
    for(int i = 0; i < MATRIX_SIZE; i++){
        int row_sum = 0;
        for(int j = 0; j < MATRIX_SIZE; j++){
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

int compute_condition_num(int matrix[MATRIX_SIZE][MATRIX_SIZE], int inverse[MATRIX_SIZE][MATRIX_SIZE], int scale_factor){
    //Goal: estimate the condition number without calculating the norm
    //Approximate the matrix norm by finding the maximum absolute row sum
    int norm = approximate_norm(matrix);
    printf("Norm is:%d\n", norm);

    invertMatrix(matrix, inverse, scale_factor);

    printMatrix(inverse);

    int inverse_norm = approximate_norm(inverse);
    printf("Inverse norm is:%d\n", inverse_norm);

    int condition_num = norm * inverse_norm;
    
    return condition_num;
}

int start_process(){
    // printMatrix(m_well);
    // int scale_factor = scale_factor_calculation(m_well);
    // printf("Scale factor: %d\n", scale_factor);
    // scale_matrix(m_well, scale_factor);
    // int condition_number = compute_condition_num(m_well, m_well_result, scale_factor);
    // printf("Condition Number: %d\n", condition_number);
    //printMatrix(m_well_result);
    //printMatrixFloat(m_well_result, 1/scale_factor);

    // invertMatrix(matrix_exaxmple, matrix_exaxmple_result, 1);
    gaussJordan(matrix_exaxmple, matrix_exaxmple_result);

    //printMatrix(m_ill);
    //int scale_factor_ill = scale_factor_calculation(m_ill);
    //printf("Scale factor: %d\n", scale_factor_ill);
    //int condition_number_ill = compute_condition_num(m_ill, m_ill_result);
    //printf("Condition Number: %d\n", condition_number_ill);
    //scale_matrix(m_ill, scale_factor_ill);
    //printMatrix(m_ill_result);
    
    return 0;
}

int main() {

    double runtime = 0;

    start_process();

    // for(int i = 0; i < 100; i++){

    //     struct timeval start, end;
    //     double elapsed_time;

    //     // Timing the runtime of your program
    //     gettimeofday(&start, NULL);

    //     start_process(); // Call your program

    //     gettimeofday(&end, NULL);
    //     elapsed_time = (end.tv_sec - start.tv_sec) * 1000000.0 + (end.tv_usec - start.tv_usec);

    //     runtime += elapsed_time;

    //     //printf("Runtime: %.2f microseconds\n", elapsed_time);

    // }

    //printf("Run time avg: %.2f\n", runtime/100);

    return 0;
}