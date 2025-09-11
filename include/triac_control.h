/*
 * triac_control.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * TRIAC control lines and helpers for fan speed and swing.
 * Drives discrete TRIAC gate control pins on PORTD.
 */

#ifndef TRIAC_CONTROL_H
#define TRIAC_CONTROL_H

#include <xc.h>
#include <stdint.h>

/* TRIAC output pins */
#define TRIAC_PIN_SWING        PORTDbits.RD3
#define TRIAC_PIN_SPEED_HIGH   PORTDbits.RD2
#define TRIAC_PIN_SPEED_MEDIUM PORTDbits.RD1
#define TRIAC_PIN_SPEED_LOW    PORTDbits.RD0

/* Fan speed codes */
#define FAN_SPEED_OFF     0x0
#define FAN_SPEED_LOW     0xA
#define FAN_SPEED_MEDIUM  0xB
#define FAN_SPEED_HIGH    0xC

/* Swing mode codes */
#define FAN_SWING_OFF     0x0
#define FAN_SWING_ON      0x1

#ifndef TRUE
#define TRUE  1
#define FALSE 0
#endif

/* Configure TRIAC control pins */
void TRIAC_Config(void);

/* Set TRIAC outputs according to speed and swing state */
void Set_Triac(uint8_t Speed, uint8_t Swing);

#endif /* TRIAC_CONTROL_H */
