    .data
prompt:  .asciiz "Enter a number: "   # String prompt

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
    move $a0, $v0            # move the input number into $a0

    # Call the fibonacci function
    jal fibonacci

    # Print the result
    move $a0, $v0            # move the result into $a0 for printing
    li $v0, 1                # syscall for print_int
    syscall

    # Exit the program
    li $v0, 10               # syscall for exit
    syscall

# Recursive Fibonacci function
fibonacci:
    # Base case: if n == 0, return 0
    li $t0, 0                # $t0 = 0
    beq $a0, $t0, fib_zero   # if n == 0, jump to fib_zero

    # Base case: if n == 1, return 1
    li $t1, 1                # $t1 = 1
    beq $a0, $t1, fib_one    # if n == 1, jump to fib_one

    # Recursive case: fib(n) = fib(n-1) + fib(n-2)

    # Save return address and registers
    addi $sp, $sp, -8        # allocate space on the stack
    sw $ra, 4($sp)           # save return address
    sw $a0, 0($sp)           # save argument n

    # Call fib(n-1)
    addi $a0, $a0, -1        # $a0 = n - 1
    jal fibonacci            # call fibonacci(n-1)
    move $t2, $v0            # save result of fib(n-1) in $t2

    # Restore argument n
    lw $a0, 0($sp)           # restore argument n

    # Call fib(n-2)
    addi $a0, $a0, -2        # $a0 = n - 2
    jal fibonacci            # call fibonacci(n-2)
    move $t3, $v0            # save result of fib(n-2) in $t3

    # Add fib(n-1) + fib(n-2)
    add $v0, $t2, $t3        # $v0 = fib(n-1) + fib(n-2)

    # Restore stack and return
    lw $ra, 4($sp)           # restore return address
    addi $sp, $sp, 8         # deallocate space from the stack
    jr $ra                   # return to caller

# Case: fib(0)
fib_zero:
    li $v0, 0                # return 0
    jr $ra                   # return to caller

# Case: fib(1)
fib_one:
    li $v0, 1                # return 1
    jr $ra                   # return to caller
    
    
#include <stdio.h>

#// Function to calculate Fibonacci number recursively
#int fibonacci(int n) {
#    // Base case: if n == 0, return 0
#    if (n == 0) {
#        return 0;
#    }
#    // Base case: if n == 1, return 1
#    if (n == 1) {
#        return 1;
#    }
#    
#    // Recursive case: fib(n) = fib(n-1) + fib(n-2)
#    return fibonacci(n - 1) + fibonacci(n - 2);
#}
#
#int main() {
#    int n;
#
#    // Prompt user for input
#    printf("Enter a number: ");
#    scanf("%d", &n);  // Read integer input

#    // Call the fibonacci function and store the result
#    int result = fibonacci(n);
#
#    // Print the result
#    printf("Fibonacci of %d is %d\n", n, result);

#    return 0;  // Exit the program
#}

# O(2^n)
