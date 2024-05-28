.MODEL SMALL
.STACK 100H
.DATA
  VALUES DW 450, 0, 487, 101, 500, 0, 359, 0, 458 
  VALUES_WITHOUT_ZEROS DW 9 DUP(0)    ; Array to store non-zero values
  MSG DB 'Array Values without Zeros: $'  ; Message to display before printing array
  NEWLINE DB 0DH,0AH,'$'     ; Newline character
  BUFFER DB 9 DUP(?)         ; Buffer to store ASCII representation of each number

.CODE
MAIN PROC
  MOV AX, @DATA
  MOV DS, AX

  ; Push array onto the stack
  MOV SI, OFFSET VALUES   ; Point SI to the beginning of VALUES array
  MOV CX, 9               ; Number of elements in the array

PUSH_LOOP:
  MOV AX, [SI]            ; Load the current value into AX
  PUSH AX                 ; Push the value onto the stack
  ADD SI, 2               ; Move to the next element
  LOOP PUSH_LOOP          ; Repeat until all elements are pushed onto the stack

  ; Pop one by one, skip zeros, and store non-zero values in another array
  MOV SI, OFFSET VALUES_WITHOUT_ZEROS  ; Point SI to the beginning of VALUES_WITHOUT_ZEROS array
  MOV CX, 9               ; Number of elements in the array

POP_LOOP:
  POP AX                  ; Pop a value from the stack
  CMP AX, 0               ; Compare the popped value with zero
  JE SKIP_ZERO            ; If it's zero, skip storing it in VALUES_WITHOUT_ZEROS array
  MOV [SI], AX            ; Store the non-zero value in VALUES_WITHOUT_ZEROS array
  ADD SI, 2               ; Move to the next element in VALUES_WITHOUT_ZEROS array
SKIP_ZERO:
  LOOP POP_LOOP           ; Repeat until all values are popped from the stack

  ; Display message
  LEA DX, MSG
  MOV AH, 09H
  INT 21H

  ; Print array values without zeros
  MOV SI, OFFSET VALUES_WITHOUT_ZEROS   ; Point SI to the beginning of VALUES_WITHOUT_ZEROS array
  MOV CX, 6              ; Number of elements in the array

PRINT_LOOP:
  MOV AX, [SI]            ; Load the current value into AX
  CALL PrintNumber        ; Call subroutine to convert and print the number
  ADD SI, 2               ; Move to the next element   
  MOV DL,' '
  MOV AH,02H
  INT 21H
  LOOP PRINT_LOOP         ; Repeat until all elements are printed

  ; Display newline
  LEA DX, NEWLINE
  MOV AH, 09H
  INT 21H

  ; Terminate program
  MOV AH, 4CH     ; Terminate program
  INT 21H

MAIN ENDP

PrintNumber PROC
  ; Convert AX to ASCII and store in BUFFER
  MOV BX, 10       ; Divisor for converting to ASCII
  MOV DI, OFFSET BUFFER + 5  ; Start storing ASCII digits from the end of BUFFER
  MOV BYTE PTR [DI], '$'  ; Null-terminate the string

digit_loop:
  XOR DX, DX       ; Clear DX for division
  DIV BX           ; Divide AX by BX, quotient in AX, remainder in DX
  ADD DL, '0'      ; Convert remainder to ASCII
  DEC DI           ; Move to the next position in BUFFER
  MOV [DI], DL     ; Store ASCII digit
  TEST AX, AX      ; Check if quotient is zero
  JNZ digit_loop   ; Repeat the process for the next digit

  ; Print the number stored in BUFFER
  LEA DX, [DI]     ; Load address of ASCII digits in BUFFER
  MOV AH, 09H      ; DOS function for printing string
  INT 21H          ; Invoke DOS interrupt
  RET
PrintNumber ENDP

END MAIN
