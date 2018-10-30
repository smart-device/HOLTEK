; Uploaded by http://smart-device.ir

message '****************************************************************'
message '*PROJECT NAME :MAIN PROGRAM V102                               *'
message '*     VERSION :V102                                            *'
message '* ICE VERSION :                                                *'
message '*      DATE   :20150317                                        *'
message '*      REMARK :V102 modify ESCpowerIDcheck2,PBP                *'
message '****************************************************************'
                ;=INCLUDE REFERENCE FILE
                INCLUDE MAIN_PROGRAM_V102.INC

                ;-PUBLIC LABEL
                PUBLIC  _LOAD_TKS_GLOBE_VARIES
                PUBLIC  _LOAD_HXT_REFERENCE

CALL_   MACRO   FUNCTION
        ifdef   FUNCTION
                ifdef   PBP
                MOV     A,bank FUNCTION
                MOV     PBP,A
                endif
                CALL    FUNCTION
        endif
                ENDM

EXTEND_FUNCTION_INITIAL MACRO
                CALL_   EXTEND_FUNCTION_1A_INITIAL
                CALL_   EXTEND_FUNCTION_1B_INITIAL
                CALL_   EXTEND_FUNCTION_1C_INITIAL
                CALL_   EXTEND_FUNCTION_1D_INITIAL
                CALL_   EXTEND_FUNCTION_1E_INITIAL
                CALL_   EXTEND_FUNCTION_1F_INITIAL
                CALL_   EXTEND_FUNCTION_1G_INITIAL
                CALL_   EXTEND_FUNCTION_1H_INITIAL

                CALL_   EXTEND_FUNCTION_2A_INITIAL
                CALL_   EXTEND_FUNCTION_2B_INITIAL
                CALL_   EXTEND_FUNCTION_2C_INITIAL
                CALL_   EXTEND_FUNCTION_2D_INITIAL
                CALL_   EXTEND_FUNCTION_2E_INITIAL
                CALL_   EXTEND_FUNCTION_2F_INITIAL
                CALL_   EXTEND_FUNCTION_2G_INITIAL
                CALL_   EXTEND_FUNCTION_2H_INITIAL
                ENDM

EXTEND_FUNCTION MACRO
                CALL_   EXTEND_FUNCTION_1A
                CALL_   EXTEND_FUNCTION_1B
                CALL_   EXTEND_FUNCTION_1C
                CALL_   EXTEND_FUNCTION_1D
                CALL_   EXTEND_FUNCTION_1E
                CALL_   EXTEND_FUNCTION_1F
                CALL_   EXTEND_FUNCTION_1G
                CALL_   EXTEND_FUNCTION_1H

                CALL_   EXTEND_FUNCTION_2A
                CALL_   EXTEND_FUNCTION_2B
                CALL_   EXTEND_FUNCTION_2C
                CALL_   EXTEND_FUNCTION_2D
                CALL_   EXTEND_FUNCTION_2E
                CALL_   EXTEND_FUNCTION_2F
                CALL_   EXTEND_FUNCTION_2G
                CALL_   EXTEND_FUNCTION_2H
                ENDM
                ;==============
                ;=DATA SETCTION
                ;==============
MAIN_DATA       .SECTION          'DATA'

ifndef  ESCpowerIDcheck
POR_ID          DB      2 DUP(?)
endif



                ;==============
                ;=CODE SETCTION
                ;==============
PROGRAM_ENTRY   .SECTION  AT 000H 'CODE'
        ifdef   PBP
                CLR     PBP
                ifndef  ESCpowerIDcheck
                MOV     A,042H      ;ASCII = B
                endif
        else
                ;----------------
                ;-SET POR ID 1---
                ;----------------
                ifndef  ESCpowerIDcheck
                MOV     A,042H      ;ASCII = B
                SNZ     TO
                MOV     POR_ID[0],A
                endif
        endif
                JMP     PROGRAM_RESET

                ;==============
                ;=MAIN PROGRAM=
                ;==============
MAIN_PROGRAM    .SECTION          'CODE'

                ;;***********************
PROGRAM_RESET:  ;;* PROGRAM ENTRY *******
                ;;***********************
        ifdef   PBP
                ifndef  ESCpowerIDcheck
                SNZ     TO
                MOV     POR_ID[0],A
                endif
        endif
                ;----------------
                ;-SET POR ID 2---
                ;----------------
        ifndef  ESCpowerIDcheck
                MOV     A,053H      ;ASCII = S
                MOV     POR_ID[1],A
        endif


                ;---------------------
                ;-MCU HARDWARE INITIAL
                ;---------------------
                MCU_HARDWARE_INITIAL

                ;------------------------------
                ;-LOAD LIBRARY OPTION/THRESHOLD
                ;------------------------------
                CALL    _LOAD_TKS_GLOBE_VARIES

                ;------------------------
                ;-EXTEND FUNCTION INITIAL
                ;------------------------
                EXTEND_FUNCTION_INITIAL

                ;;-----------------------
