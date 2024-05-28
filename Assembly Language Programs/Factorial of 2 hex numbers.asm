.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER A TWO-DIGIT HEX NUMBER: $'
MSG2 DB 0DH,0AH,'FACTORIAL IS: $'
NEWLINE DB 0DH,0AH,'$'
FACTORIAL DB 100 DUP(?) ; To store the factorial result
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
    ; MOV CX,0
    MOV CL,BL
    MOV Al,1
    
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
HEX_TO_DEC ENDP

PRINT_DECIMAL PROC
    MOV CX, 10                    ; CX is set to 10 for decimal division
    MOV DI, OFFSET FACTORIAL + 9  ; DI points to the end of the buffer
    MOV BYTE PTR [DI], '$'        ; Null-terminate the string with '$'
    DEC DI                        ; Move to the next position for digit storage

PRINT_LOOP:
    XOR DX, DX                    ; Clear DX for division
    DIV CX                        ; Divide AX by 10 (CX), quotient in AX, remainder in DX
    ADD DL, '0'                   ; Convert remainder to ASCII ('0'-'9')
    MOV [DI], DL                  ; Store ASCII digit in buffer
    DEC DI                        ; Move to the next position
    CMP AX, 0                     ; Check if quotient is zero
    JNE PRINT_LOOP                ; If not zero, continue the loop

    INC DI                        ; Move DI back to the first digit
    LEA DX, [DI]                  ; Load address of the string into DX
    MOV AH, 09H                   ; DOS function to print string
    INT 21H                       ; Call DOS interrupt
    RET                           ; Return from the procedure
PRINT_DECIMAL ENDP


END MAIN
