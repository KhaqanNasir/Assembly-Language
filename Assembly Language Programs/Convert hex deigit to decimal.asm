
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA   
MSG1 DB 'ENTER A HEX DIGIT : $'
MSG2 DB ' IN DECIMAL IT IS : $'
RES DB ?
.CODE
MAIN PROC 
          MOV AX,@DATA
          MOV DS,AX
          
          LEA DX,MSG1
          MOV AH,9
          INT 21H
          
          MOV AH,1
          INT 21H  
          SUB AL,11H
          MOV RES,AL
          
          LEA DX,MSG2
          MOV AH,9
          INT 21H 
          
          MOV DL,RES
          MOV AH,2
          INT 21H
          
          MOV AH,4CH
          INT 21H
    
    MAIN ENDP
END MAIN

ret




