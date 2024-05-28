.MODEL SMALL

.STACK 100H

.DATA

  VALUES DW 450, 0, 487, 101, 500, 0, 359, 0, 458

  MSG1 DB 'VALUES AFTER REMOVING ZEROS: $'

  NEWLINE DB 0DH,0AH,'$'

.CODE

MAIN PROC    

  MOV AX, @DATA
  MOV DS, AX
    
  ; Initialize stack pointer
  MOV SP, 200H  ; Set SP to higher value to avoid conflict with the data segment
    
  ; Push values onto the stack
  LEA SI, VALUES
  MOV CX, 9      ; Number of values

PUSH_VALUES:
  MOV AX, [SI]
  PUSH AX
  ADD SI, 2
  LOOP PUSH_VALUES

  ; Initialize temporary stack pointer
  MOV DI, SP  ; DI will be used to point to the new stack top
    
  ; Update the stack by removing zeros
  MOV CX, 9      ; Number of values to process

REMOVE_ZEROS:
  POP AX
  CMP AX, 0
  JE SKIP_ZERO
  PUSH AX
SKIP_ZERO:
  LOOP REMOVE_ZEROS

  ; Set SP to the new top of the stack
  MOV SP, DI
    
  ; Display message
  LEA DX, MSG1
  MOV AH, 09H
  INT 21H

  ; Display newline
  LEA DX, NEWLINE
  MOV AH, 09H
  INT 21H

  ; Display remaining values from the stack
DISPLAY_VALUES:
  CMP SP, 200H  ; Check if SP has reached the initial value
  JGE END_DISPLAY
  POP AX
  MOV DX, AX
  CALL DISPLAY_NUMBER
  JMP DISPLAY_VALUES

END_DISPLAY:
  MOV AH, 4CH
  INT 21H

DISPLAY_NUMBER PROC
  PUSH AX
  PUSH BX
  PUSH CX
  PUSH DX

  ; Convert AX to string
  XOR CX, CX
  MOV BX, 10

CONVERT_LOOP:
  XOR DX, DX
  DIV BX
  ADD DL, '0'
  PUSH DX
  INC CX
  CMP AX, 0
  JNE CONVERT_LOOP

  ; Print the number
PRINT_LOOP:
  POP DX
  MOV AH, 02H
  INT 21H
  LOOP PRINT_LOOP

  ; Print newline
  LEA DX, NEWLINE
  MOV AH, 09H
  INT 21H

  POP DX
  POP CX
  POP BX
  POP AX
  RET
DISPLAY_NUMBER ENDP

ENDP

END MAIN
