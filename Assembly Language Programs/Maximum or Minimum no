
; Maximum or Minimum Program
org 100h

.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 0AH,0DH,'ENTER 1st NUMBER : $'
MSG2 DB 0AH,0DH,'ENTER 2st NUMBER : $'
MSG3 DB 0AH,0DH,'ENTER 3st NUMBER : $'
MSG4 DB 0AH,0DH,'1ST NUMBER IS MAXIMUM :$'  
MSG5 DB 0AH,0DH,'2ND NUMBER IS MAXIMUM :$'  
MSG6 DB 0AH,0DH,'3RD NUMBER IS MAXIMUM :$' 

NUM1 DB ?
NUM2 DB ?
NUM3 DB ?

.CODE
MAIN PROC                   
    
    MOV AX,@DATA
    MOV DS,AX 
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV NUM1,AL   
    
     LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV NUM2,AL   
    
     LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV NUM3,AL 
   
    
    MOV BL,NUM1
    CMP BL,NUM2
    JNL NUMBER1
    
    MOV BL,NUM2
    CMP BL,NUM3
    JNL DISPLAY2
    
    
    NUMBER1: 
    MOV BL,NUM1
    CMP BL,NUM3
    JNL DISPLAY
    
    DISPLAY: 
    LEA DX,MSG4
    MOV AH,9
    INT 21H 
    HLT 
    
    DISPLAY2:
    LEA DX,MSG5
    MOV AH,9
    INT 21H 
    HLT 
    
    LEA DX,MSG6
    MOV AH,9
    INT 21H 
    HLT
    
    
     
    
    
    MAIN ENDP
END MAIN
ret