MAIN_LOOP:      ;;- MAIN PROGRAM LOOP ---
                ;;-----------------------
                CLR     WDT
                CLR     WDT1
                CLR     WDT2

                ;----------------
                ;-CHECK POR ID --
                ;----------------
        ifndef  ESCpowerIDcheck
                MOV     A,042H
                XORM    A,POR_ID[0]
                MOV     A,053H
                SZ      Z
                XORM    A,POR_ID[1]
                SNZ     Z
                JMP     000H
        endif
                ;----------------------
                ;-RE INITIAL SYS. CLOCK
                ;----------------------
                RELOAD_SYS_CLOCK
                EXTEND_FUNCTION
                ;----------------
                ;-SET POR ID  ---
                ;----------------
        ifndef  ESCpowerIDcheck
                MOV     A,042H      ;ASCII = B
                MOV     POR_ID[0],A
                MOV     A,053H      ;ASCII = S
                MOV     POR_ID[1],A
        endif

                ;--------------------
WDT_WAKEUP:     ;-WDT WAKEUP FUNCTION
                ;--------------------
                if      PowerSave==1
                CALL_   _CHECK_KEY_WAKEUP
                endif

                ifdef   PBP
                MOV     A,BANK MAIN_LOOP
                MOV     PBP,A
                endif
                JMP     MAIN_LOOP









;;***********************************************************
;;*SUB. NAME:                                               *
;;*INPUT    :                                               *
;;*OUTPUT   :                                               *
;;*USED REG.:                                               *
;;*FUNCTION :                                               *
;;***********************************************************
CLEAR_RAM:
                MOV     MP1,A
        ifndef  ESCpowerIDcheck
            ifdef  BP
                ;-CHECK BANK
                SZ      BP
                JMP     CLR_RAM
            endif
                ;-CHECK POR_ID RAM
                MOV     A,OFFSET POR_ID
                XOR     A,MP1
                MOV     A,OFFSET POR_ID+1
                SNZ     Z
                XOR     A,MP1
                SNZ     Z
        endif
CLR_RAM:        ;-CLEAR RAM
                CLR     IAR1
                SIZA    MP1
                JMP     CLEAR_RAM

                RET


