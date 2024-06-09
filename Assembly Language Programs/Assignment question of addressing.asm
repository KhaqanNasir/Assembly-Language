.MODEL SMALL
.STACK 100H
.DATA 
.CODE
MAIN PROC
    MOV AX,4400H
    MOV DS,AX
    MOV SI,0100H
    MOV CX,10
    KHAQAN:
      ADD AL,[SI]
      INC SI
      LOOP KHAQAN
      MOV [0200H],AL 
     
      MOV AH,4CH
      INT 21H
      MAIN ENDP
END MAIN