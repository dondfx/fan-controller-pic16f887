/*
 * ir_definitions.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Definitions for IR remote control.
 * Includes fixed signal IDs, buffer lengths, and constants
 * for the IR decoder.
 */

#ifndef IR_DEFINITIONS_H
#define IR_DEFINITIONS_H

#include <stdlib.h>
#include <stdio.h>

/* Non-ambiguous type for boolean values */
typedef unsigned char _bool_;

/* Buffer and limits */
#define IR_BUFFER_LENGTH 24     /* Number of time durations in one 12-bit frame */
#define UINT16_T_MAX     65535  /* Maximum value of 16-bit integer */

/* IR signal codes (12-bit values for each button) */
#define SIGNAL_SWING  0x0D90    /* Swing button */
#define SIGNAL_TIME   0x0D88    /* Timer button */
#define SIGNAL_MODE   0x0D84    /* Mode button */
#define SIGNAL_ON     0x0D82    /* Power ON button */
#define SIGNAL_OFF    0x0D81    /* Power OFF button */

/* Decoder constants */
#define DECODER_ONE         1
#define DECODER_ZERO        0
#define ONE_BIT_SHIFT       1
#define DECODER_RETURN_NULL 0xFFFF  /* Returned when decoding fails */

#endif /* IR_DEFINITIONS_H */
