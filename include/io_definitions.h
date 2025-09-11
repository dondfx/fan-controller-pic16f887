/*
 * io_definitions.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * I/O line definitions and initialization for LEDs and indicators.
 */

#ifndef IO_DEFINITIONS_H
#define IO_DEFINITIONS_H

#include <xc.h>

/* LED aliases */
#define LED_SWING        PORTAbits.RA1
#define LED_MODE         PORTEbits.RE2

#define LED_TIMER_60_MIN  PORTEbits.RE0
#define LED_TIMER_120_MIN PORTEbits.RE1
#define LED_TIMER_30_MIN  PORTAbits.RA0

#define LED_SPEED_LOW     PORTAbits.RA4
#define LED_SPEED_MEDIUM  PORTAbits.RA3
#define LED_SPEED_HIGH    PORTAbits.RA5

/* Configure I/O lines and set default LED states */
void Init_IO_Lines(void);

#endif /* IO_DEFINITIONS_H */
