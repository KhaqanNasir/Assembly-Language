.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER A UPPER CASE LETTER: $' 
MSG2 DB ' LOWER CASE IS: $' 

.CODE
MAIN PROC
            
            MOV AX,@DATA
            MOV DS,AX
            
            LEA DX,MSG1
            MOV AH,9
            INT 21H 
            
            MOV AH,1
            INT 21H 
            
            MOV DL,AL
            ADD DL,20H 
            MOV BL,DL   ;TEMP
            
            LEA DX,MSG2
            MOV AH,9
            INT 21H
                     
            MOV DL,BL
            MOV AH,2
            INT 21H
            
            
            MOV AH,4CH
            INT 21H
       
    
    
    
    MAIN ENDP
END MAIN