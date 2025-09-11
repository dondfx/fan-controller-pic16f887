/*
 * external_interrupt_conf.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of external interrupt configuration.
 */

#include "external_interrupt_conf.h"

void External_Interrupt_Configure(void) {
    VRCON = 0x00;          /* Disable VREF module */
    ANSEL = 0x00;          /* Disable analog on PORTA/PORTB low */
    ANSELH = 0x00;         /* Disable analog on PORTB high */

    TRISBbits.TRISB0 = 1;  /* RB0 as input for external interrupt */

    INTCONbits.INTF = 0;   /* Clear external interrupt flag */
    OPTION_REGbits.nRBPU = 0; /* Enable PORTB weak pull-ups */
    WPUBbits.WPUB0 = 1;    /* Enable pull-up on RB0 */

    OPTION_REGbits.INTEDG = 0; /* Interrupt on falling edge */

    TRISDbits.TRISD3 = 0;  /* RD3 as output (debug or general purpose) */

    INTCONbits.INTE = 1;   /* Enable external interrupt */
    INTCONbits.GIE  = 1;   /* Enable global interrupts */
}
