section .text
    global _main
    extern _printf
    extern _scanf
    extern _gets
    extern _getch
    
section .data
    tb1: db "Nhap vao mot ki tu : ",0
    tb2: db "Ki tu vua nhap : %c",0
    tb3: db " la so",0
    tb4: db " la chu thuong",0
    tb5: db " la chu hoa",0
    fmc: db "%c"
 
section .bss
    c: resb 1

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

la_chu_hoa: 
    ;in ra c
    push dword[c]
    push tb2
    call _printf
    add esp,8
    
    ;in ra tb5
    push tb5
    call _printf
    add esp,8
    
    jmp exit  
    
la_chu_thuong: 
    ;in ra c
    push dword[c]
    push tb2
    call _printf
    add esp,8
    
    ;in ra tb4
    push tb4
    call _printf
    add esp,8
    
    jmp exit   
    
la_so: 
    ;in ra c
    push dword[c]
    push tb2
    call _printf
    add esp,8
    
    ;in ra tb3
    push tb3
    call _printf
    add esp,8
    
    jmp exit           

v1:
    mov eax,[c]
    cmp eax,'Z'
    jle la_chu_hoa

v2:
    mov eax,[c]
    cmp eax,'z'
    jle la_chu_thuong
    
v3:
    mov eax,[c]
    cmp eax,'9'
    jle la_so    
          
_main:
    ;create stack frame
    push ebp
    mov ebp, esp
    pushad
    
    ;in ra tb1
    push tb1
    call _printf
    add esp, 4
    
    ;xu li de nhap ki tu
    push c
    push fmc
    call _scanf
    add esp, 8
    
    ; chu hoa
    mov eax,[c]
    cmp eax,'A'
    jae v1
    
    ; chu thuong
    mov eax,[c]
    cmp eax,'a'
    jae v2
    
    ; so
    mov eax,[c]
    cmp eax,'0'
    jae v3
    
    jmp exit