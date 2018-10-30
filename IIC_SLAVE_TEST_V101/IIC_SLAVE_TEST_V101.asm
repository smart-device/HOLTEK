message '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - '
message '<      IIC_SLAVE_TEST_V101.asm     >'
        INCLUDE IIC_SLAVE_TEST_V101.INC
PUBLIC  _IIC_SLAVE_TEST_V101
PUBLIC  _IIC_SLAVE_TEST_V101_INITIAL

PUBLIC  _IIC_USER_DATA
PUBLIC  _IIC_GlobalOption

IFNDEF _IIC_SLAVE_TEST_V101_
#define IIC_ADDRESS 0A0H
#define IIC_USER_DATA_LEN   8
#define IIC_USER_DATA_BANK  0
ENDIF


IFDEF	TKM6C0
	IFNDEF _TKM_
	#define _TKM_   7
	ENDIF
ENDIF
IFDEF	TKM5C0
	IFNDEF _TKM_
	#define _TKM_   6
	ENDIF
ENDIF
IFDEF	TKM4C0
	IFNDEF _TKM_
	#define _TKM_   5
	ENDIF
ENDIF
IFDEF	TKM3C0
	IFNDEF _TKM_
	#define _TKM_   4
	ENDIF
ENDIF
IFDEF	TKM2C0
	IFNDEF _TKM_
	#define _TKM_   3
	ENDIF
ENDIF
IFDEF	TKM1C0
	IFNDEF _TKM_
	#define _TKM_   2
	ENDIF
ENDIF
IFDEF	TKM0C0
	IFNDEF _TKM_
	#define _TKM_   1
	ENDIF
ENDIF



IFNDEF  _TKM_
    ERRmessage  '_TKM_ Not define'
ELSE
    #define IIC_TH_LEN  (_TKM_*4)
ENDIF






;*******************************************************************
#define CMD_R_Lib_VersionL  00H
#define CMD_R_Lib_VersionH  01H
#define CMD_R_KeyAmount 02H
#define CMD_R_EE_Status 03H
#define CMD_R_TK_Select0    04H
#define CMD_R_KeyStatus0    08H
#define CMD_R_K1_Freq   010H
#define CMD_R_K1_Ref    050H
#define CMD_R_K1_Offset 090H
#define CMD_R_K1_RCC    0B0H

#define CMD_RW_Global   0D0H
#define CMD_RW_DeviceA  CMD_RW_Global+0
#define CMD_RW_DeviceB  CMD_RW_Global+1
#define CMD_RW_KeyAmount    CMD_RW_Global+2
#define CMD_RW_OptionA  CMD_RW_Global+3
#define CMD_RW_OptionB  CMD_RW_Global+4
#define CMD_RW_OptionC  CMD_RW_Global+5
;#define    CMD_RW_     CMD_RW_Global+6
;#define    CMD_RW_     CMD_RW_Global+7
#define CMD_RW_K1_TH    CMD_RW_Global+8


