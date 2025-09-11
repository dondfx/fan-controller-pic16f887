/*
 * delay_ms.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Millisecond delay utility wrapper.
 * Provides a blocking delay in millisecond resolution.
 */

#ifndef DELAY_MS_H
#define DELAY_MS_H

#include <xc.h>
#include <stdint.h>

/* System oscillator frequency for __delay_ms */
#define _XTAL_FREQ 20000000

/* Blocking delay function (duration in ms) */
void delay_ms(uint16_t duration);

#endif /* DELAY_MS_H */
