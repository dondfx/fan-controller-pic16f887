/*
 * decoder_buffer.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * IR decoder acquisition buffer and front-end wrapper.
 * Captures edge time-stamps from Timer1 into a primary buffer and
 * invokes the IR handler to decode button IDs.
 */

#ifndef DECODER_BUFFER_H
#define DECODER_BUFFER_H

#include <xc.h>
#include <stdint.h>

#include "ir_functions.h"
#include "admin_functions.h"

#ifndef BUFFER_LENGTH
#define BUFFER_LENGTH   24
#endif

#ifndef UINT16_T_MAX
#define UINT16_T_MAX    65535
#endif

#ifndef TRUE
#define TRUE    1
#define FALSE   0
#endif

/*
 * The TSOP1838 IR receiver provides an active-low PWM output at 38 kHz carrier.
 * The remote outputs a 12-bit code. Each bit is represented by two durations,
 * resulting in 24 time durations for one frame. The buffer stores absolute
 * Timer1 time-stamps at each interrupt.
 */

/* Primary acquisition buffer and status flag (defined in decoder_buffer.c) */
extern volatile uint16_t IR_BUFFER[BUFFER_LENGTH];
extern volatile uint8_t BUFFER_FULL;

/* Decoding context variables (defined in decoder_buffer.c) */
extern uint8_t  IR_DATA_FRAME;      /* Index into IR_BUFFER */
extern uint16_t IR_SIGNAL_ID;       /* Decoded button code */
extern uint16_t INT_TIME_STAMP;     /* Last interrupt time-stamp (Timer1) */
extern uint16_t DECODER_TIME_OUT;   /* Silence window to clear buffer-full */
extern _bool_   rerun_wrapper;      /* Front-end reentry control */

/* Record a time-stamp into IR_BUFFER. Call on each IR edge interrupt. */
void RECORD_DATA(void);

/* Front-end wrapper: run decoder and dispatch to application. Call often. */
void IR_WRAPPER(void);

#endif /* DECODER_BUFFER_H */