;;;;;#define    CMD_R_Lib_VersionL  00H
;;;;;#define    CMD_R_Lib_VersionH  01H
;;;;;#define    CMD_R_KeyAmount 02H
;;;;;#define    CMD_R_EE_Status 03H
;;;;;#define    CMD_R_TK_Select0    04H
;;;;;#define    CMD_R_KeyStatus0    08H
;;;;;#define    CMD_R_K1_Freq   010H
;;;;;#define    CMD_R_K1_Ref    050H
;;;;;#define    CMD_R_K1_RCC    090H
;;;;;
;;;;;#define    CMD_RW_Global   0B0H
;;;;;#define    CMD_RW_B0       CMD_RW_Global+0
;;;;;#define    CMD_RW_B1       CMD_RW_Global+1
;;;;;#define    CMD_RW_OptionA  CMD_RW_Global+2
;;;;;#define    CMD_RW_OptionB  CMD_RW_Global+3
;;;;;#define    CMD_RW_OptionC  CMD_RW_Global+4
;;;;;#define    CMD_RW_K1_TH    CMD_RW_Global+5
message 'IIC TABLE'
message '       ---------------------------------------------------------------'
message 'addr  |  bit7 |  bit6 |  bit5 |  bit4 |  bit3 |  bit2 |  bit1 |  bit0 |'
message '0x08: |  KEY8 |  KEY7 |  KEY6 |  KEY5 |  KEY4 |  KEY3 |  KEY2 |  KEY1 |  KeyStatus0'
if _TKM_>2 & _TKM_<4
message '0x09: |   -   |   -   |   -   |   -   | KEY12 | KEY11 | KEY10 |  KEY9 |  KeyStatus1'
endif
if _TKM_>3
message '0x09: | KEY16 | KEY15 | KEY14 | KEY13 | KEY12 | KEY11 | KEY10 |  KEY9 |  KeyStatus1'
endif
if _TKM_>4 & _TKM_<6
message '0x0A: |   -   |   -   |   -   |   -   | KEY20 | KEY19 | KEY18 | KEY17 |  KeyStatus2'
endif
if _TKM_>5
message '0x0A: | KEY24 | KEY23 | KEY22 | KEY21 | KEY20 | KEY19 | KEY18 | KEY17 |  KeyStatus2'
endif
if _TKM_>6 & _TKM_<8
message '0x0B: |   -   |   -   |   -   |   -   | KEY28 | KEY27 | KEY26 | KEY25 |  KeyStatus3'
endif
if _TKM_>7
message '0x0B: | KEY32 | KEY31 | KEY30 | KEY29 | KEY28 | KEY27 | KEY26 | KEY25 |  KeyStatus3'
endif
message '       ---------------------------------------------------------------'
message ''
message 'addr    Register'
message '0xb0 : _IIC_GlobalOption[0]'
message '0xb1 : _IIC_GlobalOption[1]'
message '0xb2 : _IIC_GlobalOption[2](_GLOBE_VARIES[0])'
message '0xb3 : _IIC_GlobalOption[3](_GLOBE_VARIES[1])'
message '0xb4 : _IIC_GlobalOption[4](_GLOBE_VARIES[2])'
message ''
message '0xb5 : _IIC_GlobalOption[5](_GLOBE_VARIES[3])'
message '0xb6 : _IIC_GlobalOption[6](_GLOBE_VARIES[4])'
message '0xb7 : _IIC_GlobalOption[7](_GLOBE_VARIES[5])'
message '0xb8 : _IIC_GlobalOption[8](_GLOBE_VARIES[6])'
message '0xb9 : _IIC_GlobalOption[9](_GLOBE_VARIES[7])'
message '0xba : _IIC_GlobalOption[10](_GLOBE_VARIES[8])'
message '0xbb : _IIC_GlobalOption[11](_GLOBE_VARIES[9])'
message '0xbc : _IIC_GlobalOption[12](_GLOBE_VARIES[10])'

if _TKM_>2
message '0xbd : _IIC_GlobalOption[13](_GLOBE_VARIES[11])'
message '0xbe : _IIC_GlobalOption[14](_GLOBE_VARIES[12])'
message '0xbf : _IIC_GlobalOption[15](_GLOBE_VARIES[13])'
message '0xc0 : _IIC_GlobalOption[16](_GLOBE_VARIES[14])'
endif
if _TKM_>3
message '0xc1 : _IIC_GlobalOption[17](_GLOBE_VARIES[15])'
message '0xc2 : _IIC_GlobalOption[18](_GLOBE_VARIES[16])'
message '0xc3 : _IIC_GlobalOption[19](_GLOBE_VARIES[17])'
message '0xc4 : _IIC_GlobalOption[20](_GLOBE_VARIES[18])'
endif
if _TKM_>4
message '0xc5 : _IIC_GlobalOption[21](_GLOBE_VARIES[19])'
message '0xc6 : _IIC_GlobalOption[22](_GLOBE_VARIES[20])'
message '0xc7 : _IIC_GlobalOption[23](_GLOBE_VARIES[21])'
message '0xc8 : _IIC_GlobalOption[24](_GLOBE_VARIES[22])'
endif
message ''
if _TKM_==2
message '0xbb : _IIC_USER_DATA[0]'
endif
if _TKM_==3
message '0xc1 : _IIC_USER_DATA[0]'
endif
if _TKM_==4
message '0xc5 : _IIC_USER_DATA[0]'
endif
if _TKM_==5
message '0xc9 : _IIC_USER_DATA[0]'
endif

