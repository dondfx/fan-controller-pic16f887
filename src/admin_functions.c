/*
 * admin_functions.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of administrative functions for the fan controller.
 * Includes handling of IR inputs, speed control, swing, timers,
 * mode switching, LED indicators, and tone feedback.
 */

#include "admin_functions.h"

/* Global administrative variable instance */
admin_variable Admin_Variable;

/* Process IR signal input and dispatch to relevant handler */
void Process_Remote_Input(uint16_t IR_SIGNAL_ID) {
    switch (IR_SIGNAL_ID) {
        case SIGNAL_SWING:
            UART_Write_Text("SWING");
            Process_Input_Swing();
            if ((IR_SIGNAL_ID == SIGNAL_SWING) &&
                (Admin_Variable.Fan_Speed != FAN_SPEED_OFF)) {
                Make_Tone(TRUE);
            }
            break;

        case SIGNAL_MODE:
            UART_Write_Text("MODE");
            Process_Input_Mode();
            Make_Tone(TRUE);
            break;

        case SIGNAL_TIME:
            UART_Write_Text("TIME");
            if ((IR_SIGNAL_ID == SIGNAL_TIME) &&
                (Admin_Variable.Fan_Speed != FAN_SPEED_OFF)) {
                Process_Input_Timer();
                Make_Tone(TRUE);
            }
            break;

        case SIGNAL_ON:
            UART_Write_Text("ON");
            Process_Input_ON();
            Make_Tone(TRUE);
            break;

        case SIGNAL_OFF:
            UART_Write_Text("OFF");
            if ((IR_SIGNAL_ID == SIGNAL_OFF) &&
                (Admin_Variable.Fan_Speed != FAN_SPEED_OFF)) {
                Make_Tone(TRUE);
            }
            Process_Input_Off();
            break;

        default:
            UART_Write_Text("NULL");
            Make_Tone(FALSE);
            break;
    }
}

/* Cycle fan speed: OFF -> LOW -> MEDIUM -> HIGH -> LOW
 * Updates LEDs and TRIAC. */
void Process_Input_ON(void) {
    if (Admin_Variable.Fan_Speed == FAN_SPEED_OFF) {
        Admin_Variable.Fan_Speed = FAN_SPEED_LOW;
    }
    else if (Admin_Variable.Fan_Speed == FAN_SPEED_LOW) {
        Admin_Variable.Fan_Speed = FAN_SPEED_MEDIUM;
    }
    else if (Admin_Variable.Fan_Speed == FAN_SPEED_MEDIUM) {
        Admin_Variable.Fan_Speed = FAN_SPEED_HIGH;
    }
    else {
        Admin_Variable.Fan_Speed = FAN_SPEED_LOW;
    }

    LED_Speed(Admin_Variable.Fan_Speed);
    Set_Triac(Admin_Variable.Fan_Speed, Admin_Variable.Fan_Swing);
}

/* Initialize admin variable defaults */
void Initialize_Admin_Variable(void) {
    Admin_Variable.Fan_Mode  = FAN_MODE_LIGHT_PATTERN_OFF;
    Admin_Variable.Fan_Speed = FAN_SPEED_OFF;
    Admin_Variable.Fan_Swing = FAN_SWING_OFF;
    Admin_Variable.Fan_Timer = FAN_TIMER_OFF;
}

/* Update speed LEDs */
void LED_Speed(uint8_t Speed_Setting) {
    switch (Speed_Setting) {
        case FAN_SPEED_LOW:
            LED_SPEED_LOW    = 1;
            LED_SPEED_MEDIUM = 0;
            LED_SPEED_HIGH   = 0;
            break;

        case FAN_SPEED_MEDIUM:
            LED_SPEED_LOW    = 0;
            LED_SPEED_MEDIUM = 1;
            LED_SPEED_HIGH   = 0;
            break;

        case FAN_SPEED_HIGH:
            LED_SPEED_LOW    = 0;
            LED_SPEED_MEDIUM = 0;
            LED_SPEED_HIGH   = 1;
            break;

        default:
            break;
    }
}

