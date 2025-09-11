/*
 * timer2_config.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of Timer2 configuration.
 * Used as time base for PWM (CCP2) and for periodic interrupts.
 */

#include "timer2_config.h"

void Timer2_Config(void) {
    T2CONbits.T2CKPS = 0b11;  /* Prescaler = 16 */
    PR2 = 0xFF;               /* Period register: sets PWM frequency */
    T2CONbits.TMR2ON = 1;     /* Enable Timer2 */

    PIR1bits.TMR2IF = 1;      /* Clear Timer2 interrupt flag */
    PIE1bits.TMR2IE = 1;      /* Enable Timer2 interrupt */

    INTCONbits.PEIE = 1;      /* Enable peripheral interrupts */
    INTCONbits.GIE  = 1;      /* Enable global interrupts */
}
