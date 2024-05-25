.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER A STRING: $'
MSG2 DB 0DH,0AH,'REVERSE STRING IS: $'
NEWLINE DB 0DH,0AH,'$'
.CODE
MAIN PROC      
    
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,MSG1
    MOV AH,09H
    INT 21H 
    MOV SI,0
    MOV CX,0
  L:  
    MOV AH,01H
    INT 21H  
    CMP AL,0DH   ; PRESS ENTER FOR END OF STRING
    JZ L2
    PUSH AX
    INC CX
    JMP L  
  
  L2:
   LEA DX,MSG2
   MOV AH,09H
   INT 21H
   
    LEA DX,NEWLINE
   MOV AH,09H
   INT 21H
  L3:
  POP AX
  MOV DL,AL
  MOV AH,02H
  INT 21H
  LOOP L3 
      
    
ENDP
END MAIN                                               
