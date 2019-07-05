;-------------------------------------------------------;
;-------------------------------------------------------;
;-------------------------------------------------------; 
;-------------------------------------------------------;
;-------------------------------------------------------;
.MODEL SMALL
.STACK 100H
.DATA               
     BAR_OLD_COLSTRT   DW 50
     BAR_OLD_COLEND    DW 80
     MOV_TO            DW 0
     BAR_ROW1          DW 181
     BAR_ROW3          DW 184
     BAR_NEW_COLSTRT   DW 50
     BAR_NEW_COLEND    DW 80      
     FLAG_ML           DW 0
     FLAG_MR           DW 0    
;--------------------------------------------
;----------- VARIABLES FOR BALLS ------------
;--------------------------------------------

;--------------------------------------------
;------------------ BALL1 -------------------
;--------------------------------------------       
     BALL1_RSTR        DW 80         ;RSTR = ROW START
     BALL1_CSTR        DW 88         ;CSTR = COLUMN START
     BALL1_REND        DW 18
     BALL1_CEND        DW 18
     
     OLD_ROW1STR       DW 50
     OLD_COL1STR       DW 50
     
     VEL_X1            DW -4         ;FOR DIRECTION
     VEL_Y1            DW -2         ;FOR DIRECTION        
     
;--------------------------------------------
;------------------ BALL2 -------------------
;--------------------------------------------  
     
     BALL2_RSTR        DW 99        ;RSTR = ROW START
     BALL2_CSTR        DW 99         ;CSTR = COLUMN START
     BALL2_REND        DW 18
     BALL2_CEND        DW 18
     
     OLD_ROW2STR       DW 50
     OLD_COL2STR       DW 50
     
     VEL_X2            DW -2   
     VEL_Y2            DW 4                        
;--------------------------------------------
;------------ lose chk variables ------------
;--------------------------------------------  
     
     NO_BALL1          DW 0 
     NO_BALL2          DW 0  
        
     B_LOSS            DW 0          
;--------------------------------------------
;----------- Variables for bricks -----------
;--------------------------------------------  


    COUNTER2   DB 0
    COUNTER1   DB 0

    BLOCKCX    DW ?
    COLORBLOCK DB ?

    BLOCKDX    DW ? 
    

    LASTBLOCKCX1 DW ?
    LASTBLOCKDX1 DW ?
    
   LASTBLOCKCX2 DW ?
   LASTBLOCKDX2 DW ?


   LASTBLOCKCX3 DW ?
   LASTBLOCKDX3 DW ?  

   LASTBLOCKCX4 DW ?
   LASTBLOCKDX4 DW ?


   LASTBLOCKCX5 DW ?
   LASTBLOCKDX5 DW ?   

   LASTBLOCKCX6 DW ?
   LASTBLOCKDX6 DW ?   
    
    
;--------------------------------------------
;----------- Variable for scores ------------
;--------------------------------------------  
    score dw 0
    scor_msg db "Score : $" 
