
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
