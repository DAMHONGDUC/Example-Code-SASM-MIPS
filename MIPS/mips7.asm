.data
	tb1: .asciiz "Nhap so luong phan tu : "
	tb2: .asciiz ">_ "
	tb3: .asciiz "Cac phan tu da nhap : "
	arr: .word 0:100
	tb0: .asciiz " "
.text

main:
	#in ra tb1 
	la $a0,tb1
	jal printf
	
	# xu li de nhap n 
	li $v0,5
	syscall
	move $t0,$v0
	
	li $t1,0
	la $t2,arr
	
	loop:
	#in ra tb2
	la $a0,tb2
	jal printf
	
	# xu li nhap
	li $v0,5
	syscall
	
	sw $v0,($t2)
	addi $t1,$t1,1
	addi $t2,$t2,4
	blt $t1,$t0,loop
	
	#in ra tb3
	la $a0,tb3
	jal printf
	
	# in mang ra man hinh
	li $t1,0
	la $t2,arr
	
	loop2:	
	lw $t4,($t2)
	
	# in phan tu 
	li $v0,1
	move $a0,$t4
	syscall
	
	#in khoang trang
	la $a0,tb0
	jal printf
	
	addi $t1,$t1,1
	addi $t2,$t2,4
	blt $t1,$t0,loop2
	
	
exit:
	li,$v0,10
	syscall	
printf:
	li,$v0,4
	syscall
	jr $ra	
