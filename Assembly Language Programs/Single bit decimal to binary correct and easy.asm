.stack 100h
.model small
.data
msg1 db "Enter number in decimal : $"
msg2 db 13,10,"in binary : $"   
.code
MOV AX,@DATA
MOV DS,AX
lea dx,msg1
mov ah,9h  
int 21h
mov ah,1h
int 21h
mov ah,0
sub ax,48
mov cx,0
mov dx,0
mov bx,2
divide:
div bx
mov ah,0
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
mov ah,4ch
int 21h