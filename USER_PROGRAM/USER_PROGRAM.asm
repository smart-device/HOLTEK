; Uploaded by http://smart-device.ir

message '***************************************************************'
message '*PROJECT NAME :USER PROGRAM CODE                              *'
message '*     VERSION :                                               *'
message '*     IC BODY :                                               *'
message '* ICE VERSION :                                               *'
message '*      REMARK :                                               *'
message '***************************************************************'

                INCLUDE USER_PROGRAM.INC

                PUBLIC  _USER_PROGRAM_INITIAL
                PUBLIC  _USER_PROGRAM 


                ;========================
                ;=USER DATA DEFINE      =
                ;========================
USER_PROGRAM_DATA   .SECTION   'DATA'



                ;========================
                ;=USER PROGRAM          =
                ;========================
USER_PROGRAM_CODE   .SECTION   'CODE'
                           
;;***********************************************************                           
;;*SUB. NAME:USER INITIAL PROGRAM                           *                           
;;*INPUT    :                                               *                           
;;*OUTPUT   :                                               *                           
;;*USED REG.:                                               *                           
;;*FUNCTION :                                               *                           
;;***********************************************************                           
                      ;;************************
_USER_PROGRAM_INITIAL:;;* USER_PROGRAM_INITIAL *
                      ;;************************

               CLR     PAC
               CLR     PA
               CLR     PBC
               CLR     PB
               CLR  PCC
               CLR  PC
               CLR	PDC
               CLR	PD
              

                
                RET




;;***********************************************************                           
;;*SUB. NAME:USER_MAIN                                      *                           
;;*INPUT    :                                               *                           
;;*OUTPUT   :                                               *                           
;;*USED REG.:                                               *                           
;;*FUNCTION :                                               *                           
;;***********************************************************                           
                ;;********************
_USER_PROGRAM:  ;;USER PROGRAM ENTRY *
                ;;*******************
                
                





                SNZ     _SCAN_CYCLEF
                RET
                CLR     PAC.4
               ; SNZ     _ANY_KEY_PRESSF
               ; CLR     PA.4
               ; SZ      _ANY_KEY_PRESSF
               ; SET     PA.4
              
                CALL    _GET_KEY_BITMAP
                MOV     A,_DATA_BUF[0]
                OR      A,_DATA_BUF[1]
                SZ      Z
                CLR     PA.4
                SNZ     Z
                SET     PA.4
              ;  SZ      _DATA_BUF[0].0
              ;  SET     PA.1
              ;  SNZ     _DATA_BUF[0].0
              ;  CLR     PA.1

              ; ;-TEST
              ; CLR     PAC.3
              ; MOV     A,00001000B
              ; SZ      _SCAN_CYCLEF
              ; XORM    A,PA

                RET


                


