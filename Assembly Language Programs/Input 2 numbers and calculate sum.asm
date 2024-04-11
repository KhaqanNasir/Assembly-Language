
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA     
MSG1 DB 'ENTER 1st NUMBER: $'
MSG2 DB ' ENTER 2nd NUMBER: $'
CHAR1 DB ?
CHAR2 DB ?  
MSG3 DB ' THE SUM OF $'
MSG4 DB ' AND $'
MSG5 DB ' IS $'
.CODE 
MAIN PROC  
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
   
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CHAR2,AL 
  
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H 
    
    MOV DL,BL
    MOV AH,2
    INT 21H
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H 
    
    MOV DL,CHAR2
    MOV AH,2
    INT 21H 
    
    LEA DX,MSG5
    MOV AH,9
    INT 21H 
    
    ADD BL,CHAR2
    
    MOV DL,BL
    MOV AH,2
    INT 21H
    
    MOV AH,4CH
    INT 21H
                
    
   
    MAIN ENDP
END MAIN

ret