;*********************************************************************





;*******************************************************************
RAMBANK IIC_USER_DATA_BANK IIC_USER_RAM
IIC_USER_RAM       .SECTION  'DATA'
_IIC_USER_DATA DB IIC_USER_DATA_LEN DUP(?)
;*******************************************************************
RAMBANK 0 IIC_SLAVE_TEST_RW_RAM
IIC_SLAVE_TEST_RW_RAM       .SECTION  'DATA'
IIC_STACK   DB 2 DUP(?)
;*******************************************************************
IIC_SLAVE_TEST_RW_CODE    .SECTION  'CODE'
IIC_WRITE_ENTRY PROC
        MOV A,MP1
        MOV IIC_STACK[0],A
        MOV A,BP
        MOV IIC_STACK[1],A
        CLR IIC_DATA_OUT
;================================================================
    ;..........................................

        MOV A,IIC_DATA_INDEX
        SUB A,CMD_RW_Global
        SNZ Z
        JMP $+3
        SET bWriteOption
        CLR WRITE_CHECKSUM

    ;..........................................
        MOV A,CMD_RW_K1_TH
        ADD A,IIC_TH_LEN
        SUB A,IIC_DATA_INDEX
        SZ  Z
        JMP WRITE_CHECK_SUM
        SZ  C
        JMP WRITE_TKS_OPTION
        ;################################
        CPL ACC
        INC ACC
    WRITE_USER_DATA:
        ADD A,OFFSET _IIC_USER_DATA
        MOV MP1,A
        SUB A,(OFFSET _IIC_USER_DATA)+IIC_USER_DATA_LEN
        SZ  C
        JMP END_IIC_RW
        MOV A,BANK _IIC_USER_DATA
        MOV BP,A
        MOV A,IIC_DATA_IN
        MOV IAR1,A
        INC IIC_DATA_INDEX
        ;################################
        JMP END_IIC_RW
    ;..........................................
    WRITE_CHECK_SUM:
        SNZ bWriteOption
        JMP WRITE_USER_DATA
        SZ  bUpDateOption
        JMP END_IIC_RW
        CLR bWriteOption
        CLR bCheckSum_Error
        CLR bUpDateOption

        MOV A,IIC_DATA_IN
        XOR A,WRITE_CHECKSUM
        SZ  Z
        SET bUpDateOption
        SNZ Z
        SET bCheckSum_Error
        JMP END_IIC_RW
    ;..........................................
    WRITE_TKS_OPTION:
        SZ  bUpDateOption
        JMP END_IIC_RW
        SNZ bWriteOption
        JMP END_IIC_RW
        MOV A,IIC_DATA_INDEX
        SUB A,CMD_RW_Global
        ADD A,OFFSET    _IIC_GlobalOption
        MOV MP1,A
        MOV A,BANK  _IIC_GlobalOption
        MOV BP,a

        MOV A,IIC_DATA_IN
        MOV IAR1,A
        ADDM    A,WRITE_CHECKSUM
        INC IIC_DATA_INDEX
        JMP END_IIC_RW
IIC_WRITE_ENTRY ENDP
;================================================================

;*******************************************************************

