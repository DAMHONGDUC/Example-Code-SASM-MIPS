section .text
    global _main
    extern _printf
    extern _scanf
    extern _getch
    
    
section .data
    tb1: db "Nhap 1 ki tu : ", 0
    tb2: db "ki tu lien truoc : %c",0
    tb3: db "ki tu lien sau : %c",0
    line: db "", 10, 0
    fmc: db "%c" 
    
section .bss
    c: resb 1
    t: resb 1
 
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
    
    ;xu li nhap ki tu
    push c
    push fmc
    call _scanf
    add esp, 8
    
    ;in ra ki tu lien truoc
    mov eax,[c]
    sub eax,1
    mov [t],eax 
    
    push dword[t]
    push tb2
    call _printf
    add esp, 8
    
    ;xuong dong
    push line
    call _printf
    add esp, 4
    
    ;in ra ki tu lien sau
    mov eax,[c]
    add eax,1
    mov [t],eax 
    
    push dword[t]
    push tb3
    call _printf
    add esp, 8
    
    
    ;thoat chuong trinh 
    jmp exit
    
    
     