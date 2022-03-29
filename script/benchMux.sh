#Script to compile test MUX module

vlog +acc -work libs/LIB_Mux rtl/mux.sv 
vlog +acc -work libs/LIB_Mux bench/tbench_mux.sv 
