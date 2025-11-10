#include "calculator.h"

void calculate(uint16_t a, uint16_t b, uint16_t op_code, uint16_t *result) {
    switch (op_code) {
        case 0: // Addition
            *result = a + b;
            break;
        case 1: // Subtraction
            *result = a - b;
            break;
        case 2: // Multiplication
            *result = a * b;
            break;
        case 3: // Division
            if (b != 0) {
                *result = a / b;
            } else {
                *result = 0; // Handle division by zero
            }
            break;
        default:
            *result = 0; // Invalid operation code
            break;
    }
}