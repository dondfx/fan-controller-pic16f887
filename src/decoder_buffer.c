/*
 * decoder_buffer.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of IR acquisition buffer and front-end wrapper.
 * Records Timer1 time-stamps per interrupt and invokes IR_Handler to decode.
 */

#include "decoder_buffer.h"

/* Primary buffer and status */
volatile uint16_t IR_BUFFER[BUFFER_LENGTH] = {0};
volatile uint8_t  BUFFER_FULL = FALSE;

/* Decoding context */
uint8_t  IR_DATA_FRAME = 0xFF;
uint16_t IR_SIGNAL_ID  = DECODER_RETURN_NULL;
uint16_t INT_TIME_STAMP = 0;
uint16_t DECODER_TIME_OUT = 0;
_bool_   rerun_wrapper = TRUE;

void RECORD_DATA(void) {
    switch (IR_DATA_FRAME) {
        case 0xFF:
            /*
             * Start of acquisition.
             * Reset Timer1, wait until it rolls to zero, store first stamp,
             * then advance frame index.
             */
            TMR1L = 0;
            TMR1H = 0;
            while (TMR1L || TMR1H) {
                /* wait for Timer1 to settle at zero */
            }
            IR_DATA_FRAME = 0;
            IR_BUFFER[IR_DATA_FRAME++] = (uint16_t)((TMR1H << 8) | TMR1L);
            break;

        default:
            /*
             * Append current Timer1 value to buffer.
             * When frame index reaches BUFFER_LENGTH, mark buffer full.
             */
            IR_BUFFER[IR_DATA_FRAME++] = (uint16_t)((TMR1H << 8) | TMR1L);
            BUFFER_FULL = (IR_DATA_FRAME == BUFFER_LENGTH);
            break;
    }
}

void IR_WRAPPER(void) {
    if (BUFFER_FULL) {
        if (rerun_wrapper) {
            /*
             * Decode the recorded frame. IR_Handler expects the array of
             * absolute time-stamps and returns the decoded signal id while
             * also reporting an idle timeout via DECODER_TIME_OUT.
             */
            IR_SIGNAL_ID = IR_Handler(IR_BUFFER, &DECODER_TIME_OUT);

            /*
             * Reset frame for next acquisition and dispatch to application.
             */
            IR_DATA_FRAME = 0xFF;
            Process_Remote_Input(IR_SIGNAL_ID);
            rerun_wrapper = FALSE;
        }

        /*
         * Clear BUFFER_FULL after a period of inactivity (no interrupts) that
         * exceeds DECODER_TIME_OUT, avoiding mid-frame reentry.
         * Handles Timer1 overflow explicitly.
         */
        if ((uint32_t)INT_TIME_STAMP + (uint32_t)DECODER_TIME_OUT > (uint32_t)UINT16_T_MAX) {
            /* Normalize when timeout window crosses 16-bit boundary */
            INT_TIME_STAMP = (uint16_t)(UINT16_T_MAX - INT_TIME_STAMP);
        }
        else if ( (uint16_t)(((uint16_t)((TMR1H << 8) | TMR1L)) - INT_TIME_STAMP) > DECODER_TIME_OUT ) {
            BUFFER_FULL   = FALSE;
            rerun_wrapper = TRUE;
        }
    }
}
