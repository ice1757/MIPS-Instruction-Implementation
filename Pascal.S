main:
    addi $a0, $zero, 10 # n = 10
    addi $a1, $zero, 5  # m = 5
    jal pascal          # call pascal(10, 5)
    j exit

pascal:
    addi $sp, $sp, -4
    sw $ra, 0x0($sp)    # Save $ra register into stack

    #--------------------------------------#
    #  \^o^/   Write your code here~  \^o^/#
    beq $a1, $zero, Return1	#m==0 return 1  ���� Rerurn 1 (�^�� 1)
    beq $a0, $a1, Return1	#n==m return 1 , ���� Return 1 (�^�� 1)


    addi $sp, $sp, -16	
    sw $s0, 0($sp)	
    sw $s1, 4($sp)	
    sw $a0, 8($sp)	
    sw $a1, 12($sp)	
    
    addi $a0, $a0, -1	#n-1,m-1
    addi $a1, $a1, -1
    jal pascal
    add $s0, $v0, $zero	
    
    lw $a0, 8($sp)	#������l�Ѽ�
    lw $a1, 12($sp)
    addi $a0, $a0, -1	#n,m-1
    jal pascal
    add $s1, $v0, $zero 
    
    add $v0, $s0, $s1	#(n-1,m-1) + (n,m-1)
    lw $s0, 0($sp)	
    lw $s1, 4($sp)
    addi $sp, $sp, 16
    
    lw $ra, 0x0($sp)    
    addi $sp, $sp, 4	
    jr $ra
    #--------------------------------------#

    lw $ra, 0x0($sp)    # Load $ra register from stack
    addi $sp, $sp, 4
    jr $ra
Return1:
    addi $v0, $zero, 1	#���j���I�^��1
    #--------------------------------------#

    lw $ra, 0x0($sp)    # Load $ra register from stack
    addi $sp, $sp, 4
    jr $ra
    

exit: