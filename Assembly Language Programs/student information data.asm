.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER STUDENT NAME: $'
MSG2 DB 0DH,0AH,'ENTER DEGREE NAME: $'
MSG3 DB 0DH,0AH,'ENTER CREDITS TAKEN SO FAR: $'
MSG4 DB 0DH,0AH,'ENTER TOTAL CREDITS REQUIRED: $'
MSG5 DB 0DH,0AH,'CREDITS NEEDED TO GRADUATE: $'
NEWLINE DB 0DH,0AH,'$'
STUDENT_NAME DB 50 DUP('$')
DEGREE_NAME DB 50 DUP('$')
CREDITS_TAKEN DB 5 DUP(0)
TOTAL_CREDITS DB 5 DUP(0)
CREDITS_NEEDED DW ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ; Get student name
    LEA DX,MSG1
    MOV AH,09H
    INT 21H
    LEA DX,STUDENT_NAME
    MOV AH,0AH
    INT 21H

    ; Get degree name
    LEA DX,MSG2
    MOV AH,09H
    INT 21H
    LEA DX,DEGREE_NAME
    MOV AH,0AH
    INT 21H

    ; Get credits taken so far
    LEA DX,MSG3
    MOV AH,09H
    INT 21H
    LEA DX,CREDITS_TAKEN
    MOV AH,0AH
    INT 21H

    ; Get total credits required
    LEA DX,MSG4
    MOV AH,09H
    INT 21H
    LEA DX,TOTAL_CREDITS
    MOV AH,0AH
    INT 21H

    ; Convert credits taken to number
    LEA SI,CREDITS_TAKEN + 2
    CALL STR_TO_NUM
    MOV BX,AX

    ; Convert total credits required to number
    LEA SI,TOTAL_CREDITS + 2
    CALL STR_TO_NUM
    MOV DX,AX

    ; Calculate credits needed to graduate
    SUB DX,BX
    MOV CREDITS_NEEDED,DX

    ; Display credits needed to graduate
    LEA DX,MSG5
    MOV AH,09H
    INT 21H

    ; Convert number to string and display
    MOV AX,CREDITS_NEEDED
    CALL NUM_TO_STR
    LEA DX,NEWLINE
    MOV AH,09H
    INT 21H

    MOV AH,4CH
    INT 21H

ENDP

STR_TO_NUM PROC
    XOR AX,AX
    XOR CX,CX
    MOV CX,10

    NEXT_DIGIT:
        MOV DL,[SI]
        SUB DL, '0'
        MUL CX
        ADD AX,DX
        INC SI
        CMP [SI],0DH
        JNE NEXT_DIGIT

    RET
STR_TO_NUM ENDP

NUM_TO_STR PROC
    MOV SI,OFFSET NEWLINE
    ADD SI,4

    MOV CX,10
    XOR DX,DX

    NEXT_DIGIT_REV:
        DIV CX
        ADD DL,'0'
        DEC SI
        MOV [SI],DL
        XOR DX,DX
        CMP AX,0
        JNE NEXT_DIGIT_REV

    MOV DX,SI
    MOV AH,09H
    INT 21H

    RET
NUM_TO_STR ENDP

END MAIN
