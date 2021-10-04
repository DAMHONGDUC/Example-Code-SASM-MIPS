section .text
    global _main
    extern _printf
    extern _scanf
    extern _getch
    
section .data
    tb1: db "Nhap n : ", 0
    tb2: db ">_ ", 0
    tb3: db " ",0
    tb4: db "Mang vua nhap : ",0
    space: db " ", 0
    fmd: db "%d", 0

section .bss
    n: resb 4
    array: resb 20

section .text
global CMAIN
CMAIN: 

Nhap:
    ;in ra tb2
    push tb2
    call _printf
    add esp, 4
    
    ;doc cac phan tu vao mang
    push ebx
    push fmd
    call _scanf
    add esp, 8
    
    ;+stack pointer, ++i
    add ebx, 4
    add esi, 1
    cmp esi, DWORD[n]
    jl Nhap
    
    ;reset i & stack
    mov ebx, array
    mov esi, 0
    
    ret
    
Xuat: 
    ;in ra a[i]
    push DWORD [ebx]
    push fmd
    call _printf
    add esp, 8
    
    ;in ra khoang trang
    push tb3
    call _printf
    add esp, 4
    
    ;+stack pointer, +i
    add esi, 1
    add ebx, 4
    cmp esi, DWORD[n]    
    jl Xuat
    
    ret

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
    
    ;xu li de nhap n
    push n
    push fmd
    call _scanf
    add esp, 8
    
    ;load mang 
    mov ebx, array
    
    ;i = 0
    mov esi, 0
    
    call Nhap
    
    ;in ra tb4
    push tb4
    call _printf
    add esp, 4
    call Xuat 
    
    jmp exit
    


