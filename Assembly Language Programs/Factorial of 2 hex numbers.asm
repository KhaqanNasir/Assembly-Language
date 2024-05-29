.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER A TWO-DIGIT HEX NUMBER: $'
MSG2 DB 0DH,0AH,'FACTORIAL IS: $' 
TEN DW 10
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
    MOV AL,1
    
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
    
    LEA SI,FACTORIAL

    ; Convert AX to decimal string and display
    CALL ConvertToDecimal
    
      
     lea dx, FACTORIAL
    mov ah, 09h
    int 21h
    
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
    JE HEX
    CMP BL,'B'
    JE HEX 
    CMP BL,'C'
    JE HEX 
    CMP BL,'D'
    JE HEX
    CMP BL,'E'
    JE HEX
    CMP BL,'F'
    JE HEX
    JG INVALID_INPUT 
  HEX:  
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

ConvertToDecimal proc
    mov di, si
    add di, 10   ; Point to the end of the buffer
    mov byte ptr [di], '$'  ; Null terminator for DOS string

    ; Convert each digit
    convert_loop:
        dec di
        xor dx, dx
        div word ptr [ten]
        add dl, 30h
        mov [di], dl
        test ax, ax
        jnz convert_loop

    ret
ConvertToDecimal endp


END MAIN
