main:
    addi $a0, $zero, 19654 # a0= 19654
    addi $a1, $zero, 100654  # a1=100654
    addi $a2, $zero, 10065  # a2= 10065
    jal average     # call average
    j exit

average:
    addi $sp, $sp, -4
    sw $ra, 0x0($sp)    # Save $ra register into stack

    #--------------------------------------#
    #  \^o^/   Write your code here~  \^o^/#
    add $t0, $a0, $a1  
    add $t0, $t0, $a2  # a1+a2+a3放進t0
    addi $t1, $zero, 3 # 3放進t1
    jal div1
    
div1:
    addu $t7, $zero $zero	# i = 0
		
div_2:
    slt	$t6, $t0, $t1		
    bne	$t6, $zero, div_end	
    sub	$t0, $t0, $t1		
    addi $t7, $t7, 1		
    j	div_2		

div_end:
    addu $v0, $zero, $t7		# 商
    addu $v1, $zero, $t0		# 餘數
    
    
    #--------------------------------------#

    lw $ra, 0x0($sp)    # Load $ra register from stack
    addi $sp, $sp, 4
    jr $ra

exit:
