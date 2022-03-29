#Script to compile test Control Unit module

vlog +acc -work libs/LIB_ControlUnit rtl/control_unit.sv 
vlog +acc -work libs/LIB_ControlUnit bench/tbench_control_unit.sv 
