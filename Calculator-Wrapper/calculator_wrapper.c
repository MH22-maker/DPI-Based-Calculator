#include <stdio.h>
#include <stdlib.h>
#include "calculator.h"
#include "svdpi.h"


void calculator_wrapper (const svLogicVecVal* a, const svLogicVecVal* b, const svLogicVecVal* op_code, svLogicVecVal* result) {
    
    uint16_t a_val, b_val;
    uint8_t op_code_val;
    a_val = (uint16_t)(a->aval & 0xFFFF); // Extract lower 16 bits from the svlogicvecval structure defined in svdpi.h
    b_val = (uint16_t)(b->aval & 0xFFFF);
    op_code_val = (uint16_t)(op_code->aval & 0xFFFF);
    printf("C wrapper received a: %u, b: %u, op_code: %u\n", a_val, b_val, op_code_val);
    calculate (a_val, b_val, op_code_val, (uint16_t *)result);
    printf("C wrapper returning result: %u\n", (uint16_t)(*result).aval & 0xFFFF);
    return;

}