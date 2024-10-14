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

# Recursive Fibonacci function
fibonacci:
    # Base case: if n <= 1, return n
    ble $a0, 1, return_n     # if n <= 1, go to return_n

    # Initialize variables: a = 0, b = 1
    li $t1, 0                # $t1 = a (F(0))
    li $t2, 1                # $t2 = b (F(1))
    li $t3, 2                # $t3 = i (loop counter, starting from 2)

fibonacci_loop:
    # Calculate next Fibonacci number: c = a + b
    add $t4, $t1, $t2        # $t4 = c (F(i) = a + b)

    # Update a and b
    move $t1, $t2            # a = b
    move $t2, $t4            # b = c

    # Increment loop counter
    addi $t3, $t3, 1         # i++
    ble $t3, $a0, fibonacci_loop  # if i <= n, continue loop

return_n:
    # Return the result in $v0 (which is the last computed Fibonacci number)
    move $v0, $t2            # move b (F(n)) into $v0
    jr $ra                    # return to the caller


#int fibonacci(int n) {
#    if (n <= 1) return n;
#    int a = 0, b = 1, c;
#    for (int i = 2; i <= n; i++) {
#        c = a + b;
#        a = b;
#        b = c;
#    }
#    return b;
#}

#O(n)