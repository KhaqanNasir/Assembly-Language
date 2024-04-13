

org 100h

.MODEL SMALL
.STACK 100H
.DATA    
MSG1 DB 'PRINT (A-Z) ALPHABETS $'
.CODE
MAIN PROC        
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1   ; PRINT STRING
    MOV AH,9
    INT 21H 
    
    MOV DL,0AH    ; NEW LINE
    MOV AH,2
    INT 21H 
    
    MOV DL,0DH    ; NEW LINE START
    MOV AH,2
    INT 21H
    
    MOV CX,26     ; COUNTER FOR LOOP
    MOV DX,65
    KHAQAN:       ; LABEL NAME FOR LOOP
      MOV AH,2
      INT 21H
      INC DX
    LOOP KHAQAN
      
      MOV AH,4CH
      INT 21H
    
    MAIN ENDP
END MAIN

ret




