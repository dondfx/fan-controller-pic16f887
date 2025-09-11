/*
 * blink_swing.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Swing indicator blink handler.
 * Toggling is time-based using a software post-scaler that is advanced
 * by the scheduler or a periodic ISR hook.
 */

#ifndef BLINK_SWING_H
#define BLINK_SWING_H

#include <xc.h>

/* Maximum value for the software post-scaler */
#ifndef UINT8_T_MAX
#define UINT8_T_MAX 255
#endif

/* Swing LED alias if not already defined elsewhere */
#ifndef LED_SWING
#define LED_SWING PORTAbits.RA1
#endif

/* Global flags and counters (defined in blink_swing.c) */
extern volatile unsigned char timer0_post_scaler;
extern unsigned char to_blink;

/* Call periodically to update the swing LED blink state */
void Handle_Blink(void);

#endif /* BLINK_SWING_H */
