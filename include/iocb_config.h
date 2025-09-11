/*
 * iocb_config.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Interrupt-on-change (IOCB) configuration for PORTB.
 * Enables IOC on RB3, RB4, RB5 with weak pull-ups.
 */

#ifndef IOCB_CONFIG_H
#define IOCB_CONFIG_H

#include <xc.h>

/* Configure PORTB pins RB3, RB4, RB5 for interrupt-on-change */
void IOCB_Config(void);

#endif /* IOCB_CONFIG_H */
