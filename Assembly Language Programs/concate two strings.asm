.model small
.stack 100h
.data
STR1_BUFFER   db  16, ?               
              db  16 dup (?)          
STR2_BUFFER   db  16, ?               
              db  16 dup (?)          
Str3          db  132 dup (?)         
MSG1          db  "Enter 1st String : $"
MSG2          DB  13,10,"Enter 2nd string : $"
NEWLINE       db  13, 10, 'Concatenated string : $'

.code 
main proc
    mov  ax, @data
    mov  ds, ax
   
    mov  ah, 09h
    lea  dx, MSG1
    int  21h
  
    mov  ah, 0Ah
    lea  dx, STR1_BUFFER
    int  21h
        
    mov  ah, 09h
    lea  dx, MSG2
    int  21h
    
    mov  ah, 0Ah
    lea  dx, STR2_BUFFER
    int  21h            
  
    mov  si, offset STR1_BUFFER + 2   
    mov  di, offset Str3

CopyString:
    mov  al, [si]
    mov  [di], al
    inc  si
    inc  di
    dec  byte ptr STR1_BUFFER + 1     
    jnz  CopyString  
    
    mov  si, offset STR2_BUFFER + 2   
                    
 CopyStringsec:   
     mov  al, [si]
    mov  [di], al
    inc  si
    inc  di
    dec  byte ptr STR2_BUFFER + 1      
    jnz  CopyStringsec  
    
    mov  byte ptr [di], '$'
  
    lea  dx, NEWLINE
    mov  ah, 09h
    int  21h
   
    lea  dx, Str3
    mov  ah, 09h
    int  21h
   
    mov  ah, 4Ch
    int  21h
    main endp
end main