.MODEL SMALL
.STACK 100H
.DATA  
MSG1 DB 0AH,0DH, 'ENTER 1st NUMBER: $' 
MSG2 DB 0AH,0DH, 'ENTER 2nd NUMBER: $'
MSG3 DB 0AH,0DH, 'ENTER 3rd NUMBER: $'
NUM1 DB ?
NUM2 DB ?
NUM3 DB ?
MAX  DB ?
MIN  DB ?
RESULT1 DB 0AH,0DH, 'MAXIMUM: $'
RESULT2 DB 0AH,0DH, 'MINIMUM: $'
.CODE
MAIN PROC      
    MOV AX,@DATA
    MOV DS,AX

    ; input first number
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL, '0' ; Convert from ASCII
    MOV NUM1,AL
    
    ; input second number
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL, '0' 
    MOV NUM2,AL
    
    ; input third number
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL, '0' 
    MOV NUM3,AL 

    ; Initialize MAX and MIN with the first number
    MOV AL, NUM1
    MOV MAX, AL
    MOV MIN, AL

    ; Compare and find MAX
    MOV AL, NUM2
    CMP AL, MAX     
    JG NEW_MAX        ;if num2 > num1
    JMP CONTINUE_MAX    ; used for unconditional jump
NEW_MAX:
    MOV MAX, AL   ;max=num2
CONTINUE_MAX:
    MOV AL, NUM3
    CMP AL, MAX
    JG NEW_MAX2        ;if num3 > num2
    JMP CONTINUE_MIN
NEW_MAX2:
    MOV MAX, AL     ;max=num3

    ; Compare and find MIN
CONTINUE_MIN:
    MOV AL, NUM2
    CMP AL, MIN  
    JL NEW_MIN    ; if num2 < num1
    JMP CONTINUE_MIN2
NEW_MIN:
    MOV MIN, AL  ; min = num2
CONTINUE_MIN2:
    MOV AL, NUM3
    CMP AL, MIN
    JL NEW_MIN2        ;if num3<num2
    JMP DISPLAY_RESULT
NEW_MIN2:
    MOV MIN, AL  ;min=num3

DISPLAY_RESULT:
    ; Display MAX    
    LEA DX,RESULT1
    MOV AH,9
    INT 21H
    MOV DL, MAX
    ADD DL, '0' ; Convert to ASCII
    MOV AH, 2
    INT 21H

    ; Display MIN
    LEA DX,RESULT2
    MOV AH,9
    INT 21H
    MOV DL, MIN
    ADD DL, '0' 
    MOV AH, 2
    INT 21H

    MOV AX,4CH
    INT 21H
MAIN ENDP
END MAIN
