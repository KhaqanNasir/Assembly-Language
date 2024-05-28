.model small
.stack 100h
.data
STR1  db  16 dup ('$')          
STR2   db  16 dup ('$')          
Str3          db  32 dup (?)         
MSG1          db  "Enter 1st String : $"
MSG2          DB  13,10,"Enter 2nd string : $"
MSG3       db  13, 10, 'Concatenated string : $'

.code 
main proc
    mov  ax, @data
    mov  ds, ax
   
    mov  ah, 09h
    lea  dx, MSG1
    int  21h
  
 
    lea  dx, STR1        ; INPUT 1ST STRING
     mov  ah, 0Ah
    int  21h
        
   
    lea  dx, MSG2 
     mov  ah, 09h
    int  21h
    
    
    lea  dx, STR2      ; INPUT SECOND STRING
    mov  ah, 0Ah
    int  21h            
  
    mov  si, offset STR1 + 2  
    mov  di, offset Str3

CopyString:
    mov  al, [si]
    mov  [di], al
    inc  si
    inc  di
    dec  byte ptr STR1 + 1     
    jnz  CopyString  
    
    mov  si, offset STR2 + 2   
                    
 CopyStringsec:   
     mov  al, [si]
    mov  [di], al
    inc  si
    inc  di
    dec  byte ptr STR2 + 1      
    jnz  CopyStringsec  
    
    mov  byte ptr [di], '$'
  
    lea  dx, MSG3
    mov  ah, 09h
    int  21h
   
    lea  dx, Str3
    mov  ah, 09h
    int  21h
   
    mov  ah, 4Ch
    int  21h
    main endp
end main