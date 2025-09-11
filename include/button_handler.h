/*
 * button_handler.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Local push-button handler for the fan controller.
 * Handles ON, OFF, and SWING buttons on PORTB.
 * Buttons are edge-detected using IOCB (interrupt-on-change).
 */

#ifndef BUTTON_HANDLER_H
#define BUTTON_HANDLER_H

#include <xc.h>
#include "iocb_config.h"
#include "admin_functions.h"
#include "ir_definitions.h"

#define PORTB_BUTTON_ON_PIN     PORTBbits.RB5
#define PORTB_BUTTON_OFF_PIN    PORTBbits.RB4
#define PORTB_BUTTON_SWING_PIN  PORTBbits.RB3

#define _XTAL_FREQ 20000000

/* Flags set by IOCB ISR (defined in button_handler.c) */
extern volatile uint8_t IOCB_BUTTON_ON_PRESSED;
extern volatile uint8_t IOCB_BUTTON_OFF_PRESSED;
extern volatile uint8_t IOCB_BUTTON_SWING_PRESSED;

/* Debug/delay variable (defined in button_handler.c) */
extern int led_delay;

/* Handle button press events and trigger actions */
void Handle_Button_Press(void);

#endif /* BUTTON_HANDLER_H */
