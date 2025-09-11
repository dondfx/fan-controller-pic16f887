/*
 * timer1_conf.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Timer1 configuration.
 * Used for IR remote decoding timestamp acquisition.
 */

#ifndef TIMER1_CONF_H
#define TIMER1_CONF_H

#include <xc.h>

/* Configure Timer1 for free-running mode, no interrupt */
void Timer1_Configure(void);

#endif /* TIMER1_CONF_H */
