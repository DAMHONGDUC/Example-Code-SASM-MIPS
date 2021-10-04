.data
	tb1: .asciiz "Nhap chuoi: "
	tb2: .asciiz "Chuoi vua nhap la: "
	
	str: .space 30
.text
main:
	#xuat tb1
	li $v0, 4 # gan $v0 = 4
	la $a0,tb1
	syscall

	#Nhap chuoi
	li $v0,8
	la $a0,str
	li $a1,30
	syscall

	#Xuat tb2
	li $v0,4
	la $a0,tb2
	syscall

	# xuat str
	li $v0,4
	la $a0,str
	syscall

	