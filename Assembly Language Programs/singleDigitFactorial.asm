.model small
.stack 100h
.data
msg1 db "Enter 1 digit (0-9): $"
msg2 db "Factorial is: $"
result db 9 dup(?)  ; buffer to hold the result as a string (max 8!, plus null terminator) 
ten dw 10 
newline db 0dh,0ah,'$'
.code
main:
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Display the message
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Read a single digit input
    mov ah, 01h
    int 21h
    sub al, 30h  ; Convert ASCII to integer
    mov ah, 0    ; clear ax register
    mov cx, ax   ; Store the input in CX

    ; Initialize for factorial calculation
    mov ax, 1

factorial:
    mul cx 
    CMP cx,0
    je new
    loop factorial
     new:
    ; Convert the result to a string
    lea si, result
    call ConvertToDecimal 
    
      ; new line
    lea dx,newline
    mov ah,09h
    int 21h

    ; Display the result message
    lea dx, msg2
    mov ah, 09h
    int 21h   
             

    ; Display the result
    lea dx, result
    mov ah, 09h
    int 21h

    ; Terminate program
    mov ah, 4Ch
    int 21h

; Procedure to convert AX (16-bit) to a null-terminated decimal string
ConvertToDecimal proc
    mov di, si
    add di, 6   ; Point to the end of the buffer
    mov byte ptr [di], '$'  ; Null terminator for DOS string

    ; Convert each digit
    convert_loop:
        dec di
        xor dx, dx
        div word ptr [ten]
        add dl, 30h
        mov [di], dl
        test ax, ax
        jnz convert_loop

    ret
ConvertToDecimal endp


end main
