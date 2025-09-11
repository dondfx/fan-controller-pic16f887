/*
 * timer0_conf.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Timer0 configuration for periodic interrupts.
 * Used for blink handling and delay-off timer updates.
 */

#ifndef TIMER0_CONF_H
#define TIMER0_CONF_H

#include <xc.h>

/* Configure Timer0 in 8-bit mode with prescaler and enable interrupt */
void Timer0_Configure(void);

#endif /* TIMER0_CONF_H */
