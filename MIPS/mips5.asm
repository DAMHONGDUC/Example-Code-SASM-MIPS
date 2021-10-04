.data
	tb1: .asciiz "Nhap so a : "
	tb2: .asciiz "Nhap so b : "
	tb3: .asciiz "So lon hon la : "
	tb4: .asciiz "Hai so bang nhau "
.text

main:
	# in ra tb1
	la $a0,tb1
	jal printf
	
	# xu li nhap so thu nhat 
	li $v0,5
	syscall
	move $s0,$v0
	
	# in ra tb2
	la $a0,tb2
	jal printf
	
	# xu li nhap so thu hai 
	li $v0,5
	syscall
	move $s1,$v0
	
	# neu 2 so bang nhau
	beq $s0,$s1,equal
	
	# in ra tb3
	la $a0,tb3
	jal printf	
				
	# tru 2 so 
	sub $s2,$s0,$s1

	# neu $a2 > 0 
	move $a0,$s0
	bgez $s2,large
		
	# neu $a2 < 0 
	move $a0,$s1
	blez $s2,large
	
exit:
	li,$v0,10
	syscall	
printf:
	li,$v0,4
	syscall
	jr $ra
equal:
	# in ra tb4
	la $a0,tb4
	jal printf
	jal exit
	
large:
	li,$v0,1
	syscall	
	jal exit
	
	
