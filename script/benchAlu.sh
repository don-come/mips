#Script to compile test ALU module

vlog +acc -work libs/LIB_Alu rtl/alu.sv 
vlog +acc -work libs/LIB_Alu bench/tbench_alu.sv 

 
