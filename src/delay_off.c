/*
 * delay_off.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of delay-off timer for fan shutdown.
 */

#include "delay_off.h"

/* State variables */
volatile uint8_t  Delay_Timer_On = 0;
volatile uint8_t  integer_overflow_count = 0;
volatile uint16_t remainder_count = 0;

uint8_t  Delay_Off_Kill_Fan = FALSE;
uint8_t  Required_Overflow  = 0;
uint16_t Required_Remainder = 0;

void Increment_Delay_Off_Timer(void) {
    if (Delay_Timer_On) {
        remainder_count++;
        if (remainder_count == UINT16_T_MAX) {
            remainder_count = 0;
            integer_overflow_count++;
        }
        if ((integer_overflow_count == Required_Overflow) &&
            (remainder_count == Required_Remainder)) {
            Delay_Off_Kill_Fan = TRUE;

            remainder_count = 0;
            integer_overflow_count = 0;
        }
    }
}

void Turn_On_Delay_Timer(uint8_t Re_Of, uint16_t Re_Re) {
    remainder_count = 0;
    integer_overflow_count = 0;

    Required_Overflow  = Re_Of;
    Required_Remainder = Re_Re;

    Delay_Off_Kill_Fan = FALSE;
    Delay_Timer_On     = TRUE;
}

void Turn_Off_Delay_Timer(void) {
    remainder_count = 0;
    integer_overflow_count = 0;

    Delay_Timer_On     = FALSE;
    Delay_Off_Kill_Fan = FALSE;
}
