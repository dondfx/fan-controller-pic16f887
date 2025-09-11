/*
 * uart_conf.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of UART configuration.
 */

#include "uart_conf.h"

void UART_Configure(void) {
    BAUDCTLbits.SCKP  = 0;  /* Non-inverted TX */
    BAUDCTLbits.BRG16 = 1;  /* 16-bit baud generator */

    INTCONbits.GIE  = 1;    /* Global interrupts */
    INTCONbits.PEIE = 1;    /* Peripheral interrupts */

    PIE1bits.TMR2IE = 1;    /* Timer2-to-PR2 interrupt (used elsewhere) */

    RCSTAbits.SPEN = 1;     /* Enable serial port (configures RX/TX pins) */

    /* Baud rate: SPBRGH:SPBRG with BRGH=1, BRG16=1 */
    SPBRGH = 0x00;
    SPBRG  = 34;

    TXSTAbits.TX9  = 0;     /* 8-bit transmission */
    TXSTAbits.SYNC = 0;     /* Asynchronous mode */
    TXSTAbits.BRGH = 1;     /* High speed baud rate */

    TXSTAbits.TXEN = 1;     /* Enable transmitter */
}
