.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER A TWO-DIGIT HEX NUMBER: $'
MSG2 DB 0DH,0AH,'FACTORIAL IS: $'
NEWLINE DB 0DH,0AH,'$'
FACTORIAL DB 10 DUP(0) ; To store the factorial result
.CODE
MAIN PROC      
    
    MOV AX,@DATA
    MOV DS,AX
    
    ; Display prompt message
    LEA DX,MSG1
    MOV AH,09H
    INT 21H 

    ; Read first hexadecimal digit
    MOV AH,01H
    INT 21H  
    MOV BL,AL
    CALL HEX_TO_DEC
    MOV BH,AL

    ; Read second hexadecimal digit
    MOV AH,01H
    INT 21H  
    MOV BL,AL
    CALL HEX_TO_DEC
    MOV CL,AL

    ; Combine two hex digits to form the number
    MOV AL,BH
    SHL AL,4
    ADD AL,CL
    MOV BL,AL

    ; Calculate factorial
    MOV CX,0
    MOV CL,BL
    MOV AX,1
FACTORIAL_LOOP:
    CMP CL,0
    JE DISPLAY_RESULT
    MUL CL
    DEC CL
    JMP FACTORIAL_LOOP

DISPLAY_RESULT:
    ; Display result message
    LEA DX,MSG2
    MOV AH,09H
    INT 21H

    ; Convert AX to decimal string and display
    CALL PRINT_DECIMAL
    
    ; Newline
    LEA DX,NEWLINE
    MOV AH,09H
    INT 21H
    
    ; Exit program
    MOV AH,4CH
    INT 21H

ENDP

HEX_TO_DEC PROC
    CMP BL,'0'
    JL INVALID_INPUT
    CMP BL,'9'
    JLE NUMERIC
    CMP BL,'A'
    JL INVALID_INPUT
    CMP BL,'F'
    JG INVALID_INPUT
    SUB BL,37H
    JMP DONE
NUMERIC:
    SUB BL,30H
DONE:
    MOV AL,BL
    RET
INVALID_INPUT:
    MOV AL,0
    RET
ENDP

PRINT_DECIMAL PROC
    MOV CX,10
    MOV DI,OFFSET FACTORIAL + 9
    MOV BYTE PTR [DI], '$'
    DEC DI
PRINT_LOOP:
    XOR DX,DX
    DIV CX
    ADD DL,'0'
    MOV [DI],DL
    DEC DI
    CMP AX,0
    JNE PRINT_LOOP
    INC DI
    LEA DX,DI
    MOV AH,09H
    INT 21H
    RET
ENDP

END MAIN
