#Script to compile test Sign Extend module

vlog +acc -work libs/LIB_SignExtend rtl/sign_extend.sv 
vlog +acc -work libs/LIB_SignExtend bench/tbench_sign_extend.sv 