;*******************************************************************
IIC_PRE_READ PROC
        MOV A,MP1
        MOV IIC_STACK[0],A
        MOV A,BP
        MOV IIC_STACK[1],A
        CLR IIC_DATA_OUT
        ;################################
        MOV A,IIC_DATA_INDEX
        SUB A,(CMD_RW_K1_TH+IIC_TH_LEN)
        SZ  C
        JMP IIC_READ_USER_DATA
        ;################################
;================================================================
        MOV A,IIC_DATA_INDEX
        SUB A,CMD_RW_Global
        SZ  C
        JMP IIC_READ_Setting

        MOV A,IIC_DATA_INDEX
        SUB A,CMD_R_K1_RCC
        SZ  C
        JMP IIC_READ_RCC

        MOV A,IIC_DATA_INDEX
        SUB A,CMD_R_K1_OFFSET
        SZ  C
        JMP END_IIC_RW

        MOV A,IIC_DATA_INDEX
        SUB A,CMD_R_K1_Ref
        SZ  C
        JMP IIC_READ_REF

        MOV A,IIC_DATA_INDEX
        SUB A,CMD_R_K1_Freq
        SZ  C
        JMP IIC_READ_FREQ

        MOV A,IIC_DATA_INDEX
        SUB A,CMD_R_KeyStatus0
        SZ  C
        JMP IIC_READ_STATUS

        MOV A,IIC_DATA_INDEX
        SUB A,CMD_R_TK_Select0
        SZ  C
        JMP IIC_READ_TK_SEL

        MOV A,IIC_DATA_INDEX
        XOR A,CMD_R_EE_Status
        SNZ Z
        JMP $+4
        MOV A,IIC_EE_STATUS
        MOV IIC_DATA_OUT,A
        JMP END_IIC_RW

        MOV A,IIC_DATA_INDEX
        XOR A,CMD_R_KeyAmount
        SNZ Z
        JMP $0
        MOV A,IIC_TH_LEN
        MOV IIC_DATA_OUT,A
        JMP END_IIC_RW
    $0:
        MOV A,IIC_DATA_INDEX
        XOR A,CMD_R_Lib_VersionH
        SNZ Z
        JMP $1
        MOV A,IIC_LibVer[1]
        MOV IIC_DATA_OUT,A
        JMP END_IIC_RW
    $1:
        SZ  IIC_DATA_INDEX
        JMP END_IIC_RW
        MOV A,IIC_LibVer[0]
        MOV IIC_DATA_OUT,A
        JMP END_IIC_RW

    IIC_READ_USER_DATA:
            ADD A,OFFSET    _IIC_USER_DATA
            MOV MP1,A
            MOV A,BANK  _IIC_USER_DATA
            MOV BP,A
            JMP IIC_PRELOAD_DATA
    IIC_READ_Setting:
            ADD A,OFFSET    _IIC_GlobalOption
            MOV MP1,A
            MOV A,BANK  _IIC_GlobalOption
            MOV BP,A
            JMP IIC_PRELOAD_DATA
    IIC_READ_STATUS:
            ADD A,OFFSET    _KEY_DATA
            MOV MP1,A
            MOV A,BANK  _KEY_DATA
            MOV BP,A
            JMP IIC_PRELOAD_DATA
    IIC_READ_TK_SEL:
            ADD A,OFFSET    _KEY_IO_SEL
            MOV MP1,A
            MOV A,BANK  _KEY_IO_SEL
            MOV BP,A

            MOV A,IAR1
            XOR A,0FFH
            MOV IIC_DATA_OUT,A
            JMP END_IIC_RW

    IIC_READ_RCC:
            RL  ACC
            RL  ACC
          ;;ADD A,3
            ADD A,OFFSET    _KEY_REF + 3
            MOV MP1,A
            MOV A,BANK  _KEY_REF
            MOV BP,A
            JMP IIC_PRELOAD_DATA
                    ;----------------
    IIC_READ_FREQ:  ;-READ KEY FREQ -
                    ;----------------
            RL  ACC
            ADD A,OFFSET    _KEY_REF + 1
         ;; INC ACC
            MOV MP1,A
            MOV A,BANK  _KEY_REF
            MOV BP,A

            ;....V412.....
            ;ADD    A,OFFSET    _KEY_FREQ
            ;MOV    MP1,A
            ;MOV    A,BANK  _KEY_FREQ
            ;MOV    BP,A
            ;.............

            JMP IIC_READ_FREQ_REF
                    ;----------------
    IIC_READ_REF:   ;-READ REFERENCE-
                    ;----------------
            RL  ACC
            AND A,11111100B
            ADD A,OFFSET    _KEY_REF
            MOV MP1,A
            MOV A,BANK  _KEY_REF
            MOV BP,A

        IIC_READ_FREQ_REF:
            SZ  IIC_DATA_INDEX.0
            JMP IIC_READ_FREQ_REF_HIGH_BYTE
            MOV A,IAR1
            MOV IIC_DATA_OUT,A

            ;....V412.....
            ;INC    MP1
            ;MOV    A,IAR1
            ;MOV    IIC_DATA_IN,A
            ;.............
            JMP END_IIC_RW
        IIC_READ_FREQ_REF_HIGH_BYTE:
            ;....V412.....
            ;MOV    A,IIC_DATA_IN
            ;AND    A,0FH
            ;MOV    IIC_DATA_OUT,A
            ;.............

            ;....V413.....
            CLR IIC_DATA_OUT
            ;.............

            JMP END_IIC_RW
    IIC_PRELOAD_DATA:;-IIC PRE-LOAD DATA
            MOV A,IAR1
            MOV IIC_DATA_OUT,A
