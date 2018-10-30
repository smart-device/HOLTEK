
;;******************************************
;;****TKS GLOBE VARIES DEFINE FOR ASM CODE *
;;******************************************
;-DEFINE LIBRARY VERSION
#DEFINE _V413_
;-SELECT IC BODY & INCLUDE REFERENCE FILE
#DEFINE _BS86C16A_
;-INCLUDE SYSTEM REFERENCE FILE
INCLUDE BS86C16A-3.INC


;------------------------
;-DEFINE SYSTEM CLOCK   -
;------------------------
#define SystemClock             2       ;0=8MHZ
                                        ;1=12MHZ
                                        ;2=16MHZ


;--------------------------------
;-TOUCH KEY LIBRARY VARIES DEFINE
;--------------------------------
;-numeric operate ; range 0 ~ 15;
#define DebounceTimes           0

;-numeric operate ; range 0 ~ 15; function: Time period to calibrate
#define AutoCalibrationPeriod   7       ;auto calibration period select 0=80ms .....15=1280ms

;-bit operate                   ; function: Sensitive double up
#define HighSensitive           0       ;0=Normal ; 1=High Sensitive

;-numeric operate ; range 0 ~ 15; function: key holding time ,if time out will reset key status to non-press
#define MaximumKeyHoldTime      15      ;0=disable ; 1=4 secend ...... 15=60secend

;-bit operate ; range 0/1       ; function: Fasting internal singal filter speed led key response faster
#define FastResponse            0       ;0=Normal ; 1=Fast Response

;-bit operate ; range 0/1       ; function: enalbe hardware hopping function
#define AutoFrequencyHopping    1       ;0=disable ; 1=enable

;-bit operate ; range 0/1       ; function: only one or all key active at the same time
#define OneKeyActive            0       ;0=all key active ; 1=one key active

;-bit operate ; range 0/1       ; function: Low power consumption
#define PowerSave               0     ;0=disable ; 1=power save mode

;-bit operate ; range 0/1       ; function: Noise interfere protect to prevent false trigger
#define NoiseProtect            0       ;0=disable ; 1=enable

;-bit operate ; range 0/1       ; function: moving calibration signal whatever key press or not
#define MovingCalibration       1       ;0=calibrate when key non press  ; 1=enable calibration whatever key press or not



;-Key threshold define
#define Key1Threshold           16     ;suggestion range 10 ~ 64
#define Key2Threshold           16
#define Key3Threshold           16
#define Key4Threshold           16
;--
#define Key5Threshold           16
#define Key6Threshold           16
#define Key7Threshold           16
#define Key8Threshold           16
;--
#define Key9Threshold           16
#define Key10Threshold          16
#define Key11Threshold          16
#define Key12Threshold          16
;--
#define Key13Threshold          16
#define Key14Threshold          16
#define Key15Threshold          16
#define Key16Threshold          16



;---------------------------------
;-DEFINE PIN AS I/O OR TOUCH INPUT
;---------------------------------
#define IO_TOUCH_ATTR           00000000000000001111111111111111B;0=IO ; 1=TOUCH INPUT
                           ;KEY 3   ~   2 ~ 2 ~ 1 ~ 1 ~ 0 ~ 0 ~0 ;KEY32~KEY1
                           ;    2       4   0   6   2   8   4  1


;-----------------------------------------
;-conbine above varies in GlobeOptionA/B/C
;-----------------------------------------
#define GlobeOptionA            (AutoCalibrationPeriod<<4)|DebounceTimes
#define GlobeOptionB            (MaximumKeyHoldTime<<4)|HighSensitive
#define GlobeOptionC            (MovingCalibration<<7)|(PowerSave<<6)|(OneKeyActive<<5)|(NoiseProtect<<4)|(AutoFrequencyHopping<<3)|(FastResponse<<2)




