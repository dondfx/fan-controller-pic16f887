/*
 * uart_conf.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * UART configuration for PIC16F887.
 * Sets up EUSART in asynchronous mode and enables TX.
 */

#ifndef UART_CONF_H
#define UART_CONF_H

#include <xc.h>

/* Configure UART (EUSART) and enable transmission */
void UART_Configure(void);

#endif /* UART_CONF_H */
