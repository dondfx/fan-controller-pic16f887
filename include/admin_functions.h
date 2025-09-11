/*
 * admin_functions.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Administrative functions for the remote-controlled fan.
 * Handles:
 *  - IR command processing
 *  - Fan speed control
 *  - Swing mode toggle
 *  - Timer management (30/60/120 minutes)
 *  - Mode switching
 *  - LED indicators
 *  - Tone feedback
 */

#ifndef ADMIN_FUNCTIONS_H
#define ADMIN_FUNCTIONS_H

#ifndef TRUE
#define TRUE 1
#define FALSE 0
#endif

#include <xc.h>
#include "ir_definitions.h"
#include "uart_support.h"
#include "delay_off.h"
#include "triac_control.h"
#include "io_definitions.h"
#include "blink_swing.h"
#include "decoder_buffer.h"
#include "pwm_config.h"

/* Fan timer states */
#define FAN_TIMER_OFF        0x0
#define FAN_TIMER_30_MIN     0xD
#define FAN_TIMER_60_MIN     0xE
#define FAN_TIMER_120_MIN    0xF

/* Fan mode light pattern states */
#define FAN_MODE_LIGHT_PATTERN_OFF  0x0
#define FAN_MODE_LIGHT_PATTERN_ON   0xA

/* System oscillator frequency for __delay_ms and __delay_us */
#define _XTAL_FREQ 20000000

/* Administrative variable structure */
typedef struct ADMIN_VARIABLE {
    _bool_  Fan_Swing;   /* ON or OFF */
    uint8_t Fan_Speed;   /* OFF, LOW, MEDIUM, HIGH */
    uint8_t Fan_Timer;   /* 0, 30, 60, 120 minutes */
    uint8_t Fan_Mode;    /* Mode pattern */
} admin_variable, *ptr_admin_variable;

/* Global instance defined in admin_functions.c */
extern admin_variable Admin_Variable;

/* Function prototypes */

/* Process IR signal input */
void Process_Remote_Input(uint16_t IR_SIGNAL_ID);

/* Update speed LEDs according to fan speed */
void LED_Speed(uint8_t Speed_Setting);

/* Generate tone feedback */
void Make_Tone(uint8_t sound);

/* Update timer LEDs according to selected timer */
void LED_Time(uint8_t Time_Setting);

/* Handle ON input: cycles through fan speeds */
void Process_Input_ON(void);

/* Initialize Admin_Variable with defaults */
void Initialize_Admin_Variable(void);

/* Handle SWING input: toggle swing mode */
void Process_Input_Swing(void);

/* Handle MODE input */
void Process_Input_Mode(void);

/* Handle OFF input: turn off fan and LEDs */
void Process_Input_Off(void);

/* Handle TIMER input: cycle through timer settings */
void Process_Input_Timer(void);

/* Check delay-off flag and turn fan off if expired */
void Delay_Off_Fan_Check(void);

#endif /* ADMIN_FUNCTIONS_H */
