.data
	tb1: .asciiz "Nhap n : "
	tb2: .asciiz "Tong tu 1 -> n la  : "
	arr: .word 0:100
.text

main:
	#in ra tb1 
	la $a0,tb1
	jal printf
	
	# xu li nhap n
	li $v0,5
	syscall
	move $t0,$v0
	
	# khoi tao 
	addi $t1,$t1,0 # i = 0
	addi $t2,$t2,0 # sum = 0
	
	#in ra tb2
	la $a0,tb2
	jal printf
	
	# xu li cong 
	loop:
	addi $t1,$t1,1 # i++
	add $t2,$t2,$t1 # sum = sum + i
	beq $t0,$t1,printSUM
	j loop
		
printSUM:			
	#in ra ket qua
	li $v0,1
	move $a0,$t2
	syscall
	
exit:
	li,$v0,10
	syscall	
	
printf:
	li,$v0,4
	syscall
	jr $ra	
	
