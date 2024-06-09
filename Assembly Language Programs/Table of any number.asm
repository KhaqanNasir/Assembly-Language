.MODEL SMALL 
.STACK 100H
.DATA   
   MSG DB "ENTER ANY NUMBER TO PRINT TABLE :$"
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX 
    
    LEA DX,MSG   
    MOV AH,9H
    INT 21H   
    
    MOV AH,1H
    INT 21H
    
    MOV CH,0AH
    MOV CL,0H
   
  ;  CMP AL,3AH
    SUB AL,30H
    MOV BH,AL  
    MOV BL,1H 
    
 TABLELOOP: 
    
    MOV DL,0DH     ;carrige return
    MOV AH,2H
    INT 21H
    
    MOV DL,0AH     ;new line
    MOV AH,2H
    INT 21H
    
    MOV DL,BH
    ADD DL,30H  
    MOV AH,2H
    INT 21H
    
    MOV DL,'x'
    MOV AH,2H
    INT 21H    
    
    MOV AL,BL
    MUL BH
    
    AAM    ;adjust ascii for multiplication
    
    PUSH AX
    
    MOV AH,0H
    MOV AL,BL
    
    AAA 
    
    MOV CL,AH
    MOV BL,AL
    
    MOV DL,CL
    ADD DL,30H
    MOV AH,2H
    INT 21H
    
    MOV DL,BL
    ADD DL,30H
    MOV AH,2H
    INT 21H
    
    
 OUTPUTTABLE:
    
    MOV DL,'='
    MOV AH,2H
    INT 21H
    
    POP AX     
    
    MOV DH,AL
    MOV DL,AH
    ADD DL,30H
    MOV AH,2H
    INT 21H
    
    MOV DL,DH 
    ADD DL,30H
    MOV AH,2H
    INT 21H         
    
    
    INC BL
    DEC CH
    CMP CH,0H 
    JNE TABLELOOP
    
    
    MOV AH,4CH
    INT 21H 
    
    
MAIN ENDP
END MAIN
