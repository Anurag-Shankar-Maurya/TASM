; to interchange a block of data
.model small
.stack 100h
.data
    source db 1, 2, 3, 4, 5
    target db 6, 7, 3, 1, 2
    
.code
start:
    mov ax, @data
    mov ds, ax
    
    mov cx, 5
    
    lea si, source
    lea di, target
    
interchange_loop:
    mov al, [si]
    mov bl, [di]
    
    mov [si], bl
    mov [di], al
    
    inc si
    inc di
    
    dec cx
    jnz interchange_loop

print_target:
    lea di, target
    mov cx, 5

print_loop:
    mov al, [di]
    
    add al, '0'   ; convert to ASCII before printing
    mov ah, 02h
    int 21h

    inc di
    dec cx
    jnz print_loop

exit_loop:
    mov ah, 4ch
    int 21h

end start  
