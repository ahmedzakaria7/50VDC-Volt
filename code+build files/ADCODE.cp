#line 1 "D:/my data/50vdc voltemeter/ADCODE.c"
 sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;





int x=0;
float volt=0;
char volttxt[16];

 void display(){
 floattostr(volt,volttxt);
 lcd_out(1,1,"volt=");
 lcd_out_cp(volttxt);
 lcd_chr_cp('V');
 }
 void measure_volt(){
 x=adc_read(0);
 volt=x*0.049;
 display();
 delay_ms(400);
 }



void main(){



 lcd_init();
 adc_init();
 lcd_cmd(_lcd_cursor_off);

while(1){
measure_volt();

}
}
