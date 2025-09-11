/*
 * ir_functions.c
 *
 * Created: 2020-06-29
 * Author: Lakmal Weerasinghe
 *
 * Implementation of IR decoding front-end.
 * Converts absolute stamps to relative intervals and classifies each pair
 * using adaptive windows derived from the first few edges.
 */

#include "ir_functions.h"
#include <stdio.h>   /* used in optional debug prints (#if 0) */

uint16_t IR_Handler(volatile uint16_t* IR_BUFFER, uint16_t* time_out) {
    /* Convert absolute time-stamps to relative intervals.
     * Handles 16-bit timer overflow between adjacent edges. */
    for (int i = (IR_BUFFER_LENGTH - 1); (i != 0); i--) {
        if (IR_BUFFER[i] > IR_BUFFER[i - 1]) {
            IR_BUFFER[i] = (IR_BUFFER[i] - IR_BUFFER[i - 1]);
        } else {
            /* Overflow case */
            IR_BUFFER[i] = (UINT16_T_MAX - IR_BUFFER[i - 1]) + IR_BUFFER[i];
        }
    }
    /* Print_Buffer(IR_BUFFER, IR_BUFFER_LENGTH); */

#if 1
    /* Determine timing windows from the first few ups and dips. */
    uint16_t One_Bit_Max = 0;
    One_Bit_Max = (One_Bit_Max < IR_BUFFER[1]) ? IR_BUFFER[1] : One_Bit_Max;
    One_Bit_Max = (One_Bit_Max < IR_BUFFER[3]) ? IR_BUFFER[3] : One_Bit_Max;
    One_Bit_Max = (One_Bit_Max < IR_BUFFER[7]) ? IR_BUFFER[7] : One_Bit_Max;
    One_Bit_Max = (One_Bit_Max < IR_BUFFER[9]) ? IR_BUFFER[9] : One_Bit_Max;

    uint16_t One_Bit_Min = 0xFFFF;
    One_Bit_Min = (One_Bit_Min > IR_BUFFER[1]) ? IR_BUFFER[1] : One_Bit_Min;
    One_Bit_Min = (One_Bit_Min > IR_BUFFER[3]) ? IR_BUFFER[3] : One_Bit_Min;
    One_Bit_Min = (One_Bit_Min > IR_BUFFER[7]) ? IR_BUFFER[7] : One_Bit_Min;
    One_Bit_Min = (One_Bit_Min > IR_BUFFER[9]) ? IR_BUFFER[9] : One_Bit_Min;

    uint16_t Zero_Bit_Max = 0;
    Zero_Bit_Max = (Zero_Bit_Max < IR_BUFFER[5]) ? IR_BUFFER[5] : Zero_Bit_Max;
    Zero_Bit_Max = (Zero_Bit_Max < IR_BUFFER[11]) ? IR_BUFFER[11] : Zero_Bit_Max;

    uint16_t Zero_Bit_Min = 0xFFFF;
    Zero_Bit_Min = (Zero_Bit_Min > IR_BUFFER[5]) ? IR_BUFFER[5] : Zero_Bit_Min;
    Zero_Bit_Min = (Zero_Bit_Min > IR_BUFFER[11]) ? IR_BUFFER[11] : Zero_Bit_Min;

    uint16_t Small_Sep_Max = 0;
    Small_Sep_Max = (Small_Sep_Max < IR_BUFFER[2]) ? IR_BUFFER[2] : Small_Sep_Max;
    Small_Sep_Max = (Small_Sep_Max < IR_BUFFER[4]) ? IR_BUFFER[4] : Small_Sep_Max;
    Small_Sep_Max = (Small_Sep_Max < IR_BUFFER[8]) ? IR_BUFFER[8] : Small_Sep_Max;
    Small_Sep_Max = (Small_Sep_Max < IR_BUFFER[10]) ? IR_BUFFER[10] : Small_Sep_Max;

    uint16_t Small_Sep_Min = 0xFFFF;
    Small_Sep_Min = (Small_Sep_Min > IR_BUFFER[2]) ? IR_BUFFER[2] : Small_Sep_Min;
    Small_Sep_Min = (Small_Sep_Min > IR_BUFFER[4]) ? IR_BUFFER[4] : Small_Sep_Min;
    Small_Sep_Min = (Small_Sep_Min > IR_BUFFER[8]) ? IR_BUFFER[8] : Small_Sep_Min;
    Small_Sep_Min = (Small_Sep_Min > IR_BUFFER[10]) ? IR_BUFFER[10] : Small_Sep_Min;

    uint16_t Large_Sep_Max = 0;
    Large_Sep_Max = (Large_Sep_Max < IR_BUFFER[6]) ? IR_BUFFER[6] : Large_Sep_Max;
    Large_Sep_Max = (Large_Sep_Max < IR_BUFFER[12]) ? IR_BUFFER[12] : Large_Sep_Max;

    uint16_t Large_Sep_Min = 0xFFFF;
    Large_Sep_Min = (Large_Sep_Min > IR_BUFFER[6]) ? IR_BUFFER[6] : Large_Sep_Min;
    Large_Sep_Min = (Large_Sep_Min > IR_BUFFER[12]) ? IR_BUFFER[12] : Large_Sep_Min;

    /* Add a margin to expand detection windows */
    uint16_t MARGIN = One_Bit_Max / (uint16_t)12;
    One_Bit_Max  = One_Bit_Max  + MARGIN;
    One_Bit_Min  = One_Bit_Min  - MARGIN;

    Zero_Bit_Max = Zero_Bit_Max + MARGIN;
    Zero_Bit_Min = Zero_Bit_Min - MARGIN;

    Small_Sep_Max = Small_Sep_Max + MARGIN;
    Small_Sep_Min = Small_Sep_Min - MARGIN;

    Large_Sep_Max = Large_Sep_Max + MARGIN;
    Large_Sep_Min = Large_Sep_Min - MARGIN;

    /* Idle timeout used to clear a stale frame */
    *time_out = (One_Bit_Max * 2 < UINT16_T_MAX) ? (uint16_t)(One_Bit_Max * 2) : (uint16_t)UINT16_T_MAX;
#endif

#if 0
    printf("\n%d\n", One_Bit_Max);
    printf("%d\n", One_Bit_Min);

    printf("\n%d\n", Zero_Bit_Max);
    printf("%d\n", Zero_Bit_Min);

    printf("\n%d\n", Small_Sep_Max);
    printf("%d\n", Small_Sep_Min);

    printf("\n%d\n", Large_Sep_Max);
    printf("%d\n", Large_Sep_Min);

    printf("\n%d\n\n", MARGIN);
#endif

    /* Classify intervals and build the return value. */
    uint16_t Return_Value = 0;
    for (int i = 1; i < (IR_BUFFER_LENGTH - 1); (i += 2)) {
        if (((One_Bit_Min <= IR_BUFFER[i]) && (IR_BUFFER[i] <= One_Bit_Max)) &&
            ((Small_Sep_Min <= IR_BUFFER[i + 1]) && (IR_BUFFER[i + 1] <= Small_Sep_Max))) {
            Return_Value = (Return_Value << ONE_BIT_SHIFT) | DECODER_ONE;
        }
        else if (((Zero_Bit_Min <= IR_BUFFER[i]) && (IR_BUFFER[i] <= Zero_Bit_Max)) &&
                 ((Large_Sep_Min <= IR_BUFFER[i + 1]) && (IR_BUFFER[i + 1] <= Large_Sep_Max))) {
            Return_Value = (Return_Value << ONE_BIT_SHIFT) | DECODER_ZERO;
        }
        else {
            Return_Value = DECODER_RETURN_NULL;
            break;
        }
    }

    if (Return_Value != DECODER_RETURN_NULL) {
        if ((One_Bit_Min <= IR_BUFFER[IR_BUFFER_LENGTH - 1]) &&
            (IR_BUFFER[IR_BUFFER_LENGTH - 1] <= One_Bit_Max)) {
            Return_Value = (Return_Value << ONE_BIT_SHIFT) | DECODER_ONE;
        }
        else if ((Zero_Bit_Min <= IR_BUFFER[IR_BUFFER_LENGTH - 1]) &&
                 (IR_BUFFER[IR_BUFFER_LENGTH - 1] <= Zero_Bit_Max)) {
            Return_Value = (Return_Value << ONE_BIT_SHIFT) | DECODER_ZERO;
        }
        else {
            Return_Value = DECODER_RETURN_NULL;
        }
    }

    return Return_Value;
}
