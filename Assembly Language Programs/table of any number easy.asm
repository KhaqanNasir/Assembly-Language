.MODEL SMALL
.STACK 100H
.DATA
    MSG DB "ENTER ANY NUMBER TO PRINT TABLE: $"
    NEWLINE DB 0DH, 0AH,'$'
    EQUALSIGN DB ' = $'
    MULSIGN DB ' x $'
.CODE
MAIN PROC
   
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG
    MOV AH, 9H
    INT 21H
    
    MOV AH, 01H
    INT 21H
    
    SUB AL, 30H
    MOV BL, AL 
    
    MOV CH, 0AH  ; Loop counter set to 10 for single digit
    MOV CL, 01H  ; Start the multiplication from 1
    
TABLELOOP:
  
    LEA DX, NEWLINE
    MOV AH, 9H
    INT 21H
    
    ; Print the number
    MOV DL, BL
    ADD DL, 30H
    MOV AH, 2H
    INT 21H
    
    ; Print ' x '
    LEA DX, MULSIGN
    MOV AH, 9H
    INT 21H
    
    ; Print the multiplier (CL) 
    CMP CL,0AH    ; FOR PRINT 10 INSTEAD OF ;
    JZ L2
    JMP CONTINUE
    L2:
    MOV DL,'1'
    MOV AH,02H
    INT 21H
    MOV DL,'0'
    MOV AH,02H
    INT 21H 
    JMP CONTINUE2 
    CONTINUE:   
    MOV DL, CL
    ADD DL, 30H
    MOV AH, 02H
    INT 21H 
    CONTINUE2:
    
    ; Print '='
    LEA DX, EQUALSIGN
    MOV AH, 9H
    INT 21H
    
    ; Calculate BL * CL
    MOV AL, BL
    MUL CL 
    AAM ; ASCII ADJUST FOR MULTIPLICATION
    
    MOV DX,AX 
    ADD DL,30H 
    MOV AH,02H
    INT 21H
    
    ; Increment the multiplier
    INC CL
    DEC CH
    CMP CH,00H
    JNZ TABLELOOP
    
    ; Exit program
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
