	.data
prompt: .asciiz "Enter a number: " # Prompt message for output

	.text
	.globl main
	
main:
	li $v0, 4 			# syscall for print string
	la $a0, prompt			# load address of prompt
	syscall

	# Read integer input
    	li $v0, 5                # syscall for read integer
    	syscall
    	move $a0, $v0            # move input into $a0 (argument for Fibonacci)

    	# Call Fibonacci function
    	jal fibonacci

    	# Print result
    	li $v0, 1                # syscall for print integer
    	add $a0, $v0, $zero      # move result into $a0
    	syscall

    	# Exit program
    	li $v0, 10               # syscall for exit
    	syscall

# Fibonacci function
# Input: $a0 = n
# Output: $v0 = Fibonacci(n)
fibonacci:
    	# Base case: if n == 0, return 0
    	beqz $a0, base_case_0
    	# Base case: if n == 1, return 1
    	li $t0, 1
    	beq $a0, $t0, base_case_1

    	# Recursive case: Fibonacci(n) = Fibonacci(n-1) + Fibonacci(n-2)
    	# First call Fibonacci(n-1)
    	addi $a0, $a0, -1       # n - 1
    	jal fibonacci            # call fibonacci(n-1)
    	move $t1, $v0           # save Fibonacci(n-1) in $t1

    	# Second call Fibonacci(n-2)
    	addi $a0, $a0, -1       # n - 2
    	jal fibonacci            # call fibonacci(n-2)

    	# Add results of Fibonacci(n-1) and Fibonacci(n-2)
    	add $v0, $v0, $t1       # Fibonacci(n) = Fibonacci(n-1) + Fibonacci(n-2)
    	jr $ra                   # return from function

base_case_0:
    	li $v0, 0                # return 0 for Fibonacci(0)
    	jr $ra                   # return

base_case_1:
    	li $v0, 1                # return 1 for Fibonacci(1)
    	jr $ra                   # return