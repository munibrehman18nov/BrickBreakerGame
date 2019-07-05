;------------------------------------
;------block hit check ball2---------
;------------------------------------

CHECKHITBLOCK2 PROC

    PUSH BP
    MOV BP,SP
    PUSH BX
    PUSH DX
    PUSH CX
    PUSH AX

MAINIF:CMP BALL2_RSTR,11
       Ja ENDHIT2CHECK__1
       jmp ENDHIT2CHECK 
ENDHIT2CHECK__1:
    
    MOV CX,LASTBLOCKCX1
    MOV AX,LASTBLOCKCX1
    MOV DX,LASTBLOCKDX1
    ADD AX,44
IF2BLOCK1:
    CMP BALL2_RSTR,DX
    JBE IF2BLOCK12
    JMP ENDIF2BLOCK1
    
    IF2BLOCK12: CMP  BALL2_CSTR,AX
           JA ENDIF2BLOCK1
            

           NEG VEL_X2
           ADD VEL_Y2 ,2
          
          
         SUB DX,13
         ADD SCORE,10    
        MOV BLOCKCX,CX
        MOV BLOCKDX,DX
        MOV COLORBLOCK,0
                CALL BLOCK

        SUB LASTBLOCKDX1,10

        
           JMP ENDHIT2CHECK                   
          
         ENDIF2BLOCK12:

ENDIF2BLOCK1:

    MOV CX,LASTBLOCKCX2
    MOV AX,LASTBLOCKCX2
    MOV DX,LASTBLOCKDX2
    ADD AX,44
    
IF2BLOCK2:
    CMP BALL2_RSTR,DX
    JBE IF2BLOCK22
    JMP ENDIF2BLOCK2
    
    IF2BLOCK22: CMP  BALL2_CSTR,AX
           JA ENDIF2BLOCK2
           CMP BALL2_CSTR,CX
           JB ENDIF2BLOCK2

           NEG VEL_X2
           ADD VEL_Y2 ,2

        SUB DX,13
        ADD SCORE,10    
        MOV BLOCKCX,CX
        MOV BLOCKDX,DX
        MOV COLORBLOCK,0
                CALL BLOCK

        SUB LASTBLOCKDX2,10
        
         JMP ENDHIT2CHECK
          
        
                            
          
         ENDIF2BLOCK22:

ENDIF2BLOCK2:

    MOV CX,LASTBLOCKCX3
    MOV AX,LASTBLOCKCX3
    MOV DX,LASTBLOCKDX3
    ADD AX,44


IF2BLOCK3:
    CMP BALL2_RSTR,DX
    JBE IF2BLOCK33
    JMP ENDIF2BLOCK3
    
    IF2BLOCK33: CMP  BALL2_CSTR,AX
           JA ENDIF2BLOCK3
           CMP BALL2_CSTR,CX
           JB ENDIF2BLOCK3

           NEG VEL_X2
           ADD VEL_Y2 ,2

        SUB DX,13
        ADD SCORE,10    
        MOV BLOCKCX,CX
        MOV BLOCKDX,DX
        MOV COLORBLOCK,0
                CALL BLOCK

        SUB LASTBLOCKDX3,10
          
           JMP ENDHIT2CHECK
        
                            
          
         ENDIF2BLOCK33:

ENDIF2BLOCK3:
    MOV CX,LASTBLOCKCX4
    MOV AX,LASTBLOCKCX4
    MOV DX,LASTBLOCKDX4
    ADD AX,44


IF2BLOCK4:
    CMP BALL2_RSTR,DX
    JBE IF2BLOCK44
    JMP ENDIF2BLOCK4
    
    IF2BLOCK44: CMP  BALL2_CSTR,AX
           JA ENDIF2BLOCK4
           CMP BALL2_CSTR,CX
           JB ENDIF2BLOCK4

           NEG VEL_X2
           ADD VEL_Y2 ,2

        SUB DX,13
        ADD SCORE,10    
        MOV BLOCKCX,CX
        MOV BLOCKDX,DX
        MOV COLORBLOCK,0
                CALL BLOCK

        SUB LASTBLOCKDX4,10
          
          
         JMP ENDHIT2CHECK
                            
          
         ENDIF2BLOCK44:

ENDIF2BLOCK4:

    MOV CX,LASTBLOCKCX5
    MOV AX,LASTBLOCKCX5
    MOV DX,LASTBLOCKDX5
    ADD AX,44


IF2BLOCK5:
    CMP BALL2_RSTR,DX
    JBE IF2BLOCK55
    JMP ENDIF2BLOCK5
    
    IF2BLOCK55: CMP  BALL2_CSTR,AX
           JA ENDIF2BLOCK5
           CMP BALL2_CSTR,CX
           JB ENDIF2BLOCK5

           NEG VEL_X2
           ADD VEL_Y2 ,2

        SUB DX,13
        ADD SCORE,10    
        MOV BLOCKCX,CX
        MOV BLOCKDX,DX
        MOV COLORBLOCK,0
                CALL BLOCK

        SUB LASTBLOCKDX5,10
          
           JMP ENDHIT2CHECK
        
                            
          
         ENDIF2BLOCK55:

ENDIF2BLOCK5:

    MOV CX,LASTBLOCKCX6
    MOV AX,LASTBLOCKCX6
    MOV DX,LASTBLOCKDX6
    ADD AX,44


IF2BLOCK6:
    CMP BALL2_RSTR,DX
    JBE IF2BLOCK66
    JMP ENDIF2BLOCK6
    
    IF2BLOCK66: CMP  BALL2_CSTR,AX
           JA ENDIF2BLOCK6
           CMP BALL2_CSTR,CX
           JB ENDIF2BLOCK6

           NEG VEL_X2
           ADD VEL_Y2 ,2

        SUB DX,13
        ADD SCORE,10    
        MOV BLOCKCX,CX
        MOV BLOCKDX,DX
        MOV COLORBLOCK,0
                CALL BLOCK

        SUB LASTBLOCKDX6,10
          
           JMP ENDHIT2CHECK
        
                            
          
         ENDIF2BLOCK66:

ENDIF2BLOCK6:

ENDHIT2CHECK:

    POP AX
    POP CX
    POP DX
    POP BX
    POP BP    
    RET 


CHECKHITBLOCK2 ENDP
