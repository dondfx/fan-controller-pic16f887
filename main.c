/*
 * main.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * PIC16F887 fan controller main module.
 * - Config bits
 * - Peripheral initialization
 * - Main loop
 * - Interrupt service routine
 */

// PIC16F887 Configuration Bit Settings

// CONFIG1
#pragma config FOSC = HS        // Oscillator Selection bits
#pragma config WDTE = OFF       // Watchdog Timer Enable bit
#pragma config PWRTE = OFF      // Power-up Timer Enable bit
#pragma config MCLRE = ON       // RE3/MCLR pin function select bit
#pragma config CP = OFF         // Code Protection bit
#pragma config CPD = OFF        // Data Code Protection bit
#pragma config BOREN = ON       // Brown Out Reset Selection bits
#pragma config IESO = ON        // Internal/External Switchover bit
#pragma config FCMEN = ON       // Fail-Safe Clock Monitor Enable bit
#pragma config LVP = OFF        // Low Voltage Programming Enable bit

// CONFIG2
#pragma config BOR4V = BOR40V   // Brown-out Reset Selection bit
#pragma config WRT = OFF        // Flash Program Memory Self Write Enable bits

#include <xc.h>

#include "uart_conf.h"
#include "uart_support.h"
#include "timer1_conf.h"
#include "decoder_buffer.h"
#include "debug_support.h"
#include "external_interrupt_conf.h"
#include "admin_functions.h"
#include "io_definitions.h"
#include "timer0_conf.h"
#include "blink_swing.h"
#include "pwm_config.h"
#include "button_handler.h"
#include "iocb_config.h"

/* Main entry */
void main(void) {
    Init_IO_Lines();
    UART_Configure();           /* Set serial port */
    Timer1_Configure();         /* Timer1 for IR decoding */
    External_Interrupt_Configure();
    Initialize_Admin_Variable();
    Timer0_Configure();
    PWM_Config();
    IOCB_Config();              /* IOC on RB3/RB4/RB5 */
    TRIAC_Config();

    /* Debug interface */
    TRISDbits.TRISD4 = 0;
    TRISCbits.TRISC1 = 1;

    while (1) {
        IR_WRAPPER();           /* Process IR remote input */
        Handle_Button_Press();  /* Local buttons */
        Delay_Off_Fan_Check();  /* Timer-based shutdown */
    }
}

/* Interrupt service routine */
void __interrupt() IR_Received(void) {
    if (INTCONbits.INTE && INTCONbits.INTF) { /* IR signal received */
        INT_TIME_STAMP = (uint16_t)((TMR1H << 8) | TMR1L); /* Time of interrupt */

        /* If buffer is not full, proceed with acquisition */
        if (!BUFFER_FULL) {
            RECORD_DATA();
        }

        OPTION_REGbits.INTEDG ^= 1;  /* Toggle edge for next read */
        PORTEbits.RE2 ^= 1;          /* Toggle LED */
        INTCONbits.INTF = 0;         /* Clear interrupt flag */
    }

    if (INTCONbits.RBIE && INTCONbits.RBIF) { /* Interrupt-on-change */
        IOCB_BUTTON_ON_PRESSED    = (!PORTB_BUTTON_ON_PIN);
        IOCB_BUTTON_OFF_PRESSED   = (!PORTB_BUTTON_OFF_PIN);
        IOCB_BUTTON_SWING_PRESSED = (!PORTB_BUTTON_SWING_PIN);

        INTCONbits.RBIF = 0;         /* Clear interrupt flag */
    }

    if (INTCONbits.TMR0IE && INTCONbits.TMR0IF) {
        Handle_Blink();
        Increment_Delay_Off_Timer();
        INTCONbits.TMR0IF = 0;
    }

    if (PIE1bits.TMR2IE && PIR1bits.TMR2IF) {
        PIR1bits.TMR2IF = 0;

        if (!is_pwm_set) {
            TRISCbits.TRISC1 = 0; /* Enable PWM output on Timer2 interrupt */
            is_pwm_set = TRUE;
        }
    }
}
