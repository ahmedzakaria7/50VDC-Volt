
_display:

;ADCODE.c,23 :: 		void display(){
;ADCODE.c,24 :: 		floattostr(volt,volttxt);
	MOVF       _volt+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       _volt+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       _volt+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       _volt+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _volttxt+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;ADCODE.c,25 :: 		lcd_out(1,1,"volt=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_ADCODE+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADCODE.c,26 :: 		lcd_out_cp(volttxt);
	MOVLW      _volttxt+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;ADCODE.c,27 :: 		lcd_chr_cp('V');
	MOVLW      86
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;ADCODE.c,28 :: 		}//void
L_end_display:
	RETURN
; end of _display

_measure_volt:

;ADCODE.c,29 :: 		void measure_volt(){
;ADCODE.c,30 :: 		x=adc_read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _x+0
	MOVF       R0+1, 0
	MOVWF      _x+1
;ADCODE.c,31 :: 		volt=x*0.049;
	CALL       _int2double+0
	MOVLW      57
	MOVWF      R4+0
	MOVLW      180
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      122
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _volt+0
	MOVF       R0+1, 0
	MOVWF      _volt+1
	MOVF       R0+2, 0
	MOVWF      _volt+2
	MOVF       R0+3, 0
	MOVWF      _volt+3
;ADCODE.c,32 :: 		display();
	CALL       _display+0
;ADCODE.c,33 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_measure_volt0:
	DECFSZ     R13+0, 1
	GOTO       L_measure_volt0
	DECFSZ     R12+0, 1
	GOTO       L_measure_volt0
	DECFSZ     R11+0, 1
	GOTO       L_measure_volt0
;ADCODE.c,34 :: 		}//void
L_end_measure_volt:
	RETURN
; end of _measure_volt

_main:

;ADCODE.c,38 :: 		void main(){
;ADCODE.c,42 :: 		lcd_init();
	CALL       _Lcd_Init+0
;ADCODE.c,43 :: 		adc_init();
	CALL       _ADC_Init+0
;ADCODE.c,44 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADCODE.c,46 :: 		while(1){
L_main1:
;ADCODE.c,47 :: 		measure_volt();
	CALL       _measure_volt+0
;ADCODE.c,49 :: 		}//while
	GOTO       L_main1
;ADCODE.c,50 :: 		}//main
L_end_main:
	GOTO       $+0
; end of _main
