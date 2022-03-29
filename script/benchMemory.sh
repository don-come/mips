#Script to compile test bench for Memory module

vlog +acc -work libs/LIB_Memory rtl/memory.sv
vlog +acc -work libs/LIB_Memory bench/tbench_memory.sv
