.data
  	tb1: .asciiz "Nhap 1 ki tu in hoa : "
	tb2: .asciiz "\nKi tu thuong la : "
 .text
 
 main:
 	# in ra tb1
  	la $a0, tb1
  	jal printf  
 
 	# xu li de nhap 1 ki tu 
 	li $v0, 12
 	syscall
 	addi $s0,$v0,0
 	
 	# in ra tb1
  	la $a0, tb2
  	jal printf 
  	
  	# xu li de in ra 1 ki tu thuong
  	li $v0,11
  	addi $a0,$s0,32
  	syscall
 		
 	
exit:  
  	li $v0, 10  
  	syscall   

printf:  
	li $v0, 4  
  	syscall  
  	jr $ra
