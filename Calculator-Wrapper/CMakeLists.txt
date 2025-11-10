cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(CALCULATOR LANGUAGES C)

# Set C standard to C11
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

# C sources
set(C_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/calculator.c          # C code for calculations
)

# Include directories for C code
set(C_INCLUDES
    ${CMAKE_CURRENT_SOURCE_DIR}  # Include header for C code
)

if (EXISTS "$ENV{VERILATOR_HOME}/include/vltstd/svdpi.h")
    set(VERILATOR true)
    list(APPEND C_INCLUDES
        $ENV{VERILATOR_HOME}/include/vltstd/  # C wrapper for Verilog
    )
    message(STATUS "Verilator detected.")
else()
    message(STATUS "Verilator not detected.")
endif()

if (VERILATOR)
    list(APPEND C_SOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/calculator_wrapper.c  # C wrapper for Verilog
    )
endif()

# Create the shared library for the C wrapper

add_library(calculator-wrapper SHARED ${C_SOURCES})

# Specify include directories for the library
target_include_directories(calculator-wrapper PRIVATE ${C_INCLUDES})