;;***********************************************************
;;*SUB. NAME:                                               *
;;*INPUT    :                                               *
;;*OUTPUT   :                                               *
;;*USED REG.:                                               *
;;*FUNCTION :                                               *
;;***********************************************************
_LOAD_TKS_GLOBE_VARIES:
_LOAD_HXT_REFERENCE:
                ;------------------------
                ;-SET TKS LIBRARY OPTION-
                ;------------------------
                MOV     A,GlobeOptionA
                MOV     _GLOBE_VARIES[0],A
                MOV     A,GlobeOptionB
                MOV     _GLOBE_VARIES[1],A
                MOV     A,GlobeOptionC
                MOV     _GLOBE_VARIES[2],A

                ;--------------------------
                ;-SET TOUCH OR IO ATTRIBUTE
                ;--------------------------
                MOV     A,IO_TOUCH_ATTR&0FFH
                MOV     _KEY_IO_SEL[0],A
                ;-IF OVER 2 TOUCH IP (8~16KEY)
                if      TouchKeyAmount > 8
                MOV     A,(IO_TOUCH_ATTR>>8)&0FFH
                MOV     _KEY_IO_SEL[1],A
                endif
                ;-IF OVER 4 TOUCH IP (17~24KEY)
                if      TouchKeyAmount > 16
                MOV     A,(IO_TOUCH_ATTR>>16)&0FFH
                MOV     _KEY_IO_SEL[2],A
                endif
                ;-IF OVER 6 TOUCH IP (25~32KEY)
                if      TouchKeyAmount > 24
                MOV     A,(IO_TOUCH_ATTR>>24)&0FFH
                MOV     _KEY_IO_SEL[3],A
                endif

                ;------------------------
                ;-SET TOUCH KEY THRESHOLD
                ;------------------------
                ;-KEY1 THRESHOLD
                MOV     A,Key1Threshold
                MOV     _GLOBE_VARIES[3],A

                if      TouchKeyAmount > 1
                ;-KEY2 THRESHOLD
                MOV     A,Key2Threshold
                MOV     _GLOBE_VARIES[4],A
                endif

                if      TouchKeyAmount > 2
                ;-KEY3 THRESHOLD
                MOV     A,Key3Threshold
                MOV     _GLOBE_VARIES[5],A
                endif

                if      TouchKeyAmount > 3
                ;-KEY4 THRESHOLD
                MOV     A,Key4Threshold
                MOV     _GLOBE_VARIES[6],A
                endif

                if      TouchKeyAmount > 4
                ;-KEY5 THRESHOLD
                MOV     A,Key5Threshold
                MOV     _GLOBE_VARIES[7],A
                endif

                if      TouchKeyAmount > 5
                ;-KEY6 THRESHOLD
                MOV     A,Key6Threshold
                MOV     _GLOBE_VARIES[8],A
                endif

                if      TouchKeyAmount > 6
                ;-KEY7 THRESHOLD
                MOV     A,Key7Threshold
                MOV     _GLOBE_VARIES[9],A
                endif

                if      TouchKeyAmount > 7
                ;-KEY8 THRESHOLD
                MOV     A,Key8Threshold
                MOV     _GLOBE_VARIES[10],A
                endif

                if     TouchKeyAmount > 8
                ;-KEY9 THRESHOLD
                MOV     A,Key9Threshold
                MOV     _GLOBE_VARIES[11],A
                endif

                if      TouchKeyAmount > 9
                ;-KEY10 THRESHOLD
                MOV     A,Key10Threshold
                MOV     _GLOBE_VARIES[12],A
                endif

                if      TouchKeyAmount > 10
                ;-KEY11 THRESHOLD
                MOV     A,Key11Threshold
                MOV     _GLOBE_VARIES[13],A
                endif

                if      TouchKeyAmount > 11
                ;-KEY12 THRESHOLD
                MOV     A,Key12Threshold
                MOV     _GLOBE_VARIES[14],A
                endif

                if      TouchKeyAmount > 12
                ;-KEY13 THRESHOLD
                MOV     A,Key13Threshold
                MOV     _GLOBE_VARIES[15],A
                endif

                if      TouchKeyAmount > 13
                ;-KEY14 THRESHOLD
                MOV     A,Key14Threshold
                MOV     _GLOBE_VARIES[16],A
                endif

                if      TouchKeyAmount > 14
                ;-KEY15 THRESHOLD
                MOV     A,Key15Threshold
                MOV     _GLOBE_VARIES[17],A
                endif

                if      TouchKeyAmount > 15
                ;-KEY16 THRESHOLD
                MOV     A,Key16Threshold
                MOV     _GLOBE_VARIES[18],A
                endif

                if      TouchKeyAmount > 16
                ;-KEY17 THRESHOLD
                MOV     A,Key17Threshold
                MOV     _GLOBE_VARIES[19],A
                endif

                if      TouchKeyAmount > 17
                ;-KEY18 THRESHOLD
                MOV     A,Key18Threshold
                MOV     _GLOBE_VARIES[20],A
                endif

                if      TouchKeyAmount > 18
                ;-KEY19 THRESHOLD
                MOV     A,Key19Threshold
                MOV     _GLOBE_VARIES[21],A
                endif

                if      TouchKeyAmount > 19
                ;-KEY20 THRESHOLD
                MOV     A,Key20Threshold
                MOV     _GLOBE_VARIES[22],A
                endif

                if      TouchKeyAmount > 20
                ;-KEY17 THRESHOLD
                MOV     A,Key21Threshold
                MOV     _GLOBE_VARIES[23],A
                endif

                if      TouchKeyAmount > 21
                ;-KEY18 THRESHOLD
                MOV     A,Key22Threshold
                MOV     _GLOBE_VARIES[24],A
                endif

                if      TouchKeyAmount > 22
                ;-KEY19 THRESHOLD
                MOV     A,Key23Threshold
                MOV     _GLOBE_VARIES[25],A
                endif

                if      TouchKeyAmount > 23
                ;-KEY20 THRESHOLD
                MOV     A,Key24Threshold
                MOV     _GLOBE_VARIES[26],A
                endif

                if      TouchKeyAmount > 24
                ;-KEY17 THRESHOLD
                MOV     A,Key25Threshold
                MOV     _GLOBE_VARIES[27],A
                endif

                if      TouchKeyAmount > 25
                ;-KEY18 THRESHOLD
                MOV     A,Key26Threshold
                MOV     _GLOBE_VARIES[28],A
                endif

                if      TouchKeyAmount > 26
                ;-KEY19 THRESHOLD
                MOV     A,Key27Threshold
                MOV     _GLOBE_VARIES[29],A
                endif

                if      TouchKeyAmount > 27
                ;-KEY20 THRESHOLD
                MOV     A,Key28Threshold
                MOV     _GLOBE_VARIES[30],A
                endif

                if      TouchKeyAmount > 28
                ;-KEY29 THRESHOLD
                MOV     A,Key29Threshold
                MOV     _GLOBE_VARIES[31],A
                endif

                if      TouchKeyAmount > 29
                ;-KEY30 THRESHOLD
                MOV     A,Key30Threshold
                MOV     _GLOBE_VARIES[32],A
                endif

                if      TouchKeyAmount > 30
                ;-KEY31 THRESHOLD
                MOV     A,Key31Threshold
                MOV     _GLOBE_VARIES[33],A
                endif

                if      TouchKeyAmount > 31
                ;-KEY32 THRESHOLD
                MOV     A,Key32Threshold
                MOV     _GLOBE_VARIES[34],A
                endif


                RET




                END