/* Toggle swing ON or OFF. Updates LED_SWING and blink flag. */
void Process_Input_Swing(void) {
    if ((Admin_Variable.Fan_Swing == FAN_SWING_OFF) &&
        (Admin_Variable.Fan_Speed != FAN_SPEED_OFF)) {
        Admin_Variable.Fan_Swing = FAN_SWING_ON;
        to_blink = TRUE;
    }
    else {
        Admin_Variable.Fan_Swing = FAN_SWING_OFF;
        if (to_blink) {
            to_blink = FALSE;
            LED_SWING = 0;
        }
    }
    Set_Triac(Admin_Variable.Fan_Speed, Admin_Variable.Fan_Swing);
}

/* Handle MODE input (currently cycles speed, same as ON) */
void Process_Input_Mode(void) {
    Process_Input_ON();
}

/* Turn fan OFF: clear speed, timer, LEDs, and swing */
void Process_Input_Off(void) {
    Admin_Variable.Fan_Speed = FAN_SPEED_OFF;
    Admin_Variable.Fan_Timer = FAN_TIMER_OFF;

    LED_SPEED_LOW    = 0;
    LED_SPEED_MEDIUM = 0;
    LED_SPEED_HIGH   = 0;

    LED_TIMER_120_MIN = 0;
    LED_TIMER_60_MIN  = 0;
    LED_TIMER_30_MIN  = 0;

    Process_Input_Swing();
}

/* Generate tone feedback */
void Make_Tone(uint8_t sound) {
    if (sound) {
        Enable_PWM();
        __delay_ms(100);
        Disable_PWM();
        __delay_ms(400);
    }
    else {
        __delay_ms(100);
        __delay_ms(400);
    }
}

/* Update timer LEDs */
void LED_Time(uint8_t Time_Setting) {
    switch (Time_Setting) {
        case FAN_TIMER_OFF:
            LED_TIMER_30_MIN  = 0;
            LED_TIMER_60_MIN  = 0;
            LED_TIMER_120_MIN = 0;
            break;

        case FAN_TIMER_30_MIN:
            LED_TIMER_30_MIN  = 1;
            LED_TIMER_60_MIN  = 0;
            LED_TIMER_120_MIN = 0;
            break;

        case FAN_TIMER_60_MIN:
            LED_TIMER_30_MIN  = 0;
            LED_TIMER_60_MIN  = 1;
            LED_TIMER_120_MIN = 0;
            break;

        case FAN_TIMER_120_MIN:
            LED_TIMER_30_MIN  = 0;
            LED_TIMER_60_MIN  = 0;
            LED_TIMER_120_MIN = 1;
            break;

        default:
            break;
    }
}

/* Cycle timer setting: OFF -> 30 -> 60 -> 120 -> OFF
 * Arms or clears delay-off timer accordingly. */
void Process_Input_Timer(void) {
    if (Admin_Variable.Fan_Timer == FAN_TIMER_OFF) {
        Admin_Variable.Fan_Timer = FAN_TIMER_30_MIN;
        Turn_On_Delay_Timer(_30_MINUTES_OVERFLOWS, _30_MINUTES_REMAINDER);
    }
    else if (Admin_Variable.Fan_Timer == FAN_TIMER_30_MIN) {
        Admin_Variable.Fan_Timer = FAN_TIMER_60_MIN;
        Turn_On_Delay_Timer(_60_MINUTES_OVERFLOWS, _60_MINUTES_REMAINDER);
    }
    else if (Admin_Variable.Fan_Timer == FAN_TIMER_60_MIN) {
        Admin_Variable.Fan_Timer = FAN_TIMER_120_MIN;
        Turn_On_Delay_Timer(_120_MINUTES_OVERFLOWS, _120_MINUTES_REMAINDER);
    }
    else {
        Admin_Variable.Fan_Timer = FAN_TIMER_OFF;
        Turn_Off_Delay_Timer();
    }

    LED_Time(Admin_Variable.Fan_Timer);
}

/* Check delay-off flag and force OFF if timer expired */
void Delay_Off_Fan_Check(void) {
    if (Delay_Off_Kill_Fan) {
        Turn_Off_Delay_Timer();
        Process_Remote_Input(SIGNAL_OFF);
    }
}
