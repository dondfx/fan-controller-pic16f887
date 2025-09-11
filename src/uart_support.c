/*
 * uart_support.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of UART helper functions.
 */

#include "uart_support.h"

void UART_Write(char data) {
    while (!TXSTAbits.TRMT) {
        /* wait for previous transmission to complete */
    }
    TXREG = data;  /* initiate new transmission */
}

void UART_Write_Text(char *text) {
    unsigned int i = 0;

    /* Send until null terminator */
    for (i = 0; text[i] != '\0'; i++) {
        UART_Write(text[i]);
    }
}

void UART_Write_Int(unsigned int this_int) {
    char* charArr = int_to_char(this_int);  /* convert to ASCII */
    UART_Write_Text(charArr);
}

char* int_to_char(unsigned int value) {
    static char buffer[6];         /* 0..65535 -> up to 5 digits + null */
    int c = (int)sizeof(buffer) - 1;

    /* preset buffer with '0's */
    for (int i = 0; i < (int)sizeof(buffer); i++) {
        buffer[i] = '0';
    }
    buffer[5] = '\0';

    /* build number from least significant digit */
    do {
        buffer[--c] = (char)((value % 10U) + '0');
        value /= 10U;
    } while (value != 0U);

    return &buffer[c];
}
