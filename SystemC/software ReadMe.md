# Matrix Inversion and Condition Number Calculation

This repository contains two C programs for matrix inversion and condition number calculation of a given matrix. The code is optimized and unoptimized versions for comparison purposes.

## Features
- Matrix inversion using Gaussian Elimination method.
- Calculation of the condition number of a matrix.
- Approximation of matrix norm using the maximum absolute row sum method.
- Scale factor calculation to ensure well-conditioned matrices.

## Contents
1. `final_optimized.c`: Optimized C code to invert a well-conditioned matrix, calculate its condition number, and approximate matrix norms.
2. `final_unoptimized.c`: Unoptimized C code with the same functionalities as the optimized version.

## Software Optimization Techniques
The optimized version of the code incorporates various software optimization techniques to enhance performance and reduce computational overhead. These techniques are carefully applied to improve the efficiency of matrix inversion and condition number calculation processes.

Loop Unrolling: Loop unrolling is a compiler optimization technique that reduces loop overhead by manually replicating loop iterations. Instead of executing the loop incrementally, multiple loop iterations are combined into a single iteration. This reduces loop control overhead and improves instruction-level parallelism, allowing the processor to execute more instructions in parallel. In the context of matrix operations, loop unrolling can significantly speed up the process by minimizing loop control instructions.

Register Variables: By using the register keyword, certain variables are stored in processor registers rather than in memory. Accessing data from registers is much faster than accessing data from memory, as registers are located within the CPU itself. By designating certain variables as register variables, the code can reduce memory accesses and improve overall performance, especially when dealing with frequently accessed variables in nested loops.

Loop Fusion: Loop fusion is a technique that combines multiple loops with similar functionalities into a single loop. This reduces loop overhead and reduces the number of instructions executed. In matrix operations, loop fusion can be employed to merge loops that perform similar calculations, thereby reducing redundant operations and enhancing computational efficiency.

These optimization techniques work in synergy to make the matrix inversion and condition number calculation processes more efficient. By minimizing loop overhead, reducing memory accesses, and optimizing critical function calls, the optimized version achieves better performance compared to the unoptimized version. It is important to note that the effectiveness of these optimizations may vary depending on the specific hardware architecture and compiler used. Therefore, careful profiling and testing are essential to fine-tune the optimizations for the best performance on a target platform.