;------------------------------------------------------------------------------------------------------------
;=============================== Variables to be Printed  ===================================================
;------------------------------------------------------------------------------------------------------------
  

    WLCM      DB  0AH,0DH,"                  ================================"
              DB  0AH,0DH,"                  ================================"
              DB  0AH,0DH,"                  ========== WELCOME TO ==========" 
              DB  0AH,0DH,"                  ================================"
              DB  0AH,0DH,"                  ================================"
              DB  0AH,0DH,"                  ========= BRICK BREAKER ========" 
              DB  0AH,0DH,"                  ================================"
              DB  0AH,0DH,"                  ================================$"
         
    str2      DB  0AH,0DH,"=================================================================="
              DB  0AH,0DH,"=================================================================="
              DB  0AH,0DH,"======== PROGRAMMED BY: =========================================="
              DB  0AH,0DH,"=================================================================="
              DB  0AH,0DH,"=================================================================="
              DB  0AH,0DH,"======================== ZAIN AFTAB, zkingleo2009@gmail.com=================="   
              DB  0AH,0DH,"=================================================================="
              DB  0AH,0DH,"======================== MUHAMMAD BILAL JAVED,  biljvd@live.com========"
              DB  0AH,0DH,"=================================================================="
              DB  0AH,0DH,"==================================================================$"
        
         
    str3      DB  0AH,0DH,"==================================================================="
              DB  0AH,0DH,"==================================================================="
              DB  0AH,0DH,"== IT IS A SINGLE PLAYER GAME. YOU HAVE TWO BALLS WHICH MEAN YOU =="
              DB  0AH,0DH,"==================================================================="
              DB  0AH,0DH,"=== HAVE DOUBLE CHANCE OF WINNING BUT AT THE SAME TIME HAVE THE ==="
              DB  0AH,0DH,"===================================================================" 
              DB  0AH,0DH,"==== SAME CHANCE OF LOSING. IF YOU LOSE BOTH OF YOUR BALLS THEN ==="
              DB  0AH,0DH,"==================================================================="
              DB  0AH,0DH,"==================================================================="
              DB  0AH,0DH,"============================ GAME OVER ============================"
              DB  0AH,0DH,"==================================================================="
              DB  0AH,0DH,"===================================================================$"
        
    str5      DB  0AH,0DH,"==================================================================="
              DB  0AH,0DH,"=======================    CONTROLS   ============================="
              DB  0AH,0DH,"==================================================================="
              DB  0AH,0DH,0AH,0DH 
              DB  0AH,0DH,"==================================================================="
              DB  0AH,0DH,"== USE THE LEFT AND RIGHT ARROW KEYS TO MOVE THE BAR FROM IT'S  ==="
              DB  0AH,0DH,"==================================================================="
              DB  0AH,0DH,"======== CURRENT POSITION TO LEFT OR RIGHT RESPECTIVELY ==========="
              DB  0AH,0DH,"===================================================================$"    
        
                                                                       
    str6      DB 0AH,0DH,"                  =========================="
              DB 0AH,0DH,"                  =========================="
              DB 0AH,0DH,"                  ====    THANK YOU     ===="
              DB 0AH,0DH,"                  ====       FOR        ===="
              DB 0AH,0DH,"                  ==== PLAYING THE GAME ===="
              DB 0AH,0DH,"                  =========================="
              DB 0AH,0DH,"                  ==========================$"
                         
    LOSE_MSG  DB 0AH,0DH,"                  =========================="
              DB 0AH,0DH,"                  =========================="
              DB 0AH,0DH,"                  ====     YOU LOSE     ===="
              DB 0AH,0DH,"                  =========================="
              DB 0AH,0DH,"                  ==========================$"   
              
    ITEM0     DB 0AH,0DH,"                  ==========================="
              DB 0AH,0DH,"                  ===========================",0AH,0DH,'$'
    ITEM1     DB 'NEW GAME      ====',0AH,0DH,'$'
    ITEM2     DB 'PROGRAMMED BY ====',0AH,0DH,'$'
    ITEM3     DB 'ABOUT         ====',0AH,0DH,'$'
    ITEM4     DB 'HIGHSCORES    ====',0AH,0DH,'$'
    ITEM5     DB 'INSTRUCTIONS  ====',0AH,0DH,'$'
    ITEM6     DB 'QUIT GAME     ====',0AH,0DH,'$'         
    ITEM7     DB "                  ==========================="
              DB 0AH,0DH,"                  ===========================$"
    
    SELECTED DW 0     ; currenlty selected menu item.
    MENU_COUNT DW 6   ; number of items in menu.
    UP      EQU     48h
    DOWN    EQU     50h

    ; all menu items should be
    ; entered in this address array:
    ITEMS_ADR DW ITEM1, ITEM2,ITEM3, ITEM4,ITEM5, ITEM6,ITEM7
    
    SELECTOR        DB '                  ==== ->  $'
    EMPTY_SELECTOR  DB '                  ====     $'
    
    
    
    
    
.CODE                               



DRAW_ROW  MACRO     X  
    LOCAL L1
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





MAIN PROC

MOV AX,@DATA       
MOV DS,AX          
    CALL WELCOME_SCR
    CALL MAIN_MENU
    CALL SET_DISPLAY_MODE
    
    MOV AH,0CH
    
    CALL DISPLAY_BAR
    MOV AL,12
    CALL DISPLAY_BALL1
    CALL DISPLAY_BALL2 
    CALL FULLBLOCK
    
    SHOW:   
    
        CMP NO_BALL1,1
        JE  BALL2_SHOW
            CALL DELAYER 
            CALL MOVE_BALL1
        CALL CHECKHITBLOCK1
            CALL CHECK_BALL1_BOUNDARY
        BALL2_SHOW:
            CMP NO_BALL2,1
            JNE SHOW_BALL2 
                CMP  B_LOSS,2
                JNE  SHOW_BAR        
                    CALL YOU_LOSE 
                    jmp MENU_SHOW
                       
        SHOW_BALL2:
            CALL DELAYER
            CALL MOVE_BALL2
        CALL CHECKHITBLOCK2
            CALL CHECK_BALL2_BOUNDARY
       
       SHOW_BAR:
                
        CALL DELAYER
        MOV AH,0BH
        INT 21H
            CMP AL,0FFH
            JNE SHOW
                MOV AH,0
                MOV AL,0BH
                INT 16H

                CMP AH,4BH
                JNE CHK_RIGHT  
                    MOV AX,BAR_OLD_COLSTRT
                    MOV BAR_NEW_COLSTRT,AX
                    
                    MOV AX,BAR_OLD_COLEND
                    MOV BAR_NEW_COLEND,AX
                    
                    CMP BAR_NEW_COLSTRT,12
                    JBE  SHOW
                        MOV FLAG_ML,1
                        MOV FLAG_MR,0
                        SUB BAR_NEW_COLSTRT,9
                        SUB BAR_NEW_COLEND,9
                        CALL MOVE_BAR
                        JMP SHOW
                
                
                 CHK_RIGHT:    
                 
                    CMP AH,4DH
                    JNE CHK_MENU  
    
                    MOV AX,BAR_OLD_COLSTRT
                    MOV BAR_NEW_COLSTRT,AX
                    
                    CMP BAR_NEW_COLSTRT,288   
                    Jb  SHOW__1
                    jmp SHOW   
