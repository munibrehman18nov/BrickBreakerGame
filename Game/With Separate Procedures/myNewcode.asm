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
     
     VEL_X1            DW -3         ;FOR DIRECTION
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
              DB  0AH,0DH,"======================= Ameer Hamza ==============================="
              DB  0AH,0DH,"=================================================================="
              DB  0AH,0DH,"=================================================================="
              DB  0AH,0DH,"=====================hamzagee@outlook.com=========================="
              DB  0AH,0DH,"=================================================================="
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

include Macros.asm

MAIN PROC

MOV AX,@DATA       
MOV DS,AX          
    CALL WELCOME_SCR
    CALL MAIN_MENU
    CALL SET_DISPLAY_MODE
    
    MOV AH,0CH       ;CHANGE THE COLOR OF PIXEL  COLOR VALUE IS IN REGISTER "CX"
    
    CALL DISPLAY_BAR
    MOV AL,13H           ;CHANGE THE DISPLAY MODE TO 320X200 PIXELS       
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


include display.asm                                                        
include bar.asm                                                        
include ball.asm                                                        
include block.asm                                                        
include hit.asm                                                        
include mainmenu.asm                                                       
                
                        
END MAIN