;================================================================
END_IIC_RW:
        MOV A,IIC_STACK[1]
        MOV BP,A
        MOV A,IIC_STACK[0]
        MOV MP1,A
        JMP _ENDIIC
IIC_PRE_READ ENDP
;*******************************************************************















































;*************************************************************************************************************************************************
;*************************************************************************************************************************************************
;*************************************************************************************************************************************************
;*************************************************************************************************************************************************
;*************************************************************************************************************************************************
;*************************************************************************************************************************************************
;*************************************************************************************************************************************************
;*************************************************************************************************************************************************


IFDEF   SIMCTL0
    #define SIMC0   SIMCTL0
endif
ifdef   IICC0
    #define SIMC0   IICC0
endif

IFDEF   SIMAR
    #define SIMA    SIMAR
endif
IFDEF   IICA
    #define SIMA    IICA
endif

IFDEF   SIMDR
    #define SIMD    SIMDR
endif
IFDEF   IICD
    #define SIMD    IICD
ENDIF

IFDEF   ESIMI
    #define SIME    ESIMI
endif
IFDEF   IICE
    #define SIME    IICE
endif

ifdef   IICF
    #define SIMF    IICF
ENDIF


ifdef   IICHTX
    #define HTX IICHTX
endif
ifdef   IICHAAS
    #define HAAS    IICHAAS
endif
ifdef   IICSRW
    #define SRW IICSRW
endif
ifdef   IICRXAK
    #define RXAK    IICRXAK
endif
ifdef   IICTXAK
    #define TXAK    IICTXAK
endif

ifdef   IICRNIC
    #define RNIC    IICRNIC
ENDIF






RAMBANK 0 IIC_SLAVE_TEST_V101_RAM
IIC_SLAVE_TEST_V101_RAM       .SECTION  'DATA'
SIM_STACK       DB 2 DUP(?)
bWrite1st       DBIT
IIC_DATA_OUT    DB      ?
IIC_DATA_IN DB      ?
IIC_DATA_INDEX  DB      ?
;=====================================================================
IIC_EE_STATUS       LABEL   BYTE
bWriteOption    DBIT    ;0
IIC_EE_STS_BIT1 DBIT    ;1
bUpDateOption   DBIT    ;2
IIC_EE_STS_BIT3 DBIT      ;3
IIC_EE_STS_BIT4 DBIT      ;4
IIC_EE_STS_BIT5 DBIT      ;5
IIC_EE_STS_BIT6 DBIT      ;6
bCheckSum_Error DBIT      ;7
;=====================================================================
;.............................................
IIC_LibVer  DB  2   DUP(?)
;IIC_KEY_AMOUNT DB  ?
_IIC_GlobalOption   DB  ((CMD_RW_K1_TH-CMD_RW_Global)+IIC_TH_LEN)   DUP(?)
WRITE_CHECKSUM  DB  ?
;=====================================================================




