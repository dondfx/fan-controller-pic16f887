/*
 * pwm_config.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * PWM configuration and control for fan controller.
 * Uses CCP2 with Timer2 as time base.
 */

#ifndef PWM_CONFIG_H
#define PWM_CONFIG_H

#include <xc.h>
#include "timer2_config.h"

/* --- bool compatibility shim (XC8-safe) --- */
#if !defined(__cplusplus)
  /* If C99 isn't guaranteed, provide our own bool */
  #if !defined(__STDC_VERSION__) || (__STDC_VERSION__ < 199901L)
    typedef unsigned char bool;
    #ifndef true
      #define true  1
      #define false 0
    #endif
  #else
    #include <stdbool.h>
  #endif
#endif
/* ------------------------------------------ */

/* Optional legacy macros */
#ifndef TRUE
  #define TRUE  true
  #define FALSE false
#endif

#ifndef TRUE
#define TRUE  1
#define FALSE 0
#endif

/* Global flag indicates if PWM is currently enabled */
extern volatile bool is_pwm_set;

/* Configure PWM module */
void PWM_Config(void);

/* Request PWM to be enabled (handled in Timer2 ISR) */
void Enable_PWM(void);

/* Disable PWM output immediately */
void Disable_PWM(void);

#endif /* PWM_CONFIG_H */
