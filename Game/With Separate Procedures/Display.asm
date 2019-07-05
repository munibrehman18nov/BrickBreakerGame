
DELAYER PROC
    PUSH BX
    
        MOV BX,0fbbdH
        DELAYER_LOOP:
                    DEC BX
                    JNZ DELAYER_LOOP
    POP BX
    RET
    DELAYER ENDP


SET_DISPLAY_MODE    PROC
    MOV AH,0
    MOV AL,13H
    INT 10H
     
                    
    MOV AH,0CH
    INT 10H
    
    DRAW_ROW    10
    DRAW_COLUMN 20
    DRAW_COLUMN 300     
    
    RET
SET_DISPLAY_MODE ENDP


  
