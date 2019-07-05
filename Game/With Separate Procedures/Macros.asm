DRAW_ROW  MACRO     X           ; x is an argumnet
    LOCAL L1                                    ;local variable 
    MOV AH,0CH
    MOV AL,5
    MOV CX,10
    MOV DX,X
    L1:
        INT 10H
        INC CX
        CMP CX,301
        JL L1
    
ENDM   



DRAW_COLUMN MACRO   Y
    LOCAL L2
    MOV AH,0CH
    MOV AL,5
    MOV CX,Y
    MOV DX,10
    L2:
        INT 10H
        INC DX
        CMP DX,190
        JL L2
ENDM