show__1:         
                        MOV FLAG_ML,0
                        MOV FLAG_MR,1
                        ADD BAR_NEW_COLSTRT,9
                        ADD BAR_NEW_COLEND,9
                        CALL MOVE_BAR
                        JMP SHOW
                          
                 CHK_MENU:
                    CMP AH,01
                    Je SHOW__2
                    jmp show
show__2:
                        CALL SCORE  
                        MENU_SHOW:
                            CALL MAIN_MENU
                            JMP SHOW
    END_GAME:
        MOV AH,4CH
        INT 21H
MAIN ENDP        


;DELAYER PROC
;   PUSH BX
;    
;       MOV BX,199H
;        DELAYER_LOOP:
;                   DEC BX
;                    JNZ DELAYER_LOOP
;    POP BX
;    RET
;   DELAYER ENDP
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
    DRAW_COLUMN 10
    DRAW_COLUMN 300     
    
    RET
SET_DISPLAY_MODE ENDP


  

;--------------------------------------------
;-------------- BAR FUNCTIONS ---------------
;--------------------------------------------    
  
DISPLAY_BAR PROC
    MOV BP,SP
    PUSH CX
    PUSH DX
    PUSH AX
    
    
    MOV AH,0CH
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
    MOV AL,13
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
                                                     
                                                        
;--------------------------------------------
;-------------- BALL FUNCTIONS --------------
;--------------------------------------------    
DISPLAY_BALL1 PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
   
    MOV AH,0CH
          
    MOV CX,BALL1_CSTR
    MOV DX,BALL1_RSTR
   
    MOV OLD_COL1STR,CX
    MOV OLD_ROW1STR,DX  
              
    ADD BALL1_CSTR,4
    ADD BALL1_RSTR,4
    
    MOV BALL1_REND,DX
    ADD BALL1_REND,4
    
    MOV BALL1_CEND,CX
    ADD BALL1_CEND,4              
    
    BALL1_OUTPUT:
     
           INT 10H
           INC CX
           CMP CX,BALL1_CSTR
           JNE BALL1_OUTPUT
     
               MOV CX,OLD_COL1STR
               INC DX
               CMP DX,BALL1_RSTR
               JNE BALL1_OUTPUT   

               MOV BX,OLD_ROW1STR
               MOV BALL1_RSTR,BX
               MOV BX,OLD_COL1STR
               MOV BALL1_CSTR,BX
   POP DX
   POP CX            
   POP BX
   POP AX
   RET
DISPLAY_BALL1 ENDP          

MOVE_BALL1 PROC       
    PUSH BX
    PUSH AX
     
     
     
     MOV AH,0CH
     MOV AL,0
     
     CALL DISPLAY_BALL1          
     CALL DELAYER
     
     MOV AL,12
     
     MOV BX,VEL_X1
     
     ADD BALL1_RSTR,BX
     
     MOV BX,VEL_Y1
     
     ADD BALL1_CSTR,BX
     
     CALL DISPLAY_BALL1
     
     DEC BX               
     
     
     
     
     
     POP AX
     POP BX
     RET
MOVE_BALL1 ENDP

                      
                      
