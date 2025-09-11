/*
 * ir_functions.h
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * IR decoding front-end.
 * Converts absolute Timer1 time-stamps to intervals and classifies
 * each bit to produce a 12-bit button ID.
 */

#ifndef IR_FUNCTIONS_H
#define IR_FUNCTIONS_H

#include <stdint.h>
#include "ir_definitions.h"

/* Decode IR frame.
 * IR_BUFFER: pointer to buffer of absolute time-stamps (length IR_BUFFER_LENGTH).
 * time_out:  output; idle timeout threshold derived from observed "one" width.
 * Returns decoded 12-bit code or DECODER_RETURN_NULL on failure. */
uint16_t IR_Handler(volatile uint16_t* IR_BUFFER, uint16_t *time_out);

#endif /* IR_FUNCTIONS_H */
