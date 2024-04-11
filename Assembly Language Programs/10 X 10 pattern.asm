
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA  
MSG1 DB 0AH,0DH,'**********$'
.CODE
MAIN PROC  
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    INT 21H 
     INT 21H
    INT 21H
     INT 21H
    INT 21H
     INT 21H
    INT 21H
    
    
    
    
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN

ret