CHECK_BALL1_BOUNDARY PROC
    PUSH BX  
    PUSH AX                
    PUSH CX
    PUSH DX
                              
    MOV BX,BAR_NEW_COLSTRT
    MOV AX,BAR_ROW1
    SUB AX,6
        CMP BALL1_RSTR,AX
        Jb TCH_NA
            MOV AX,BAR_NEW_COLEND
            MOV CX,BALL1_CSTR
            MOV DX,BALL1_CEND
            BAR_BALL1:
                
                CMP BX,AX
                JE  NXT_B1_COL
                INC BX
                CMP CX,BX 
                JE  CH_VAL_B1
                JMP BAR_BALL1
                NXT_B1_COL: 
                    
                    MOV BX,BAR_NEW_COLSTRT
                    INC CX
                    CMP CX,DX
                    JA  TCH_NA
                        JMP BAR_BALL1
                    
       CH_VAL_B1:                
            NEG VEL_X1
         ;   NEG VEL_Y2
    ;add  vel_x2,2
            JMP L1
     TCH_NA:         
     cmp ball1_rstr,179
     jb  l1
      ADD B_LOSS,1
      MOV NO_BALL1,1  
        MOV AH,0CH
        MOV AL,0
        CALL DISPLAY_BALL1

    L1:
        
        CMP BALL1_CSTR,13
        JG L2
        MOV BALL1_CSTR,11
        NEG VEL_Y1
    add vel_y1,1
        JMP L3
    L2:       
        CMP BALL1_CEND,297
        JL L3
        MOV BALL1_CEND,297
        NEG VEL_Y1
            add vel_y1,2
    L3: 
    
        CMP BALL1_RSTR,13
        JG DONE
        MOV BALL1_RSTR,11
        NEG VEL_X1
        JMP DONE
               
    
    DONE: 
        POP DX
        POP CX
        POP AX
        POP BX
        RET

CHECK_BALL1_BOUNDARY ENDP    
                            


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


                              
                              
                              
                              
;------------------------------------------------------------------
;============================= Blocks =============================
;------------------------------------------------------------------

FULLBLOCK PROC
    PUSH BP
    MOV BP,SP
    PUSH BX
    PUSH DX
    PUSH CX
    PUSH AX
    MOV COLORBLOCK,1
    MOV BLOCKCX,11
    MOV BLOCKDX,12
    CALL BLOCK

    MOV COLORBLOCK,2
    MOV BLOCKCX,59
    MOV BLOCKDX,12
    CALL BLOCK

    MOV COLORBLOCK,4
    ADD BLOCKCX,48
    MOV BLOCKDX,12
    CALL BLOCK

    MOV COLORBLOCK,1
    ADD BLOCKCX,48
    MOV BLOCKDX,12
    CALL BLOCK

    MOV COLORBLOCK,2
    ADD BLOCKCX,48
    MOV BLOCKDX,12
    CALL BLOCK

    MOV COLORBLOCK,4
    ADD BLOCKCX,48
    MOV BLOCKDX,12
    CALL BLOCK

    ;MOV COLORBLOCK,1
    ;ADD BLOCKCX,48
    ;MOV BLOCKDX,12
    ;CALL BLOCK

    ;MOV COLORBLOCK,2
    ;ADD BLOCKCX,3
    ;MOV BLOCKDX,12
    ;CALL HALFBLOCK
;END OF FIRST ROW

    MOV COLORBLOCK,4
    MOV BLOCKCX,11
    ADD BLOCKDX,10
    CALL block


    MOV COLORBLOCK,1
    ADD BLOCKCX,48
    MOV BLOCKDX,22
    CALL BLOCK    
    
    MOV COLORBLOCK,2
    ADD BLOCKCX,48
    MOV BLOCKDX,22
    CALL BLOCK    
    
    MOV COLORBLOCK,4
    ADD BLOCKCX,48
    MOV BLOCKDX,22
    CALL BLOCK    
    
    MOV COLORBLOCK,1
    ADD BLOCKCX,48
    MOV BLOCKDX,22
    CALL BLOCK    

    MOV COLORBLOCK,2
    ADD BLOCKCX,48
    MOV BLOCKDX,22
    CALL BLOCK    

;    MOV COLORBLOCK,4
;    ADD BLOCKCX,44
;    MOV BLOCKDX,22
;    CALL BLOCK    
;
    ;MOV COLORBLOCK,1
    ;ADD BLOCKCX,44
    ;MOV BLOCKDX,22
    ;CALL BLOCK

;END OF SECOND ROW

    MOV COLORBLOCK,2
    MOV BLOCKCX,11
    ADD BLOCKDX,10
    CALL BLOCK

    MOV COLORBLOCK,4
    ADD BLOCKCX,48
    MOV BLOCKDX,32
    CALL BLOCK    


    MOV COLORBLOCK,1
    ADD BLOCKCX,48
    MOV BLOCKDX,32
    CALL BLOCK

    MOV COLORBLOCK,2
    ADD BLOCKCX,48
    MOV BLOCKDX,32
    CALL BLOCK

    MOV COLORBLOCK,4
    ADD BLOCKCX,48
    MOV BLOCKDX,32
    CALL BLOCK

    MOV COLORBLOCK,1
    ADD BLOCKCX,48
    MOV BLOCKDX,32
    CALL BLOCK

