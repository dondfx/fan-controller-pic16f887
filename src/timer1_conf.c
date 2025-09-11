/*
 * timer1_conf.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of Timer1 configuration.
 * Provides free-running 16-bit timer for IR decoding.
 */

#include "timer1_conf.h"

void Timer1_Configure(void) {
    T1CONbits.TMR1CS = 0;    /* Timer mode: clock source = Fosc/4 */
    PIR1bits.TMR1IF = 0;     /* Clear Timer1 interrupt flag */
    TMR1L = 0;               /* Clear Timer1 registers */
    TMR1H = 0;
    T1CONbits.T1CKPS = 0b00; /* Prescaler 1:1 (minimum) */
    T1CONbits.TMR1ON = 1;    /* Enable Timer1 */

    PIE1bits.TMR1IE = 0;     /* Disable Timer1 interrupt */
    INTCONbits.PEIE = 1;     /* Enable peripheral interrupts (global setting) */
    INTCONbits.GIE  = 1;     /* Enable global interrupts */
}
