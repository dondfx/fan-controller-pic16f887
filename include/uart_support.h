/*
 * uart_support.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * UART helper functions.
 * - Single character transmit
 * - Text transmit
 * - Integer to text and transmit
 */

#ifndef UART_SUPPORT_H
#define UART_SUPPORT_H

#include <xc.h>

/* Transmit a single character (blocking until TX shift register is empty) */
void UART_Write(char data);

/* Transmit a null-terminated string */
void UART_Write_Text(char *text);

/* Convert unsigned int to decimal string (static buffer) */
char* int_to_char(unsigned int value);

/* Transmit an unsigned int as text */
void UART_Write_Int(unsigned int this_int);

#endif /* UART_SUPPORT_H */
