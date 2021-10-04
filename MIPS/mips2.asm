.data  

  	stNhap: .asciiz "Nhap vao 1 ki tu : "

  	stXuatTruoc:.asciiz "\nKi tu dung truoc : " 

  	stXuatSau: .asciiz "\nKi tu dung sau : "

.text  

main:  
	# in ra stNhap
  	la $a0, stNhap  
  	jal printf  
	
	# xu li de nhap vao 1 ki tu 
	li $v0,12
	syscall
	addi $s0,$v0,0
	
	# in ra stXuatTruoc
	la $a0, stXuatTruoc
	jal printf
	
	# in ra ki tu dung truoc 
	li $v0, 11
	addi $a0,$s0,-1
	syscall
	
	# in ra stXuatSau
	la $a0, stXuatSau
	jal printf
	
	# in ra ki tu dung sau
	li $v0, 11
	addi $a0,$s0,1
	syscall
	
exit:  
  	li $v0, 10  
  	syscall   

printf:  
	li $v0, 4  
  	syscall  
  	jr $ra
