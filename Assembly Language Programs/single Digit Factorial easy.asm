.model small
.stack 100h
.data 
msg1 db "Enter number (1-9) : $"
msg2 db 0dh,0ah,"Factorial is : $"  
result dw 1
.code
mov ax,@data
mov ds,ax  
lea dx,msg1
mov ah,09h
int 21h  

mov ah,1h
int 21h
       
sub al,'0'
mov bl,al 
mov cx,bx
mov ax,1

factorial_loop:
mul cx
loop factorial_loop
mov result,ax      
             
             
lea dx,msg2
mov ah,09h
int 21h  

mov ax,result
call print_num

mov ah,4ch
int 21h 


print_num proc
     
mov cx,0
mov bx,10

print_loop:

xor dx,dx    ;clear dx register for remainder
div bx
push dx
inc cx
test ax,ax    ;and ax,ax
jnz print_loop

output:
pop dx
add dl,'0'
mov ah,2h
int 21h
loop output
ret 
print_num endp

