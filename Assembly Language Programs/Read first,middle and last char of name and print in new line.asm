
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA     
MSG1 DB 'ENTER THREE INITIALS: $'
C1 DB ?,'$' 
C2 DB ?,'$'
C3 DB ?,'$'
.CODE
MAIN PROC    
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV C1,AL
    
     MOV AH,1
    INT 21H
    MOV C2,AL
    
     MOV AH,1
    INT 21H
    MOV C3,AL 
    
    MOV DL,10
    MOV AH,2H
    INT 21H  
    
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
      MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H 
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
      MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
     MOV DL,8
    MOV AH,2H
    INT 21H
    MOV DL,8
    MOV AH,2H
    INT 21H
    
    MOV DL,C1
    MOV AH,2
    INT 21H 
    MOV DL,10
    MOV AH,2H
    INT 21H 
    MOV DL,8
    MOV AH,2H
    INT 21H
    
   
    MOV DL,C2
    MOV AH,2
    INT 21H
    MOV DL,10
    MOV AH,2H
    INT 21H
    MOV DL,8
    MOV AH,2H
    INT 21H
    

    
    MOV DL,C3
    MOV AH,2
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    
    
    
    
    MAIN ENDP
END MAIN

ret




