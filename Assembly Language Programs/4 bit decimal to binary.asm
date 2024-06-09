.model small
.stack 100h
.data
msg1 db "Enter a 5-digit decimal number: $"

msg2 db 13,10,"Result in binary: $"

result dw ?
.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg1
    mov ah, 9h
    int 21h  

   
    mov ax, 0
    push ax

   
    mov ah, 1h
    int 21h
    sub al, '0'  
    mov ah, 0
    mov bx, 10000
    mul bx
    pop dx
    add dx, ax
    push dx

    
    mov ah, 1h
    int 21h
    sub al, '0'
    mov ah, 0
    mov  bx, 1000
    mul bx
    
    pop dx
    add dx, ax
    push dx

    
    mov ah, 1h
    int 21h
    sub al, '0'
    mov ah, 0
    mov bx, 100
    mul bx
     pop dx
    add dx, ax
    push dx

   
    mov ah, 1h
    int 21h
    sub al, '0'
    mov ah, 0
    mov bx, 10
    mul bx
    pop dx
    add dx, ax
    push dx

   
    mov ah, 1h
    int 21h
    sub al, '0'
    mov ah, 0
    pop dx
    add dx, ax
    push dx     
    
    mov cx,0
    mov ax,0
    mov dx,0

pop ax  

mov cx,0
mov dx,0
mov bx,2
     
divide:
 mov dx,0
 
div bx
push dx 
inc cx
cmp ax,0
jne divide  

lea dx,msg2 
mov ah,9h
int 21h
              
              
print:
pop dx 
add dx,48
mov ah,2h
int 21h
loop print


MOV AH,4CH
INT 21H 

endp 
end main