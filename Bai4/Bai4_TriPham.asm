.data 
.text
.globl main
main:
	li $s0, 99             #Load count value
	li $t1, 0x10010000     #Load address of destination array
	
	Loop:
		beq $s0, $zero, End    #compare if count value equal 0 then jump to End
		      
                sw $s0, 0($t1)         #save value into a destination array
    		addi $t1, $t1, 4       #move 4 bits forward to store next value                

		sub $s0, $s0, 1        #subtract count value by one 
		j Loop                 #jump to Loop to repeat the cycle
		
	End:
		li $v0, 10             #End the program
		syscall
