
; Even or Odd Number Program
org 100h

.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 0AH,0DH,'ENTER A NUMBER (0-9) : $'
MSG2 DB 0AH,0DH,'NUMBER IS EVEN  $'
MSG3 DB 0AH,0DH,'NUMBER IS ODD  $'  
.CODE
MAIN PROC                   
    
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
   
    
    MOV BL,2
    DIV BL
    
    CMP AH,0
    JE EVEN  
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    EVEN:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    
    MAIN ENDP
END MAIN
ret




