    .data
A:  .space 400              # Allocate space for 100 integers (100 * 4 bytes = 400 bytes)

    .text
    .globl main
main:
    li   $t0, 99            # Load the value 99 into register $t0 (i = 99)
    la   $t1, A             # Load the address of the array A into register $t1 (A = 0x10010000)

loop:
    sll  $t2, $t0, 2        # Shift left $t0 by 2 bits (i * 4) to calculate the byte offset
    add  $t2, $t1, $t2      # Add the offset to the base address to get the address of A[i]
    sw   $t0, 0($t2)        # Store the value of i at the address A[i]
    
    sub  $t0, $t0, 1       # Decrement i (i--)
    bgez $t0, loop          # If i >= 0, branch back to loop

    li   $v0, 10            # Load the value 10 into $v0 (exit syscall)
    syscall		    # Exit the program
