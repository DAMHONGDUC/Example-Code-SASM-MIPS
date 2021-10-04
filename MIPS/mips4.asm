.data
	tb1: .asciiz "Nhap a: "
	tb2: .asciiz "Nhap b: "
	tb3: .asciiz "Tong la: "
	tb4: .asciiz "\nHieu la: "
	tb5: .asciiz "\nTich la: "
	tb6: .asciiz "\nThuong la: "
	tb7: .asciiz "  Du la: "
.text
	# in ra tb1
	la $a0,tb1
	jal printf
	
	# xu li de nhap so nguyen a 
	li $v0,5
	syscall
	move $s0,$v0
	
	# in ra tb2
	la $a0,tb2
	jal printf
	
	# xu li de nhap so nguyen b
	li $v0,5
	syscall
	move $s1,$v0
	
	# in ra tb3
	la $a0,tb3
	jal printf
	
	# in ra tong
	li $v0,1
	add $a0,$s0,$s1
	syscall
	
	# in ra tb4
	la $a0,tb4
	jal printf
	
	# in ra hieu
	li $v0,1
	sub $a0,$s0,$s1
	syscall
	
	# in ra tb5
	la $a0,tb5
	jal printf
	
	# in ra tich
	li $v0,1
	mul $a0,$s0,$s1
	syscall
	
	# in ra tb6
	la $a0,tb6
	jal printf
	
	# tinh thuong va phan du
	div $s0,$s1
	mflo $s3 
	mfhi $s4
	
	# in ra thuong
	li $v0,1
	move $a0,$s3
	syscall
	
	# in ra tb7
	la $a0,tb7
	jal printf
	
	# in ra phan du 
	li $v0,1
	move $a0,$s4
	syscall
	
exit:  
  	li $v0, 10  
  	syscall   

printf:  
	li $v0, 4  
  	syscall  
  	jr $ra
	