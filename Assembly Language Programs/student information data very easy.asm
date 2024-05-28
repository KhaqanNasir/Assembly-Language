.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER STUDENT NAME: $'
MSG2 DB 0DH,0AH,'ENTER DEGREE NAME: $'
MSG3 DB 0DH,0AH,'ENTER CREDITS TAKEN SO FAR: $'
MSG4 DB 0DH,0AH,'ENTER TOTAL CREDITS REQUIRED: $'
MSG5 DB 0DH,0AH,'CREDITS NEEDED TO GRADUATE: $'
STUDENT_NAME DB 50 DUP('$')
DEGREE_NAME DB 50 DUP('$')

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
    MOV AH,01H
    INT 21H   
    SUB AL,30H 
    MOV BL,AL 
    
    ; Get total credits
    LEA DX,MSG4
    MOV AH,09H
    INT 21H
    MOV AH,01H
    INT 21H  
    SUB AL,30H
    MOV CL,AL


    SUB CL,BL  
    ADD CL,30H

    ; Display credits needed to graduate
    LEA DX,MSG5
    MOV AH,09H
    INT 21H

  
    MOV DL,CL
    MOV AH,02H
    INT 21H

    MOV AH,4CH
    INT 21H
MAIN ENDP


END MAIN
