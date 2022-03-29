#Script to compile test Extract inst module 

vlog +acc -work libs/LIB_Extract rtl/extract_entree.sv
vlog +acc -work libs/LIB_Extract rtl/extract_sortie.sv
vlog +acc -work libs/LIB_Extract rtl/memory.sv

vlog +acc -work libs/LIB_Extract bench/tbench_extract_inst.sv