;    MOV COLORBLOCK,2
;    ADD BLOCKCX,44
;    MOV BLOCKDX,32
;    CALL BLOCK
    
    ;MOV COLORBLOCK,4
    ;ADD BLOCKCX,44
    ;MOV BLOCKDX,32
    ;CALL HALFBLOCK
;END OF THIRD ROW

    MOV COLORBLOCK,1
    MOV BLOCKCX,11
    ADD BLOCKDX,10
    CALL BLOCK
    MOV LASTBLOCKCX1,11
    MOV LASTBLOCKDX1,42
    ADD LASTBLOCKDX1,13 
    
    MOV COLORBLOCK,2
    ADD BLOCKCX,48
    MOV BLOCKDX,42
    CALL BLOCK

    MOV LASTBLOCKCX2,59
    MOV LASTBLOCKDX2,42
    ADD LASTBLOCKDX2,13
    
    
    MOV COLORBLOCK,4
    ADD BLOCKCX,48
    MOV BLOCKDX,42
    CALL BLOCK

    MOV LASTBLOCKCX3,107
    MOV LASTBLOCKDX3,42
    ADD LASTBLOCKDX3,13    
    
    MOV COLORBLOCK,1
    ADD BLOCKCX,48
    MOV BLOCKDX,42
    CALL BLOCK

    MOV LASTBLOCKCX4,155
    MOV LASTBLOCKDX4,42
    ADD LASTBLOCKDX4,13    
    
    MOV COLORBLOCK,2
    ADD BLOCKCX,48
    MOV BLOCKDX,42
    CALL BLOCK

    MOV LASTBLOCKCX5,203
    MOV LASTBLOCKDX5,42
    ADD LASTBLOCKDX5,13    

    MOV COLORBLOCK,4
    ADD BLOCKCX,48
    MOV BLOCKDX,42
    CALL BLOCK

    MOV LASTBLOCKCX6,251
    MOV LASTBLOCKDX6,42
    ADD LASTBLOCKDX6,13    

    ;MOV COLORBLOCK,1
    ;ADD BLOCKCX,48
    ;MOV BLOCKDX,42
    ;CALL BLOCK    

    ;MOV COLORBLOCK,2
    ;ADD BLOCKCX,38
    ;MOV BLOCKDX,42
    ;CALL BLOCK
    POP AX
    POP CX
    POP DX
    POP BX
    POP BP    
    RET 

FULLBLOCK ENDP

BLOCK PROC

    PUSH BP
    MOV BP,SP
    PUSH BX
    PUSH DX
    PUSH CX
    PUSH AX
    MOV AH,0CH
    MOV AL,COLORBLOCK

    MOV CX,BLOCKCX
    MOV DX,BLOCKDX
    MOV BH,0
    

    WHILE212:
        CMP COUNTER1,43
        JA ENDWHILE212
        INT 10H
        INC COUNTER1
        INC CX
        JMP WHILE212

    ENDWHILE212:

    MOV COUNTER1,0
    MOV CX,BLOCKCX
    INC DX    

    WHILE213:
        CMP COUNTER1,43
        JA ENDWHILE213
        INT 10H
        INC COUNTER1
        INC CX
        JMP WHILE213

    ENDWHILE213:

    MOV COUNTER1,0
    MOV CX,BLOCKCX
    INC DX    

    WHILE214:
        CMP COUNTER1,43
        JA ENDWHILE214
        INT 10H
        INC COUNTER1
        INC CX
        JMP WHILE214

    ENDWHILE214:

    MOV COUNTER1,0
    MOV CX,BLOCKCX
    INC DX    

    WHILE215:
        CMP COUNTER1,43
        JA ENDWHILE215
        INT 10H
        INC COUNTER1
        INC CX
        JMP WHILE215

    ENDWHILE215:

    MOV COUNTER1,0
    MOV CX,BLOCKCX
    INC DX    

    WHILE216:
        CMP COUNTER1,43
        JA ENDWHILE216
        INT 10H
        INC COUNTER1
        INC CX
        JMP WHILE216

    ENDWHILE216:            

    MOV COUNTER1,0
    MOV CX,BLOCKCX
    INC DX    

    WHILE217:
        CMP COUNTER1,43
        JA ENDWHILE217
        INT 10H
        INC COUNTER1
        INC CX
        JMP WHILE217

    ENDWHILE217:


    MOV COUNTER1,0
    MOV CX,BLOCKCX
    INC DX    

    WHILE218:
        CMP COUNTER1,43
        JA ENDWHILE218
        INT 10H
        INC COUNTER1
        INC CX
        JMP WHILE218

    ENDWHILE218:

    MOV COUNTER1,0
    MOV CX,BLOCKCX
    INC DX    

    WHILE219:
        CMP COUNTER1,43
        JA ENDWHILE219
        INT 10H
        INC COUNTER1
        INC CX
        JMP WHILE219

    ENDWHILE219:

    MOV COUNTER1,0
    MOV CX,BLOCKCX
    INC DX    

    WHILE220:
        CMP COUNTER1,43
        JA ENDWHILE220
        INT 10H
        INC COUNTER1
        INC CX
        JMP WHILE220

    ENDWHILE220:    
    POP AX
    POP CX
    POP DX
    POP BX
    POP BP    
    RET 
