.model small
.stack 100h
.data

array1 db 100 dup(?) 

array2 db 100 dup(?) 

.code
main proc
    mov ax, @data 
    mov ds, ax

    mov si, offset array1 
    mov di, offset array2 
    mov cx, 100         

           
        cld    ; Clear Direction Flag (DF) 
   
 khaqan:
    movsb      ; Move byte from SI to DI and increment both pointers
    loop khaqan         

    
    mov ah,4ch
    int 21h

main endp
end main