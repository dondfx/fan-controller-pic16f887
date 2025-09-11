/*
 * blink_swing.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of swing indicator blinking using a software post-scaler.
 */

#include "blink_swing.h"

/* Software post-scaler and blink enable flag */
volatile unsigned char timer0_post_scaler = 0;
unsigned char to_blink = 0;

void Handle_Blink(void) {
    if (to_blink) {
        if (timer0_post_scaler == UINT8_T_MAX) {
            LED_SWING ^= 1;          /* Toggle swing LED */
            timer0_post_scaler = 0;  /* Reset post-scaler */
        }
        timer0_post_scaler++;
    }
}
