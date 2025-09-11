/*
 * debug_support.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Debug utility functions.
 * Provides a short pulse on pin RD4 for timing/debug measurements.
 */

#ifndef DEBUG_SUPPORT_H
#define DEBUG_SUPPORT_H

#include <xc.h>

/* Generate a single pulse on RD4 (Fosc/4 duration) */
void pulse_it(void);

#endif /* DEBUG_SUPPORT_H */
