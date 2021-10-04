section .text
    global _main
    extern _printf
    extern _gets
    extern _getch
    
section .data
    tb1: db "Nhap 1 chuoi : ", 0
    tb2: db "Chuoi vua nhap la : ", 0
    fms: db "%s", 0
    
section .bss
    string: resb 20
 
section .text
global CMAIN
CMAIN: 
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
    
    ;in ra tb1
    push tb1
    call _printf
    add esp, 4
    
    ;xu li nhap chuoi
    push string
    push fms
    call _gets
    add esp, 8
    
    ;in ra tb2
    push tb2
    call _printf
    add esp, 4
    
    ;in ra ket qua
    mov eax, string
    push eax
    push fms
    call _printf
    add esp, 8
    
    ;thoat chuong trinh 
    jmp exit

