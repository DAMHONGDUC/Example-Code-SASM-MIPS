section .text
    global _main
    extern _printf
    extern _scanf
    extern _getch
    extern _gets
    
    global  _strlen
    
section .data
    tb1: db "Nhap 1 chuoi : ", 0
    tb2: db "Chuoi dao nguoc la : %s", 0
    tbx: db "ki tu : %c",0
    fms: db "%s", 0
    
section .bss
    string: resb 20
    string2: resb 20
    
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
    
length: 
    mov edx,[eax]
    inc eax
    inc esi
    
    test edx, edx
    jnz length
    
    sub eax,2
    sub esi, 2
    
    mov edx,string2
    
reversed: 
    mov ch, [eax]
    mov [edx],ch
    dec eax
    inc edx
    dec esi
    cmp esi, 0
    jge reversed
    
result: 
    mov edx, string2
    
    push edx
    push tb2
    call _printf
    add esp,8
    
    call _getch
    xor eax, eax
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
    call _scanf
    add esp, 8
    
    mov esi,0
    mov eax,string
    
    jmp length
    jmp reversed    
    jmp result
    jmp exit
    
    