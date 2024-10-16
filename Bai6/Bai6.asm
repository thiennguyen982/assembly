        .data
array:  .word 10, 25, 3, 78, 55, 1, 22, 44, 99, 12, 36, 45, 67, 88, 17, 5  # 16-word array
prompt: .asciiz "The largest number is: "   # Prompt message for output

        .text
        .globl main

main:
        la   $t0, array         # Load address of the array into $t0
        lw   $v1, 0($t0)        # Initialize $v1 with the first element of the array
        li   $t1, 15            # Set loop counter to 15 (for the next 15 elements)

loop:
        lw   $a0, 0($t0)        # Load current element into $a0
        move $a1, $v1            # Move current maximum ($v1) into $a1
        jal  GETMAX              # Call GETMAX function
        move $v1, $v0            # Update $v1 with the result from GETMAX

        addi $t0, $t0, 4         # Move to the next element in the array
        addi $t1, $t1, -1         # Decrement loop counter
        bgez $t1, loop           # Continue loop if counter is non-negative

        # The largest number is now in $v1
        # Print the largest number
        li   $v0, 4             # Load print string syscall
        la   $a0, prompt        # Load address of the prompt
        syscall                  # Print prompt

        li   $v0, 1             # Load print integer syscall
        move $a0, $v1           # Move the largest number to $a0
        syscall                  # Print the largest number

        # Exit program
        li   $v0, 10            # Load exit system call
        syscall                  # Exit

GETMAX:
        bge $a0, $a1, return_a0  # If $a0 >= $a1, jump to return_a0
        move $v0, $a1             # Else, move $a1 to $v0
        jr $ra                     # Return

return_a0:
        move $v0, $a0             # Move $a0 to $v0
        jr $ra                     # Return
