#Script to compile test Adder module

vlog +acc -work libs/LIB_Adder rtl/adder.sv 
vlog +acc -work libs/LIB_Adder bench/tbench_adder.sv 
