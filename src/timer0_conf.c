/*
 * timer0_conf.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of Timer0 configuration.
 */

#include "timer0_conf.h"

void Timer0_Configure(void) {
    OPTION_REGbits.T0CS = 0;   /* Clock source = Fosc/4 */
    OPTION_REGbits.PSA  = 0;   /* Prescaler assigned to Timer0 */
    OPTION_REGbits.PS   = 0b101; /* Prescaler 1:64 */

    INTCONbits.T0IF = 0;       /* Clear Timer0 interrupt flag */
    INTCONbits.T0IE = 1;       /* Enable Timer0 interrupt */
    INTCONbits.PEIE = 1;       /* Enable peripheral interrupts */
    INTCONbits.GIE  = 1;       /* Enable global interrupts */
}
