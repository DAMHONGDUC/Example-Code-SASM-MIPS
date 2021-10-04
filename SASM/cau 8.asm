section .text
    global _main
    extern _printf
    extern _scanf
    extern _getch
    
section .data
    tb1: db "Nhap n : ", 0
    tb2: db "Tong tu 1 den n la : ", 0
    fmd: db "%d", 0

section .bss
    n: resb 4    

section .text
global CMAIN
CMAIN: 

tinhtong:
    ;eax = eax + ebx
    add eax, esi    
     
    ;i++       
    inc esi  
    
    ;i <= n, continue           
    cmp esi, edx
    jle tinhtong        
    
    mov ebx, eax
    ret
    
ketqua:
    ;in ra tb2
    push tb2
    call _printf
    add esp, 4
    
    push ebx
    push fmd
    call _printf
    add esp, 8
    
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
    
    ; ebx = n
    mov edx, DWORD[n] 
    
    ;khoi tao i = 0    
    mov esi, 0            
    
    ; khoi tao result = 0
    mov eax, 0           
    
    call tinhtong
    call ketqua
    jmp exit
    

