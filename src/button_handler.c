/*
 * button_handler.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of push-button handling.
 * Uses IOCB interrupt flags to detect button presses,
 * applies debounce, and maps to the same processing
 * functions used for IR remote control.
 */

#include "button_handler.h"

/* Flags set on IOCB interrupt */
volatile uint8_t IOCB_BUTTON_ON_PRESSED    = 0;
volatile uint8_t IOCB_BUTTON_OFF_PRESSED   = 0;
volatile uint8_t IOCB_BUTTON_SWING_PRESSED = 0;

/* General-purpose counter for LED/debug use */
int led_delay = 0;

void Handle_Button_Press(void) {
    if (IOCB_BUTTON_ON_PRESSED || IOCB_BUTTON_OFF_PRESSED ||
        IOCB_BUTTON_SWING_PRESSED) {

        /* Simple debounce delay */
        __delay_ms(100);

        if (IOCB_BUTTON_ON_PRESSED && (!PORTB_BUTTON_ON_PIN)) {
            Process_Remote_Input(SIGNAL_ON);
        }
        if (IOCB_BUTTON_OFF_PRESSED && (!PORTB_BUTTON_OFF_PIN)) {
            Process_Remote_Input(SIGNAL_OFF);
        }
        if (IOCB_BUTTON_SWING_PRESSED && (!PORTB_BUTTON_SWING_PIN)) {
            Process_Remote_Input(SIGNAL_SWING);
        }

        /* Clear flags after handling */
        IOCB_BUTTON_ON_PRESSED    = 0;
        IOCB_BUTTON_OFF_PRESSED   = 0;
        IOCB_BUTTON_SWING_PRESSED = 0;
    }
}
