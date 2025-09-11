/*
 * delay_off.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Delay-off timer for fan shutdown.
 * Implements a coarse timing mechanism using a 16-bit remainder counter
 * with an 8-bit overflow accumulator. When the configured target is
 * reached, sets Delay_Off_Kill_Fan for the application to act on.
 */

#ifndef DELAY_OFF_H
#define DELAY_OFF_H

#include <xc.h>
#include <stdint.h>
#include "ir_definitions.h"

#ifndef TRUE
#define TRUE  1
#define FALSE 0
#endif

#ifndef UINT16_T_MAX
#define UINT16_T_MAX 65535
#endif

/* 3277 microseconds are taken for one overflow of Timer0 with current settings */

/* 18309.4 counts are made for 1 minute */
#define _1_MINUTES_OVERFLOWS   0
#define _1_MINUTES_REMAINDER   18309

/* 91547.1 counts are made for 5 minutes
 * 1 Overflow + 26012 */
#define _5_MINUTES_OVERFLOWS   1
#define _5_MINUTES_REMAINDER   26012

/* 549282.8 counts are made for 30 minutes
 * 8 Overflows + 25003 */
#define _30_MINUTES_OVERFLOWS  8
#define _30_MINUTES_REMAINDER  25003

/* 1098565.7 counts for 60 minutes
 * 16 Overflows + 50006 */
#define _60_MINUTES_OVERFLOWS  16
#define _60_MINUTES_REMAINDER  50006

/* 2197131.5 counts for 120 minutes
 * 33 Overflows + 34477 */
#define _120_MINUTES_OVERFLOWS 33
#define _120_MINUTES_REMAINDER 34477

/* State variables (defined in delay_off.c) */
extern volatile uint8_t  Delay_Timer_On;
extern volatile uint8_t  integer_overflow_count;
extern volatile uint16_t remainder_count;

extern uint8_t  Delay_Off_Kill_Fan;
extern uint8_t  Required_Overflow;
extern uint16_t Required_Remainder;

/* Increment timing counters; call from periodic tick or ISR */
void Increment_Delay_Off_Timer(void);

/* Configure and start delay-off timer */
void Turn_On_Delay_Timer(uint8_t Re_Of, uint16_t Re_Re);

/* Stop and clear delay-off timer */
void Turn_Off_Delay_Timer(void);

#endif /* DELAY_OFF_H */
