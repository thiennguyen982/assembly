.data
prompt:      .asciiz "Enter a number: "       # String prompt
result_msg:  .asciiz "Fibonacci result: "      # Message for the result

.text
.globl main

main:
    # Print the prompt to ask for a number
    li $v0, 4                # syscall for print_string
    la $a0, prompt           # load the address of the prompt
    syscall

    # Read integer input from the user
    li $v0, 5                # syscall for read_int
    syscall
    move $t0, $v0            # move the input number into $t0 (n)

    # Call the fibonacci function
    move $a0, $t0            # move n into $a0 for the fibonacci function
    jal fibonacci             # jump to the fibonacci function

    # Print the result message
    li $v0, 4                # syscall for print_string
    la $a0, result_msg       # load address of result message
    syscall

    # Move the result (in $v0) into $a0 for printing
    move $a0, $v0            # move result into $a0
    li $v0, 1                # syscall for print_int
    syscall

    # Exit the program
    li $v0, 10               # syscall for exit
    syscall

# Fibonacci using matrix exponentiation
fibonacci:
    # Base case: if n == 0, return 0
    li $t1, 0                # $t1 = 0
    beq $a0, $t1, fib_zero    # if n == 0, go to fib_zero

    # Base case: if n == 1, return 1
    li $t2, 1                # $t2 = 1
    beq $a0, $t2, fib_one    # if n == 1, go to fib_one

    # Matrix for Fibonacci numbers
    # [ F(n)     F(n-1)   ] = [ 1 1 ]^n
    # [ F(n-1)   F(n-2)   ]   [ 1 0 ]
    
    # Prepare the result matrix
    li $t3, 1                # a = 1
    li $t4, 1                # b = 1
    li $t5, 0                # c = 0 (to hold F(n-1))

    # Calculate the power of the matrix
    move $t6, $a0            # n
    li $t7, 1                # Exponent
    
matrix_exponentiation_loop:
    # If n is odd
    andi $t8, $t6, 1         # t8 = n % 2
    beqz $t8, skip_mult      # if n is even, skip multiplication

    # Multiply the current matrix
    # New values for F(n)
    move $t9, $t3            # temp = a
    mul $t3, $t9, 1          # a = a * 1
    add $t3, $t3, $t4        # a = a + b

    # Update b and c
    move $t9, $t4            # temp = b
    mul $t4, $t9, 1          # b = b * 1
    add $t4, $t4, $t5        # b = b + c

skip_mult:
    # Square the matrix
    # New values for F(n-1)
    move $t9, $t3            # temp = a
    mul $t3, $t9, 1          # a = a * 1
    add $t3, $t3, $t4        # a = a + b

    # Update b and c
    move $t9, $t4            # temp = b
    mul $t4, $t9, 1          # b = b * 1
    add $t4, $t4, $t5        # b = b + c

    # Divide n by 2
    srl $t6, $t6, 1          # n = n / 2
    bnez $t6, matrix_exponentiation_loop  # Repeat until n == 0

return_n:
    move $v0, $t3            # move F(n) into $v0
    jr $ra                    # return to the caller

# Case: fib(0)
fib_zero:
    li $v0, 0                # return 0
    jr $ra                    # return to caller

# Case: fib(1)
fib_one:
    li $v0, 1                # return 1
    jr $ra                    # return to caller


#include <stdio.h>
#
#void multiply(int F[2][2], int M[2][2]) {
#    int x = F[0][0] * M[0][0] + F[0][1] * M[1][0];
#    int y = F[0][0] * M[0][1] + F[0][1] * M[1][1];
#    int z = F[1][0] * M[0][0] + F[1][1] * M[1][0];
#    int w = F[1][0] * M[0][1] + F[1][1] * M[1][1];
#
#    F[0][0] = x;
#    F[0][1] = y;
#    F[1][0] = z;
#    F[1][1] = w;
#}
#
#void power(int F[2][2], int n) {
#    int M[2][2] = {{1, 1}, {1, 0}};
#   
#    // Raise M to the power of n-1
#    for (int i = 2; i <= n; i++) {
#        multiply(F, M);
#    }
#}
#
#int fibonacci(int n) {
#    if (n == 0) return 0;
#    if (n == 1) return 1;
#
#    int F[2][2] = {{1, 1}, {1, 0}};
#    power(F, n - 1);
#
#    return F[0][0];  // F(n) is in F[0][0]
#}
#
#int main() {
#    int n;
#
#    // Prompt the user for input
#    printf("Enter a number: ");
#    scanf("%d", &n);
#
#    // Calculate Fibonacci
#    int result = fibonacci(n);
#
#    // Print the result
#    printf("Fibonacci result: %d\n", result);
#
#    return 0;
#}
# O(logn)