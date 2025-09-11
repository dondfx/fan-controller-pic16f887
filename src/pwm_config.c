/*
 * pwm_config.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of PWM configuration and control.
 */

#include "pwm_config.h"

/* PWM state flag */
volatile bool is_pwm_set = FALSE;

void PWM_Config(void) {
    /*
     * Disable PWM before configuration by setting CCP2 pin as input.
     */
    TRISCbits.TRISC1 = 1;

    /*
     * Configure CCP2 in PWM mode.
     */
    CCP2CONbits.CCP2M = 0b1111;  /* PWM mode */

    /*
     * Duty cycle ratio
     * 
     * Duty Cycle Ratio = (CCPR2L : CCP2CON<DC2B1:DC2B0>)
     *                    / (4 * (PR2 + 1))
     */
    CCPR2L = 64;                 /* Initial duty cycle */
    CCP2CONbits.DC2B0 = 0;
    CCP2CONbits.DC2B1 = 0;

    /*
     * Configure Timer2 as the PWM time base.
     */
    Timer2_Config();
}

void Enable_PWM(void) {
    /*
     * PWM is actually enabled during Timer2 interrupt.
     * This flag indicates request to enable.
     */
    is_pwm_set = FALSE;
}

void Disable_PWM(void) {
    is_pwm_set = TRUE;
    TRISCbits.TRISC1 = 1;  /* Disable PWM output */
}