BLOCK ENDP

;-----------------------
;-----block hit check proc------
;------------------------------------


CHECKHITBLOCK1 PROC

    PUSH BP
    MOV BP,SP
    PUSH BX
    PUSH DX
    PUSH CX
    PUSH AX

;MAINIF:CMP BALL1_RSTR,11
;       JBE ENDHITCHECK
        
    
    MOV CX,LASTBLOCKCX1
    MOV AX,LASTBLOCKCX1
    MOV DX,LASTBLOCKDX1
    ADD AX,44
IFBLOCK1:
    CMP BALL1_RSTR,DX
    JBE IFBLOCK12
    JMP ENDIFBLOCK1
    
    IFBLOCK12: CMP  BALL1_CSTR,AX
           JA ENDIFBLOCK1
            

           NEG VEL_X1
           ADD VEL_Y1 ,2
          
          
         SUB DX,13
            
        MOV BLOCKCX,CX
        MOV BLOCKDX,DX
        MOV COLORBLOCK,0
                CALL BLOCK
        ADD SCORE,10
        SUB LASTBLOCKDX1,10
        JMP ENDHITCHECK
        
                             
          
         ENDIFBLOCK12:

ENDIFBLOCK1:

    MOV CX,LASTBLOCKCX2
    MOV AX,LASTBLOCKCX2
    MOV DX,LASTBLOCKDX2
    ADD AX,44
    
IFBLOCK2:
    CMP BALL1_RSTR,DX
    JBE IFBLOCK22
    JMP ENDIFBLOCK2
    
    IFBLOCK22: CMP  BALL1_CSTR,AX
           JA ENDIFBLOCK2
           CMP BALL1_CSTR,CX
           JB ENDIFBLOCK2

          NEG VEL_X1
           ADD VEL_Y1 ,2

        SUB DX,13
        ADD SCORE,10    
        MOV BLOCKCX,CX
        MOV BLOCKDX,DX
        MOV COLORBLOCK,0
                CALL BLOCK

        SUB LASTBLOCKDX2,10
         JMP ENDHITCHECK 
          
        
                            
          
         ENDIFBLOCK22:

ENDIFBLOCK2:

    MOV CX,LASTBLOCKCX3
    MOV AX,LASTBLOCKCX3
    MOV DX,LASTBLOCKDX3
    ADD AX,44


IFBLOCK3:
    CMP BALL1_RSTR,DX
    JBE IFBLOCK33
    JMP ENDIFBLOCK3
    
    IFBLOCK33: CMP  BALL1_CSTR,AX
           JA ENDIFBLOCK3
           CMP BALL1_CSTR,CX
           JB ENDIFBLOCK3

           NEG VEL_X1
           ADD VEL_Y1 ,2

        SUB DX,13
        ADD SCORE,10    
        MOV BLOCKCX,CX
        MOV BLOCKDX,DX
        MOV COLORBLOCK,0
                CALL BLOCK

        SUB LASTBLOCKDX3,10
          
        JMP  ENDHITCHECK
        
                            
          
         ENDIFBLOCK33:

ENDIFBLOCK3:
    MOV CX,LASTBLOCKCX4
    MOV AX,LASTBLOCKCX4
    MOV DX,LASTBLOCKDX4
    ADD AX,44


IFBLOCK4:
    CMP BALL1_RSTR,DX
    JBE IFBLOCK44
    JMP ENDIFBLOCK4
    
    IFBLOCK44: CMP  BALL1_CSTR,AX
           JA ENDIFBLOCK4
           CMP BALL1_CSTR,CX
           JB ENDIFBLOCK4

           NEG VEL_X1
           ADD VEL_Y1 ,2

        SUB DX,13
        ADD SCORE,10    
        MOV BLOCKCX,CX
        MOV BLOCKDX,DX
        MOV COLORBLOCK,0
                CALL BLOCK

        SUB LASTBLOCKDX4,10
          
          
        JMP ENDHITCHECK
                            
          
         ENDIFBLOCK44:

ENDIFBLOCK4:

    MOV CX,LASTBLOCKCX5
    MOV AX,LASTBLOCKCX5
    MOV DX,LASTBLOCKDX5
    ADD AX,44


