.MODEL SMALL
.DATA
.STACK 100H
.CODE 
MAIN PROC  
    
    MOV AH, 2
    
   
    MOV DL,'T'
    INT 21H
    MOV DL,'A'
    INT 21H     
    MOV DL,'B'
    INT 21H
    MOV DL,'L'
    INT 21H     
    MOV DL,'E'
    INT 21H 
    MOV DL,' '
    INT 21H
    MOV DL,'O'
    INT 21H
    MOV DL,'F'
    INT 21H
    MOV DL,' '
    INT 21H
    MOV DL,'2'
    INT 21H
    
    MOV DL,10
    INT 21H
    MOV DL,10
    INT 21H     
    
         
     MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
       MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H    
    
   
    MOV DL, '2'
    INT 21H
    MOV DL, 'X'
    INT 21H
    MOV DL, '1'
    INT 21H
    MOV DL, '='
    INT 21H
    MOV DL, '2'
    INT 21H
    MOV DL, 10 
    INT 21H  
    
  
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
       MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H

    
    MOV DL, '2'
    INT 21H
    MOV DL, 'X'
    INT 21H
    MOV DL, '2'
    INT 21H
    MOV DL, '='
    INT 21H
    MOV DL, '4'
    INT 21H
    MOV DL, 10 
    INT 21H
     
     
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
       MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
    
    MOV DL, '2'
    INT 21H
    MOV DL, 'X'
    INT 21H
    MOV DL, '3'
    INT 21H
    MOV DL, '='
    INT 21H
    MOV DL, '6'
    INT 21H
    MOV DL, 10 
    INT 21H 
      
     
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
       MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
     
     
    MOV DL, '2'
    INT 21H
    MOV DL, 'X'
    INT 21H
    MOV DL, '4'
    INT 21H
    MOV DL, '='
    INT 21H
    MOV DL, '8'
    INT 21H
    MOV DL, 10 
    INT 21H 
      
      
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
       MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
     
     
    MOV DL, '2'
    INT 21H
    MOV DL, 'X'
    INT 21H
    MOV DL, '5'
    INT 21H
    MOV DL, '='
    INT 21H 
    MOV DL,'1'
    INT 21H
    MOV DL,'0'
    INT 21H
    MOV DL, 10 
    INT 21H 
     
    
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
       MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H 
     MOV DL,8
     INT 21H
    
    
    MOV DL, '2'
    INT 21H
    MOV DL, 'X'
    INT 21H
    MOV DL, '6'
    INT 21H
    MOV DL, '='
    INT 21H 
    MOV DL,'1'
    INT 21H
    MOV DL,'2'
    INT 21H
    MOV DL, 10 
    INT 21H 
     
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
       MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
  
  
    MOV DL, '2'
    INT 21H
    MOV DL, 'X'
    INT 21H
    MOV DL, '7'
    INT 21H
    MOV DL, '='
    INT 21H 
    MOV DL,'1'
    INT 21H
    MOV DL,'4'
    INT 21H
    MOV DL, 10 
    INT 21H
      
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
       MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
    
    
    MOV DL, '2'
    INT 21H
    MOV DL, 'X'
    INT 21H
    MOV DL, '8'
    INT 21H
    MOV DL, '='
    INT 21H 
    MOV DL,'1'
    INT 21H
    MOV DL,'6'
    INT 21H
    MOV DL, 10 
    INT 21H  
     
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
       MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
    
    
    MOV DL, '2'
    INT 21H
    MOV DL, 'X'
    INT 21H
    MOV DL, '9'
    INT 21H
    MOV DL, '='
    INT 21H 
    MOV DL,'1'
    INT 21H
    MOV DL,'8'
    INT 21H
    MOV DL, 10 
    INT 21H  
      
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H
       MOV DL,8
     INT 21H
      MOV DL,8
     INT 21H 
    
    
    MOV DL, '2'
    INT 21H
    MOV DL, 'X'
    INT 21H
    MOV DL, '1'
    INT 21H 
    MOV DL,'0'
    INT 21H
    MOV DL, '='
    INT 21H 
    MOV DL,'2'
    INT 21H
    MOV DL,'0'
    INT 21H
    MOV DL, 10 
    INT 21H 
    
   

    MOV AH, 2CH 
    INT 21H

MAIN ENDP
END MAIN
