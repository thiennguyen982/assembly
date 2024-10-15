        .data
prompt: .asciiz "Enter two numbers: "

        .text
        .globl main

main:
        # Print prompt message
        li $v0, 4                # syscall for print_string
        la $a0, prompt           # load address of prompt
        syscall                  # make the syscall

        # Read first number
        li $v0, 5                # syscall for read_int
        syscall                  # make the syscall
        move $a0, $v0            # move first number to $a0

        # Read second number
        li $v0, 5                # syscall for read_int
        syscall                  # make the syscall
        move $a1, $v0            # move second number to $a1

        # Call GETMAX function
        jal GETMAX               # jump and link to GETMAX

        # Print the result
        move $a0, $v0            # move result to $a0 for printing
        li $v0, 1                # syscall for print_int
        syscall                  # make the syscall

        # Exit program
        li $v0, 10               # syscall for exit
        syscall                  # make the syscall

GETMAX:
        # Compare $a0 and $a1
        bge $a0, $a1, return_a0  # if $a0 >= $a1, go to return_a0
        move $v0, $a1            # else move $a1 to $v0
        jr $ra                    # return

return_a0:
        move $v0, $a0            # move $a0 to $v0
        jr $ra                    # return
