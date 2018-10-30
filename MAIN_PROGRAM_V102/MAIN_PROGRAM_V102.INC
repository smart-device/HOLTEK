; Uploaded by http://smart-device.ir
; ========================================================================================================================
; * Created by: Holtek Touch Key Workshop, Version 3.0.2.6
; MAIN_PROGRAM_V101.inc
; 05:48:27 PM Friday, October 24, 2014
; =========================================================================================================;;***********************************
;;***** MAIN_PROGRAM INCLUDE FILE   *
;;***********************************
;=-------------------------------
;=INCLUDE LIBRARY               -
;=EXTERNAL REFERENCE FILE       -
;=-------------------------------
INCLUDE "..\TKS_GLOBE_VARIES.INC"
INCLUDE "MAIN_PROGRAM_20141229.MCU"

        ;-FUNCTION DEFINE               ;-FUNCTION NAME
INCLUDE "..\BS86C16A_LIBV413\BS86C16A_LIBV413.AEX"
#DEFINE EXTEND_FUNCTION_1A_INITIAL      _BS86C16A_LIBV413_INITIAL
#DEFINE EXTEND_FUNCTION_1A              _BS86C16A_LIBV413

;--
;INCLUDE "..\IIC_SLAVE_TEST_V101\IIC_SLAVE_TEST_V101.AEX"
;#DEFINE EXTEND_FUNCTION_1B_INITIAL      _IIC_SLAVE_TEST_V101_INITIAL
;#DEFINE EXTEND_FUNCTION_1B              _IIC_SLAVE_TEST_V101

;--
INCLUDE "..\USER_PROGRAM\USER_PROGRAM.AEX"
#DEFINE EXTEND_FUNCTION_1D_INITIAL      _USER_PROGRAM_INITIAL
#DEFINE EXTEND_FUNCTION_1D              _USER_PROGRAM
