;--------------------------------------------
;-------------- BAR FUNCTIONS ---------------
;--------------------------------------------    
  
DISPLAY_BAR PROC
    MOV BP,SP
    PUSH CX
    PUSH DX
    PUSH AX
    
    
    MOV AH,0CH      ;pixel color change
    MOV AL,15            

    MOV CX,BAR_NEW_COLSTRT
    MOV DX,BAR_ROW1
    
    SHW_BR:
        INT 10H
        INC CX
        CMP CX,BAR_NEW_COLEND
        JNE SHW_BR    
            MOV CX,BAR_NEW_COLSTRT
            INC DX
            CMP DX,BAR_ROW3
            JNA SHW_BR



    POP AX
    POP DX
    POP CX
    MOV SP,BP
    
    RET
DISPLAY_BAR ENDP     

MOVE_BAR PROC       
    PUSH BP
    MOV  BP,SP
    PUSH BX
    PUSH CX
    PUSH DX   
    
    MOV AH,0CH     
    MOV AL,13h
    
    CMP FLAG_ML,1
    JNE CHK_MR
            
        MOV AL,0    
        MOV CX,BAR_NEW_COLEND
        MOV DX,BAR_ROW1
        
        BAR_L:           
        
            INT 10H
            INC CX
            CMP CX,BAR_OLD_COLEND
            JNAE BAR_L  

                MOV CX,BAR_NEW_COLEND
                INC DX
                CMP DX,BAR_ROW3
                JNA BAR_L  
                
        MOV BX,BAR_NEW_COLSTRT
        MOV BAR_OLD_COLSTRT,BX
        
        MOV BX,BAR_NEW_COLEND
        MOV BAR_OLD_COLEND,BX
            
        JMP  END_MOV_BAR                   

    CHK_MR:

        CMP FLAG_MR,1
        JNE END_MOV_BAR

            MOV AL,0    
            MOV CX,BAR_OLD_COLSTRT
            MOV DX,BAR_ROW1

            BAR_R:           
            
                INT 10H
                INC CX
                CMP CX,BAR_NEW_COLSTRT
                JNAE BAR_R  

                    MOV CX,BAR_OLD_COLSTRT
                    INC DX
                    CMP DX,BAR_ROW3
                    JNA BAR_R    
                    
                                  
            MOV BX,BAR_NEW_COLSTRT
            MOV BAR_OLD_COLSTRT,BX
            
            MOV BX,BAR_NEW_COLEND
            MOV BAR_OLD_COLEND,BX
                       
         
   END_MOV_BAR:      
   
    CALL DISPLAY_BAR 

    POP  DX
    POP  CX
    POP  BX
    POP  BP

    RET          

MOVE_BAR ENDP          