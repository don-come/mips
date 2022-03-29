#Script to compile test Shift Register module

vlog +acc -work libs/LIB_ShiftReg rtl/shift_reg.sv 
vlog +acc -work libs/LIB_ShiftReg bench/tbench_shift_reg.sv
