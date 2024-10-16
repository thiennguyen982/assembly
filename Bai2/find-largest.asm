        .data
array:  .word 29, 1, 19, 74, 26, 2, 20, 5
prompt: .asciiz "The largest number is: "

        .text
        .globl main

main:	
	la   $t0, 0x12345678    # Load address of array
	la   $t0, array         # Load address of the array into $t0
        lw   $v1, 0($t0)        # Initialize $v1 with the first element of the array
        li   $t1, 7             # next 7 word

loop:
        lw   $a0, 0($t0)        # Load current element into $a0
        move $a1, $v1           # Move current maximum ($v1) into $a1
        jal  find_largest       
        move $v1, $v0           

        addi $t0, $t0, 4        # Move to the next element in the array
        addi $t1, $t1, -1       # Decrement loop counter
        bgez $t1, loop          # Continue loop if counter is non-negative

        # The largest number is now in $v1
        # Print the largest number
        li   $v0, 4             # Load print string syscall
        la   $a0, prompt        # Load address of the prompt
        syscall                 # Print prompt

        li   $v0, 1             # Load print integer syscall
        move $a0, $v1           # Move the largest number to $a0
        syscall                 # Print the largest number

        # Exit program
        li   $v0, 10            # Load exit system call
        syscall                 # Exit

find_largest:
        bge $a0, $a1, next
        move $v0, $a1           # Else, move $a1 to $v0
        jr $ra                  # Return

next:
        move $v0, $a0           # Move $a0 to $v0
        jr $ra                  # Return
