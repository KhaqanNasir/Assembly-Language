.MODEL SMALL
.STACK 100H
.DATA  

    ARRAY DB 1, 2, 3, 4, 0, 4, 2, 8, 1, 5, 0FFH ; Input array terminated by 0FFH 
    
    EVEN_COUNT DB 0
    
    ODD_COUNT DB 0
    
    EVEN_MSG DB 'Even numbers: $'
    
    ODD_MSG DB 0DH,0AH,'Odd numbers: $'
    
    MSG1 DB 0DH,0AH,'Number of even numbers: $'
    
    MSG2 DB 0DH,0AH,'Number of odd numbers: $'
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, EVEN_MSG
    MOV AH, 09H
    INT 21H

    MOV SI, OFFSET ARRAY   ; Point SI to start of array
    
DISPLAY_EVEN:
    MOV AL, [SI]           ; Load number from array
    CMP AL, 0FFH           ; Check if end of array
    JE DISPLAY_ODD         ; If end of array, jump to displaying odd numbers

    TEST AL, 1             ; Test if the number is odd or even
    JNZ NEXT_EVEN          ; Jump if odd

    MOV DL, AL
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
    
    MOV AH, 02H
    MOV DL, ' '
    INT 21H
    
    add even_count,1 ; Increment even count
    
NEXT_EVEN:
    INC SI                 ; Move to next number in array
    JMP DISPLAY_EVEN       ; Repeat the check for the next number

DISPLAY_ODD:
    LEA DX, ODD_MSG
    MOV AH, 09H
    INT 21H

    MOV SI, OFFSET ARRAY   ; Reset SI to start of array

DISPLAY_ODD_NUM:
    MOV AL, [SI]           ; Load number from array
    CMP AL, 0FFH           ; Check if end of array
    JE DISPLAY_RESULTS     ; If end of array, jump to display results

    TEST AL, 1             ; Test if the number is odd or even
    JZ NEXT_ODD            ; Jump if even

    ; Display odd number
    MOV DL, AL
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
    
    MOV AH, 02H
    MOV DL, ' '
    INT 21H 
   
    add odd_count,1 ; Increment odd count
    
NEXT_ODD:
    INC SI                 ; Move to next number in array
    JMP DISPLAY_ODD_NUM    ; Repeat the check for the next number

DISPLAY_RESULTS:
   
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    
    MOV AL, EVEN_COUNT
    add al,'0'
    mov dl, al
    MOV AH, 02H
    INT 21H
  

    
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H
    
    MOV AL, odd_COUNT
    add al,'0'
    mov dl, al
    MOV AH, 02H
    INT 21H 
    
 
    MOV AX, 4CH  
    INT 21H

MAIN ENDP
END MAIN
