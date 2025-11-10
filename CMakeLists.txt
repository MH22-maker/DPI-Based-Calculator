cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(DPI-CALCULATOR LANGUAGES C)

# Set C standard to C11
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Check for Verilator installation and add its include path
if (EXISTS "$ENV{VERILATOR_HOME}/include/vltstd/svdpi.h")
    set(VERILATOR true)
    message(STATUS "Verilator: $ENV{VERILATOR_HOME}")
else()
    message(FATAL_ERROR "Verilator not detected. Please set the VERILATOR_HOME environment variable.")
endif()

if (VERILATOR)
    add_subdirectory(Calculator-Wrapper)
    
    set (SV_SOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/calculator.v
    )
    # Set Verilog testbench file
    set(TB_TOP ${CMAKE_CURRENT_SOURCE_DIR}/tb_top.v)
    
    # Define custom target to build simulation with Verilator
    add_custom_target(dpi_sim ALL
        DEPENDS calculator-wrapper
        COMMAND verilator --binary --build --trace --exe --CFLAGS "-g -O0" --LDFLAGS "-L${CMAKE_BINARY_DIR}/Calculator-Wrapper -lcalculator-wrapper -Wl,-rpath=${CMAKE_BINARY_DIR}/Calculator-Wrapper" ${SV_SOURCES} ${TB_TOP} --top-module tb_top
        COMMAND cp obj_dir/Vtb_top Vsimv
        BYPRODUCTS obj_dir Vsimv
    )

    # Ensure the C library is built before dpi_sim starts
    add_dependencies(dpi_sim calculator-wrapper)
endif()
