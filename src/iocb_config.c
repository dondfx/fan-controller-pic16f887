/*
 * iocb_config.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of IOCB configuration for PORTB.
 */

#include "iocb_config.h"

void IOCB_Config(void) {
    /* Disable analog inputs */
    ANSEL  = 0x00;
    ANSELH = 0x00;

    /* Configure RB5 as input and enable IOC */
    TRISBbits.TRISB5 = 1;
    IOCBbits.IOCB5   = 1;

    /* Configure RB4 as input and enable IOC */
    TRISBbits.TRISB4 = 1;
    IOCBbits.IOCB4   = 1;

    /* Configure RB3 as input and enable IOC */
    TRISBbits.TRISB3 = 1;
    IOCBbits.IOCB3   = 1;

    /* Clear IOC flag */
    INTCONbits.RBIF = 0;

    /* Enable PORTB weak pull-ups */
    OPTION_REGbits.nRBPU = 0;
    WPUBbits.WPUB3 = 1;
    WPUBbits.WPUB4 = 1;
    WPUBbits.WPUB5 = 1;

    /* Configure RD4 as output (general-purpose/debug) */
    TRISDbits.TRISD4 = 0;

    /* Enable IOCB interrupt and global interrupt */
    INTCONbits.RBIE = 1;
    INTCONbits.GIE  = 1;
}
