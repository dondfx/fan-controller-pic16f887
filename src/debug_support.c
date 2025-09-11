/*
 * debug_support.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of debug utility functions.
 */

#include "debug_support.h"

void pulse_it(void) {
    PORTDbits.RD4 = 0;
    PORTDbits.RD4 = 1;
}
