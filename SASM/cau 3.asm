section .text
    global _main
    extern _printf
    extern _scanf
    extern _getch
    
section .data
    tb1: db "Nhap 1 ki tu hoa : ", 0
    tb2: db "ki tu thuong la : %c",0
    line: db "", 10, 0
    fms: db "%c" 
    
section .bss
    c: resb 1
    t: resb 1
 
section .text
global CMAIN
CMAIN: 

exit:
    ;destroy stack frame
    ;popad
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
    
    ;xu li nhap ki tu
    push c
    push fms
    call _scanf
    add esp, 8
    
    ;in ra ki thuong
    mov eax,[c]
    add eax,32
    mov [t],eax 
    
    push dword[t]
    push tb2
    call _printf
    add esp, 8
    
    ;thoat chuong trinh 
    jmp exit
    
    
     