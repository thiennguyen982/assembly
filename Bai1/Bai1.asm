    .text
    .globl main

main:
    la   $t0, 0x10010000     # Load address of the source array
    la   $t1, 0x10010100     # Load address of the destination array
    li   $t2, 8              # Set the counter to 8 (for 8 words)

copy_loop:
    beq  $t2, $zero, exit    # If counter is 0, exit

    lw   $t3, 0($t0)         # Load word from source array
    sw   $t3, 0($t1)         # Store word into destination array

    addi $t0, $t0, 4         # Move to the next word in source array
    addi $t1, $t1, 4         # Move to the next word in destination array
    addi $t2, $t2, -1        # Decrease counter by 1

    j    copy_loop           # Repeat the loop

exit:
    li   $v0, 10             # System call for program exit
    syscall                  # Exit the program