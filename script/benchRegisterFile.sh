#Script to compile test Register File module

vlog +acc -work libs/LIB_RegisterFile rtl/register_file.sv
vlog +acc -work libs/LIB_RegisterFile bench/tbench_register_file.sv 

