section .text
    extern _printf
    extern _scanf
    extern _getch
    global _main
    
section .data
    tb0: db "Nhap so thu nhat : ",0
    tb1: db "Nhap so thu hai : ",0
    tb2: db "Tong : ", 0
    tb3: db "Hieu : ", 0
    tb4: db "Tich : ", 0
    tb5: db "Thuong : ", 0
    tb6: db " du ", 0
    line: db "", 10, 0
    fmd: db "%d", 0
    
    
section .bss
    a: resb 4
    b: resb 4  
    
section .text
global CMAIN
CMAIN: 
  
tong:
    ;in ra tb2
    push tb2
    call _printf
    add esp, 4
    
    ;in ra ket qua a + b
    mov eax, DWORD[a]
    add eax, DWORD[b]
    push eax
    push fmd
    call _printf
    add esp, 8
    
    ;xuong dong
    push line
    call _printf
    add esp, 4

hieu:
    ;in ra tb3
    push tb3
    call _printf
    add esp, 4
    
    ;in ra ket qa a - b
    mov eax, DWORD[a]
    sub eax, DWORD[b]
    push eax
    push fmd
    call _printf
    add esp, 8
    
    ;xuong dong
    push line 
    call _printf
    add esp, 4
    
tich:
    ;in ra tb4
    push tb4
    call _printf
    add esp, 4

    ;in ra ket qua a*b
    mov eax, DWORD[a]
    mul DWORD[b]
    push eax
    push fmd
    call _printf
    add esp, 8
    
    ;xuong dong
    push line 
    call _printf
    add esp, 4
        
thuong:
    ;in ra tb5
    push tb5
    call _printf
    add esp, 4
    
    ;in ra ket qua a/b
    mov eax, DWORD[a]
    div DWORD[b]
    push eax
    push fmd
    call _printf
    add esp, 8
    
so_du:
    ;in ra tb6
    push tb6
    call _printf
    add esp, 4
    
    ;in ra so du cua phep tinh a/b
    mov eax, DWORD[a]
    div DWORD[b]
    push edx
    push fmd
    call _printf
    add esp, 8
    
exit:    
    ;destroy stack frame
    popad
    mov esp, ebp
    pop ebp
    call _getch
    ret
    
_main:
    ;create stack frame
    push ebp
    mov ebp, esp
    pushad 
    
    ;in ra tb0
    push tb0
    call _printf
    add esp, 4
    
    ;xu li de nhap so thu nhat
    push a
    push fmd
    call _scanf
    add esp, 8
    
    ;in ra tb1
    push tb1
    call _printf
    add esp, 4
    
    ;xu ki de nhap so thu hai
    push b
    push fmd
    call _scanf
    add esp, 8

    jmp tong
    jmp hieu
    jmp tich
    jmp thuong
    jmp so_du 
    jmp exit
    
    
