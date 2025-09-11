/*
 * triac_control.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of TRIAC control for fan speed and swing.
 */

#include "triac_control.h"

void TRIAC_Config(void) {
    /* Configure swing TRIAC pin */
    TRISDbits.TRISD3 = 0;
    TRIAC_PIN_SWING = 1;

    /* Configure speed TRIAC pins */
    TRISDbits.TRISD2 = 0;
    TRIAC_PIN_SPEED_HIGH = 1;

    TRISDbits.TRISD1 = 0;
    TRIAC_PIN_SPEED_MEDIUM = 1;

    TRISDbits.TRISD0 = 0;
    TRIAC_PIN_SPEED_LOW = 1;
}

void Set_Triac(uint8_t Speed, uint8_t Swing) {
    /* Swing output is active-low */
    TRIAC_PIN_SWING = (uint8_t)(~Swing);

    switch (Speed) {
        case FAN_SPEED_OFF:
            TRIAC_PIN_SPEED_LOW    = 1;
            TRIAC_PIN_SPEED_MEDIUM = 1;
            TRIAC_PIN_SPEED_HIGH   = 1;
            break;

        case FAN_SPEED_LOW:
            TRIAC_PIN_SPEED_LOW    = 0;
            TRIAC_PIN_SPEED_MEDIUM = 1;
            TRIAC_PIN_SPEED_HIGH   = 1;
            break;

        case FAN_SPEED_MEDIUM:
            TRIAC_PIN_SPEED_LOW    = 1;
            TRIAC_PIN_SPEED_MEDIUM = 0;
            TRIAC_PIN_SPEED_HIGH   = 1;
            break;

        case FAN_SPEED_HIGH:
            TRIAC_PIN_SPEED_LOW    = 1;
            TRIAC_PIN_SPEED_MEDIUM = 1;
            TRIAC_PIN_SPEED_HIGH   = 0;
            break;

        default:
            /* No change for other values */
            break;
    }
}
