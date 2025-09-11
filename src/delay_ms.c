/*
 * delay_ms.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of millisecond delay utility.
 */

#include "delay_ms.h"

void delay_ms(uint16_t duration) {
    for (uint16_t i = 0; i < duration; i++) {
        __delay_ms(1);
    }
}