IFBLOCK5:
    CMP BALL1_RSTR,DX
    JBE IFBLOCK55
    JMP ENDIFBLOCK5
    
    IFBLOCK55: CMP  BALL1_CSTR,AX
           JA ENDIFBLOCK5
           CMP BALL1_CSTR,CX
           JB ENDIFBLOCK5

           NEG VEL_X1
           ADD VEL_Y1 ,2

        SUB DX,13
        ADD SCORE,10    
        MOV BLOCKCX,CX
        MOV BLOCKDX,DX
        MOV COLORBLOCK,0
                CALL BLOCK

        SUB LASTBLOCKDX5,10
          
          
        JMP ENDHITCHECK
                            
          
         ENDIFBLOCK55:

ENDIFBLOCK5:

    MOV CX,LASTBLOCKCX6
    MOV AX,LASTBLOCKCX6
    MOV DX,LASTBLOCKDX6
    ADD AX,44


IFBLOCK6:
    CMP BALL1_RSTR,DX
    JBE IFBLOCK66
    JMP ENDIFBLOCK6
    
    IFBLOCK66: CMP  BALL1_CSTR,AX
           JA ENDIFBLOCK6
           CMP BALL1_CSTR,CX
           JB ENDIFBLOCK6

           NEG VEL_X1
           ADD VEL_Y1 ,2

        SUB DX,13
        ADD SCORE,10    
        MOV BLOCKCX,CX
        MOV BLOCKDX,DX
        MOV COLORBLOCK,0
                CALL BLOCK

        SUB LASTBLOCKDX6,10
          
          JMP ENDHITCHECK
        
                            
          
         ENDIFBLOCK66:

ENDIFBLOCK6:

ENDHITCHECK:

    POP AX
    POP CX
    POP DX
    POP BX
    POP BP    
    RET 


CHECKHITBLOCK1 ENDP

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

;-----------------------------------------------
;-----------------------------------------------
;----------------  Main Menu  ------------------
;-----------------------------------------------
;-----------------------------------------------

MAIN_menu PROC      
    PUSH    AX      ; store registers...
    PUSH    BX      ;
    PUSH    CX      ;
    PUSH    DX      ;      

    

    START:
        PRINT_MENU:
        
            CALL CLEAR_SCREEN
            MOV AH,9
            LEA DX,ITEM0
            INT 21H
            
            MOV BX, 0
            MOV CX, MENU_COUNT
            PRINT_ITEMS:
                MOV AX,BX
                SHR AX, 1   ; DIVIDE BY 2.
                CMP AX, SELECTED
                JNE NOT_SEL
                
                LEA DX, SELECTOR
                MOV AH, 09H
                INT 21H
                    
                JMP CONT
            NOT_SEL:
                LEA DX, EMPTY_SELECTOR
                MOV AH, 09H
                INT 21H
            CONT:    
                MOV DX, ITEMS_ADR[BX]
                MOV AH, 09H
                INT 21H
                
                ADD BX, 2  ; NEXT ITEM.
            LOOP PRINT_ITEMS
            
            
            
            MOV AH,9
            LEA DX,ITEM7
            INT 21H
               
            
            CHECK_FOR_KEY:
            
            MOV     AH,01H
            INT     16H
            Jnz      NO_KEY__1
            Jmp      NO_KEY
NO_KEY__1:    
            MOV     AH,00H
            INT     16H
            
            CMP     AL, 1BH    ; ESC - KEY?
            Jne      NOT_ENTER__1  ;
            Jmp      NOT_ENTER
NOT_ENTER__1:
            CMP     AH, UP
            JNE     NOT_UP
            SUB     SELECTED, 1
            NOT_UP:
            
            CMP     AH, DOWN
            JNE     NOT_DOWN
            ADD     SELECTED, 1
            NOT_DOWN:
            
            
            ; enter pressed?       
            CMP    AH, 1CH
            Je    NOT_ENTER__2
            Jmp   NOT_ENTER 
