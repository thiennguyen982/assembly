.data 
.text
.globl main
main:
	li $s0, 99
	li $t1, 0x10010000
	
	Loop:
		beq $s0, $zero, End
		      
                sw $s0, 0($t1) 
    		addi $t1, $t1, 4                    

		sub $s0, $s0, 1
		j Loop
		
	End:
		li $v0, 10
		syscall