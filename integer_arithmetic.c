#include<stdio.h>
#include<math.h>

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
    {1, 9, 0, 5, 1, 7}
};

int inverse[MATRIX_SIZE][MATRIX_SIZE] = 
{
    {1, 0, 0, 0, 0, 0},
    {0, 1, 0, 0, 0, 0},
    {0, 0, 1, 0, 0, 0},
    {0, 0, 0, 1, 0, 0},
    {0, 0, 0, 0, 1, 0},
    {0, 0, 0, 0, 0, 1},
};

void printMatrix(int matrix[MATRIX_SIZE][MATRIX_SIZE]){
    int i,j;
    for(i=0;i<MATRIX_SIZE;i++){
        for(j=0;j<MATRIX_SIZE;j++){
            printf("%d ",matrix[i][j]);
        }
        printf("\n");
    }
}

void gaussJordan(){
    int i, j, k;
    int zero_diagonal = 0; // Initialize flag to false

    printf("\nMatrix before\n");
    printMatrix(matrix);

    for (i = 0; i < MATRIX_SIZE; i++) {
        for (j = 0; j < MATRIX_SIZE; j++) {
            if (i != j) {
                printf("\n%d\n", matrix[i][i]);
                if (matrix[i][i] == 0) {
                    zero_diagonal = 1; // Set flag to true
                    break; // Exit inner loop if diagonal element is zero
                }
                temp = matrix[j][i] / matrix[i][i];
                for (k = 0; k < MATRIX_SIZE; k++) {
                    matrix[j][k] -= matrix[i][k] * temp;
                    inverse[j][k] -= inverse[i][k] * temp;
                }
            }
        }
    }
    // for(i = 0; i < MATRIX_SIZE; i++){
    //     int pivot = matrix[i][i];
    //     for(j = 0; j < MATRIX_SIZE; j++){
    //         int multiple = matrix[i][j] /= pivot;
    //         if(i == j){
    //             matrix[i][j] /= matrix[i][i];
    //         }else{
    //             int temp = multiple*matrix[i][j];
    //             matrix[i][j] = matrix[i][j] - 
    //         }
    //     }
    // }
    printf("\nMatrix after\n");

    printMatrix(matrix);
    for(i=0;i<MATRIX_SIZE;i++){
        temp=matrix[i][i];
        if(temp == 0){
            return;
        }
        for(j=0;j<MATRIX_SIZE;j++){
            matrix[i][j]=matrix[i][j]/temp;
            inverse[i][j]=(inverse[i][j]*SCALE_FACTOR)/temp;
        }
    }
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
    if(max > 0) scale_factor = SCALE_FACTOR/max;

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

    gaussJordan();

    int inverse_norm = approximate_norm(inverse);
    printf("Inverse norm is:%d\n", inverse_norm);

    int condition_num = norm * inverse_norm;
    
    return condition_num;
}

int main(){
    printMatrix(matrix);
    int scale_factor = scale_factor_calculation(matrix);
    printf("Scale factor: %d\n", scale_factor);
    scale_matrix(matrix, scale_factor);
    int condition_number = compute_condition_num(matrix, inverse, scale_factor);
    printf("Condition Number: %d\n", condition_number);
    
    printf("\nInverse Matrix is:\n");
    printMatrix(inverse);
    return 0;
}