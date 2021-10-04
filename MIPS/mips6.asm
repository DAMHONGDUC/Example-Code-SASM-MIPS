.data
	tb1: .asciiz "Nhap mot ki tu : "
	tb2: .asciiz " la chu in hoa"
	tb3: .asciiz " la chu thuong"
	tb4: .asciiz " la so"
	tb5: .asciiz "\nKi tu vua nhap : "
.text

main:	
	# in ra tb1
	la $a0,tb1
	jal printf
	
	# xu li de nhap ki tu 
	li $v0,12
	syscall
	move $s0,$v0
	
	# in ra tb5
	la $a0,tb5
	jal printf
	
	# in ra $s0
	li $v0,11
	move $a0,$s0
	syscall
	
	# neu la chu in hoa thi in ra tb2
	bltu $s0,'A',next1
	bgtu $s0,'Z',next1
	
	la $a0,tb2
	jal printf
	j endx
    next1:
    
   	# neu la chu thuong thi in ra tb3
	bltu $s0,'a',next2
	bgtu $s0,'z',next2
	
	la $a0,tb3
	jal printf
	j endx
    next2:
    	
    	# neu la so thi in ra tb4
	bltu $s0,'0',next3
	bgtu $s0,'9',next3
	
	la $a0,tb4
	jal printf
	j endx
    next3:
   	
 endx:

exit:
	li,$v0,10
	syscall	
printf:
	li,$v0,4
	syscall
	jr $ra