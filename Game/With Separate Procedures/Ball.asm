DISPLAY_BALL2 PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    MOV AH,0CH    
    MOV CX,BALL2_CSTR
    MOV DX,BALL2_RSTR
    MOV OLD_COL2STR,CX
    MOV OLD_ROW2STR,DX  
              
    ADD BALL2_CSTR,4
    ADD BALL2_RSTR,4
    
    MOV BALL2_REND,DX
    ADD BALL2_REND,4
    MOV BALL2_CEND,CX
    ADD BALL2_CEND,4              
    
    BALL2_OUTPUT:
           INT 10H
           INC CX
           CMP CX,BALL2_CSTR
           JNE BALL2_OUTPUT
               MOV CX,OLD_COL2STR
               INC DX
               CMP DX,BALL2_RSTR
               JNE BALL2_OUTPUT   

               MOV BX,OLD_ROW2STR
               MOV BALL2_RSTR,BX
               MOV BX,OLD_COL2STR
               MOV BALL2_CSTR,BX
   POP DX
   POP CX            
   POP BX
   POP AX
   RET
DISPLAY_BALL2 ENDP          

MOVE_BALL2 PROC       
    PUSH BX
    PUSH AX
         MOV AH,0CH
         MOV AL,0
         CALL DISPLAY_BALL2    
         CALL DELAYER      
         MOV AL,12
         MOV BX,VEL_X2
         ADD BALL2_RSTR,BX
         MOV BX,VEL_Y2
         ADD BALL2_CSTR,BX
         CALL DISPLAY_BALL2
         DEC BX  
    POP AX
    POP BX
    RET
MOVE_BALL2 ENDP

                      

CHECK_BALL2_BOUNDARY PROC   
                 
    PUSH BX  
    PUSH AX                
    PUSH CX
    PUSH DX
                              
    MOV BX,BAR_NEW_COLSTRT
    MOV AX,BAR_ROW1
    SUB AX,6
        CMP BALL2_RSTR,AX
        Jb TCH_NA2         
            MOV AX,BAR_NEW_COLEND
            MOV CX,BALL2_CSTR
            MOV DX,BALL2_CEND
            BAR_BALL2:
                
                CMP BX,AX
                JE  NXT_B2_COL
                INC BX
                CMP CX,BX 
                JE  CH_VAL_B2
                JMP BAR_BALL2
                NXT_B2_COL: 
                    
                    MOV BX,BAR_NEW_COLSTRT
                    INC CX
                    CMP CX,DX
                    JA  TCH_NA2
                        JMP BAR_BALL2
                    
       CH_VAL_B2:                
            NEG VEL_X2
     
            JMP b2_L1
     TCH_NA2:         
     cmp ball2_rstr,179
     jb  b2_l1
      ADD B_LOSS,1
      MOV NO_BALL2,1  
        MOV AH,0CH
        MOV AL,0
        CALL DISPLAY_BALL2

    b2_L1:
        
        CMP BALL2_CSTR,11
        JG b2_L2
        MOV BALL2_CSTR,11
        NEG VEL_Y2
        JMP b2_L3
    b2_L2:       
        CMP BALL2_CEND,298
        JL b2_L3
        MOV BALL2_CEND,298
        NEG VEL_Y2
        
    b2_L3: 
    
        CMP BALL2_RSTR,11
        JG b2_DONE
        MOV BALL2_RSTR,11
        NEG VEL_X2
               
    
    b2_DONE: 
        POP DX
        POP CX
        POP AX
        POP BX
        RET

CHECK_BALL2_BOUNDARY ENDP    