;*********************************************************************
#define SlaveMode       HTX
#define AddrMatch       HAAS
#define MasterRead  SRW
#define SlaveRecAck RXAK
DUMMY_READ  macro
        MOV A,SIMD      ;DUMMY READ
        endm
SLAVE_SEND_ACK  macro           ;enable transmits acknowledge
        CLR TXAK
        endm
Slave_Tx_Mode   macro
        set SlaveMode
        endm
Slave_Rx_Mode   macro           ;receive mode (master write)
        clr SlaveMode
        endm

IF_AddrNotMatch_GOTO    macro   addr
        SNZ AddrMatch       ;0:read/write data 1:address match
        JMP addr
        endm

IF_WriteData_GOTO   macro   addr
        SNZ MasterRead  ;0:master wants to write data 1:master wants to read data
        JMP addr
        endm

IF_Master_Read_GOTO macro   addr
        SZ  SlaveMode
        JMP addr
        endm
IF_ACK_GOTO macro   addr
        SNZ SlaveRecAck
        JMP addr
        endm

;*********************************************************************
IIC_INT_CODE   .SECTION  AT IIC_INT_ADDR 'CODE'
        CHECK_SIMF
        CLR SIMF
        JMP SIM_INT

IIC_SLAVE_TEST_V101_CODE    .SECTION  'CODE'
IIC_INITIAL PROC
;JMP    IIC_WRITE_ENTRY
;jmp    IIC_PRE_READ

        SET IIC_SDA_PU
        SET IIC_SCL_PU
        ;--
        MOV A,11000010B ;I2C Mode ,Enable SIM
        MOV SIMC0,A


        MOV A,IIC_ADDRESS
        MOV SIMA,A

        CLR HTX
        CLR TXAK
        SET RNIC
        ;--
        CLR SIMF        ;Clear SIM interrupt request flag

        MOV A,10111111B ;Enable I2C Time-out Countrol
        MOV I2CTOC,A              ;I2C time-out time is 64*32/32K = 62.5mSec

        SET SIME

	INIT_IIC_IO





        RET
IIC_INITIAL ENDP







;*******************************************************************
_IIC_SLAVE_TEST_V101:
        SZ  I2CTOF
        CALL    IIC_INITIAL
    ;=========================================================
        SZ  bUpDateOption
        JMP SAVE_OPTION
        SZ  bCheckSum_Error
        JMP _IIC_SLAVE_TEST_V101_INITIAL
        RET

    SAVE_OPTION:
        MOV A,_IIC_GlobalOption[(CMD_RW_OptionA-CMD_RW_Global)]
        MOV _GLOBE_VARIES[0],A
        MOV A,_IIC_GlobalOption[(CMD_RW_OptionB-CMD_RW_Global)]
        MOV _GLOBE_VARIES[1],A
        MOV A,_IIC_GlobalOption[(CMD_RW_OptionC-CMD_RW_Global)]
        MOV _GLOBE_VARIES[2],A
        ;MOV    A,IIC_KEY_AMOUNT
        MOV A,IIC_TH_LEN
        MOV _DATA_BUF[0],A

        MOV A,OFFSET    _GLOBE_VARIES[3]
        MOV MP0,A
        MOV A,OFFSET    _IIC_GlobalOption[(CMD_RW_K1_TH-CMD_RW_Global)]
        MOV MP1,A
        CLR BP
    $2:
        MOV A,IAR1
        MOV IAR0,A
        INC MP1
        INC MP0
        SDZ _DATA_BUF[0]
        JMP $2
        CLR bUpDateOption
        CALL    _LIBRARY_RESET
    ;=========================================================
        RET
