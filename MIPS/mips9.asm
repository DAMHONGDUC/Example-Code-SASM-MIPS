.data
	input:	.space	256
	output:	.space 256
	tb1: .asciiz "Nhap chuoi : "
	tb2: .asciiz "Chuoi dao nguoc : "

.text
main:
	# in ra tb1
	la $a0,tb1
	jal printf
	
	#xu li nhap chuoi 
	li 	$v0,8
	la 	$a0,input
	li	$a1,256
	syscall
		
	#tim chieu dai chuoi 
	li	$t0,0	#khoi tao bien luu chieu dai chuoi
strlen_loop:
	add	$t2,$a0,$t0 #luu dia chi cua ki tu thu i 
	lb	$t1,0($t2)
	beq	$t1,'\n',get_len
	addi	$t0,$t0,1
	j	strlen_loop
get_len:
	sub	$t0,$t0,1
	
	li	$t1,0	#phan tu dau tien cua chuoi ket qua
	la	$s0,output #dia chi cua chuoi output
reverse_loop:
	#lay ki tu cua chuoi output
	add	$t2,$a0,$t0
	lb	$t3,0($t2)
	#lay dia chi chuoi ki tu chuoi output
	add	$t4,$s0,$t1
	sb	$t3,0($t4)
	beq	$t0,0,exit_reverse
	addi	$t1,$t1,1
	subi	$t0,$t0,1
	j	reverse_loop
exit_reverse:
	# in ra tb2
	la $a0,tb2
	jal printf

	li $v0,4
	la $a0,output
	syscall

exit:
	li,$v0,10
	syscall	
	
printf:
	li,$v0,4
	syscall
	jr $ra	
	

