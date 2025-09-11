/*
 * external_interrupt_conf.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * External interrupt configuration.
 * Configures INT on RB0 with weak pull-up and falling-edge trigger.
 */

#ifndef EXTERNAL_INTERRUPT_CONF_H
#define EXTERNAL_INTERRUPT_CONF_H

#include <xc.h>

/* Configure INT on RB0 and enable global interrupts */
void External_Interrupt_Configure(void);

#endif /* EXTERNAL_INTERRUPT_CONF_H */
