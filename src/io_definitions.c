/*
 * io_definitions.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of I/O initialization.
 */

#include "io_definitions.h"

void Init_IO_Lines(void) {
    /* Disable analog functionality */
    ANSEL  = 0x00;
    ANSELH = 0x00;

    /* Configure PORT E LEDs as output */
    TRISEbits.TRISE0 = 0;
    TRISEbits.TRISE1 = 0;
    TRISEbits.TRISE2 = 0;

    /* Configure PORT A LEDs as output */
    TRISAbits.TRISA0 = 0;
    TRISAbits.TRISA1 = 0;
    TRISAbits.TRISA3 = 0;
    TRISAbits.TRISA4 = 0;
    TRISAbits.TRISA5 = 0;

    /* Clear all LEDs on startup */
    LED_SWING        = 0;
    LED_MODE         = 0;

    LED_TIMER_30_MIN  = 0;
    LED_TIMER_60_MIN  = 0;
    LED_TIMER_120_MIN = 0;

    LED_SPEED_LOW     = 0;
    LED_SPEED_MEDIUM  = 0;
    LED_SPEED_HIGH    = 0;
}
