.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER A NUMBER (0-999): $'
MSG2 DB 0DH,0AH,'NUMBER IS EVEN $'
MSG3 DB 0DH,0AH,'NUMBER IS ODD $'
NUM1 DB ?
NUM2 DB ?
NUM3 DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    ; Input first digit
    MOV AH, 01H
    INT 21H
    SUB AL, '0' ; Convert from ASCII to number
    MOV NUM1, AL

    ; Input second digit
    MOV AH, 01H
    INT 21H
    SUB AL, '0' ; Convert from ASCII to number
    MOV NUM2, AL

    ; Input third digit
    MOV AH, 01H
    INT 21H
    SUB AL, '0' ; Convert from ASCII to number
    MOV NUM3, AL

    ; Combine digits to form the number
    MOV AL, NUM1
    MOV BL, 10
    MUL BL ; AL = AL * 10
    ADD AL, NUM2 ; AL = AL + second digit
    MOV BL, 10
    MUL BL ; AL = AL * 10
    ADD AL, NUM3 ; AL = AL + third digit

    ; Check if number is odd or even 
   
    AND AL, 01H
    JZ EVEN
    LEA DX, MSG3
    JMP PRINT

EVEN:
    LEA DX, MSG2

PRINT:
    MOV AH, 09H
    INT 21H
    MOV AH, 4CH
    INT 21H

ENDP
END MAIN