NOT_ENTER__2:
                CMP SELECTED, 0
                JNE NOT_ITEM_0
                CALL CLEAR_SCREEN
                JMP START_GAME
            NOT_ITEM_0:
                CMP SELECTED, 1
                JNE NOT_ITEM_1
                CALL CLEAR_SCREEN
                LEA DX, STR2
                MOV AH, 9
                INT 21H           
                MOV AH,1
                INT 21H
                JMP START  
            NOT_ITEM_1:
                CMP SELECTED, 2
                JNE NOT_ITEM_2
                CALL CLEAR_SCREEN
                LEA DX, STR3
                MOV AH, 9
                INT 21H               
                MOV AH,1
                INT 21H
                JMP START
            NOT_ITEM_2:
                CMP SELECTED,3
                JNE NOT_ITEM_3
                CALL CLEAR_SCREEN
                CALL SCORE_DISP           
                MOV AH,1
                INT 21H
                JMP START
            NOT_ITEM_3:
                CMP SELECTED, 4
                JNE NOT_ITEM_4
                CALL CLEAR_SCREEN
                LEA DX, STR5
                MOV AH, 9
                INT 21H           
                MOV AH,1
                INT 21H    
                JMP START
            NOT_ITEM_4:
                CMP SELECTED,5
                JNE NOT_ITEM_5
                CALL CLEAR_SCREEN
                LEA DX, STR6
                MOV AH, 9
                INT 21H           
                MOV AH,1
                INT 21H    
                JMP stop_prog
            NOT_ITEM_5:
                ; WAIT FOR KEY:
                MOV    AH, 00
                INT    16H    
            NOT_ENTER:
            
            
            
            ; CHECK IF OUT OF MENU BOUNDS:
            CMP    SELECTED, -1
            JNLE    OK1
            MOV    SELECTED, 0
            OK1:
                MOV AX, MENU_COUNT
                CMP    SELECTED, AX
                JNGE OK2
                DEC    AX
                MOV    SELECTED, AX
            OK2:
                JMP PRINT_MENU
            
            NO_KEY:
                JMP CHECK_FOR_KEY
        
        
        
        STOP_PROG:
            MOV AH,4CH
            INT 21H
    START_GAME:        
       MOV NO_BALL1,0
       MOV NO_BALL2,0
       MOV B_LOSS,0
    POP     DX      ; re-store registers...
    POP     CX      ;
    POP     BX      ;     
    POP     AX  
    ret      
MAIN_MENU ENDP


                    
WELCOME_SCR PROC
    PUSH    AX      ; store registers...
    PUSH    BX      ;
    PUSH    CX      ;
    PUSH    DX      ;
                              
        CALL CLEAR_SCREEN 
        MOV AH,9
        LEA DX,WLCM
        INT 21H         
        
        MOV AH,1
        INT 21H
        
    POP     DX      ; re-store registers...
    POP     CX      ;
    POP     BX      ;
    POP     AX      ;  

RET
WELCOME_SCR ENDP                   
                    
                    
                    

                    
YOU_LOSE PROC
    PUSH    AX      ; store registers...
    PUSH    BX      ;
    PUSH    CX      ;
    PUSH    DX      ;
        
        MOV AH,0
        MOV AL,2
        INT 10H         
        call score_disp              
        CALL CLEAR_SCREEN 
        MOV AH,9
        LEA DX,LOSE_MSG
        INT 21H         
        
        MOV AH,1
        INT 21H
        
    POP     DX      ; re-store registers...
    POP     CX      ;
    POP     BX      ;
    POP     AX      ;  

RET
YOU_LOSE ENDP                   
                    
                                  
                    
                    
CLEAR_SCREEN PROC
        PUSH    AX      ; store registers...
        PUSH    DS      ;
        PUSH    BX      ;
        PUSH    CX      ;
        PUSH    DI      ;

        MOV     AX, 40h
        MOV     DS, AX  ; for getting screen parameters.
        MOV     AH, 06h ; scroll up function id.
        MOV     AL, 0   ; scroll all lines!
        MOV     BH, 07  ; attribute for new lines.
        MOV     CH, 0   ; upper row.
        MOV     CL, 0   ; upper col.
        MOV     DI, 84h ; rows on screen -1,
        MOV     DH, [DI] ; lower row (byte).
        MOV     DI, 4Ah ; columns on screen,
        MOV     DL, [DI]
        DEC     DL      ; lower col.
        INT     10h

        ; set cursor position to top
        ; of the screen:
        MOV     BH, 0   ; current page.
        MOV     DL, 0   ; col.
        MOV     DH, 0   ; row.
        MOV     AH, 02
        INT     10h

        POP     DI      ; re-store registers...
        POP     CX      ;
        POP     BX      ;
        POP     DS      ;
        POP     AX      ;

        RET
CLEAR_SCREEN ENDP


SCORE_DISP PROC
    PUSH AX   
    PUSH BX
    PUSH CX
    PUSH DX
        CALL CLEAR_SCREEN
                              
        MOV AH,9
        LEA DX,SCOR_MSG
        INT 21H
        
        MOV AX,SCORE
        MOV BX,10D
        XOR CX,CX
        SAV_DEC:
            XOR DX,DX
            DIV BX         
            INC CX
            PUSH DX
            OR AX,AX
            JNZ SAV_DEC 
            
            MOV AH,2  
            
        OUT_DEC:
            POP DX
            ADD DX,30H
            INT 21H
            LOOP OUT_DEC
       MOV AH,1
       INT 21H
    POP DX 
    POP CX
    POP BX
    POP AX
    RET
SCORE_DISP ENDP
                        
                        
END MAIN