;*******************************************************************


;*******************************************************************
_IIC_SLAVE_TEST_V101_INITIAL:
        CALL    IIC_INITIAL
    ;..........................................
        CALL    _GET_LIB_VER
        MOV IIC_LibVer[1],A
        MOV A,_DATA_BUF[0]
        MOV IIC_LibVer[0],A
        ;CALL   _GET_KEY_AMOUNT
        MOV A,IIC_TH_LEN
        ;MOV    IIC_KEY_AMOUNT,A
        MOV _DATA_BUF[0],A
    LOAD_OPTION:
        MOV A,_GLOBE_VARIES[0]
        MOV _IIC_GlobalOption[(CMD_RW_OptionA-CMD_RW_Global)],A
        MOV A,_GLOBE_VARIES[1]
        MOV _IIC_GlobalOption[(CMD_RW_OptionB-CMD_RW_Global)],A
        MOV A,_GLOBE_VARIES[2]
        MOV _IIC_GlobalOption[(CMD_RW_OptionC-CMD_RW_Global)],A

        MOV A,OFFSET    _GLOBE_VARIES[3]
        MOV MP0,A
        MOV A,OFFSET    _IIC_GlobalOption[(CMD_RW_K1_TH-CMD_RW_Global)]
        MOV MP1,A
        CLR BP
    $1:
        MOV A,IAR0
        MOV IAR1,A
        INC MP1
        INC MP0
        SDZ _DATA_BUF[0]
        JMP $1
        CLR bCheckSum_Error
        RET
;*******************************************************************












;;***********************************************************
;;*SUB. NAME:                                               *
;;*INPUT    :                                               *
;;*OUTPUT   :                                               *
;;*USED REG.:                                               *
;;*FUNCTION :                                               *
;;***********************************************************
                ;;*******************
SIM_INT:        ;;* SIM INT. ********
                ;;*******************
        CLR SIMF
        ;-PUSH DATA
        MOV SIM_STACK[0],A
        MOV A,STATUS
        MOV SIM_STACK[1],A

        ;-CHECK IF ADDRESS MATCH
        IF_AddrNotMatch_GOTO    IIC_CONTINUE_RW
        IF_WriteData_GOTO   FIRST_WRITE
        ;-FIRST READ (PREPARE DATA)
        Slave_Tx_Mode
        JMP IIC_CONTINUE_READ
    IIC_CONTINUE_RW:
        IF_Master_Read_GOTO IIC_MASTER_READ
        ;-MASTER WRITE
        MOV A,SIMD
        MOV IIC_DATA_IN,A
        SZ  bWrite1st
        JMP IIC_WRITE_ENTRY
        MOV IIC_DATA_INDEX,A    ;-GET 1ST BYTE (ADDRESS)
        SET bWrite1st
        JMP IIC_PRE_READ    ;PR-READ DATA
    FIRST_WRITE:
        CLR bWrite1st
        JMP SIM_RECEIVE_MODE
    IIC_MASTER_READ:
        IF_ACK_GOTO IIC_CONTINUE_READ
        ;NACK
    SIM_RECEIVE_MODE:
        Slave_Rx_Mode       ;receive mode (master write)
        SLAVE_SEND_ACK      ;enable transmits acknowledge
        DUMMY_READ
    _ENDIIC:
        MOV A,SIM_STACK[1]
        MOV STATUS,A
        MOV A,SIM_STACK[0]
        RETI
;*******************************************************************
IIC_CONTINUE_READ:
        MOV A,IIC_DATA_OUT
        MOV SIMD,A
        INC IIC_DATA_INDEX
        JMP IIC_PRE_READ
;*******************************************************************
message '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - '
