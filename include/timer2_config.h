/*
 * timer2_config.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Timer2 configuration.
 * Provides PWM time base for CCP2 and generates periodic interrupts.
 */

#ifndef TIMER2_CONFIG_H
#define TIMER2_CONFIG_H

#include <xc.h>

/* Configure and enable Timer2 with prescaler, PR2 period, and interrupt */
void Timer2_Config(void);

#endif /* TIMER2_CONFIG_H */
