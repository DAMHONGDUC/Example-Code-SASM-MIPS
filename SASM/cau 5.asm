section .text
    extern _printf
    extern _scanf
    extern _getch
    global _main
    
section .data
    tb1: db "Nhap so thu nhat : ",0
    tb2: db "Nhap so thu hai : ",0
    tb3: db "So lon hon la : ",0
    tb4: db "Hai so bang nhau",0   
    line: db "", 10, 0
    fmd: db "%d", 0
    
    
section .bss
    a: resb 4
    b: resb 4  
    
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
    
equal:
    ;in ra tb4
    push tb4
    call _printf
    add esp, 4
    
    jmp exit
   
greater1:
     ;in ra tb3
    push tb3
    call _printf
    add esp, 4
    
    ;in ra a
    mov eax, DWORD[a]
    push eax
    push fmd
    call _printf
    add esp, 8
    
    jmp exit
    
greater2:
     ;in ra tb3
    push tb3
    call _printf
    add esp, 4
    
    ;in ra b
    mov eax, DWORD[b]
    push eax
    push fmd
    call _printf
    add esp, 8
    
    jmp exit

_main:
    ;create stack frame
    push ebp
    mov ebp, esp
    pushad 
    
    ;in ra tb1
    push tb1
    call _printf
    add esp, 4
    
    ;xu li de nhap so thu nhat
    push a
    push fmd
    call _scanf
    add esp, 8
    
    ;in ra tb2
    push tb2
    call _printf
    add esp, 4
    
    ;xu li de nhap so thu hai
    push b
    push fmd
    call _scanf
    add esp, 8
    
    ;so sanh
    mov eax,[a]
    cmp eax,[b]
    je equal
    jg greater1
    jmp greater2
   
    ;thoat chuong trinh
    jmp exit