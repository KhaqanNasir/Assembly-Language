org 100h

.model small
.data   
   msg db 10,13, "Enter Any Number :$"
.code
main proc 
    mov ax,@data
    mov ds,ax 
    
    LEA DX,MSG   
    mov ah,9h
    int 21h   
    
    mov ah,1h
    int 21h
    
    mov ch,0ah
    mov cl,0h
    
    
    cmp al,3ah
    sub al,30h
    mov bh,al  
    mov bl,1h 
    
 TableLoop: 
    
    mov dl,0dh
    mov ah,2h
    int 21h
    
    mov dl,0ah
    mov ah,2h
    int 21h
    
    mov dl,bh
    add dl,30h  
    mov ah,2h
    int 21h
    
    mov dl,'*'
    mov ah,2h
    int 21h    
    
    mov al,bl
    mul bh
    
    AAM   
    
    PUSH ax
    
    mov ah,0h
    mov al,bl
    
    AAA 
    
    mov cl,ah
    mov bl,al
    
    mov dl,cl
    add dl,30h
    mov ah,2h
    int 21h
    
    mov dl,bl
    add dl,30h
    mov ah,2h
    int 21h
    
    
 OutputTable:
    
    mov dl,'='
    mov ah,2h
    int 21h
    
    POP ax     
    
    mov dh,al
    mov dl,ah
    add dl,30h
    mov ah,2h
    int 21h
    
    mov dl,dh 
    add dl,30h
    mov ah,2h
    int 21h  
    
    INC bl
    DEC ch
    CMP ch,0h 
    JNE TableLoop
    
    QuitTable:
    
    mov ah,4ch
    int 21h 
    
    
main endp

ret