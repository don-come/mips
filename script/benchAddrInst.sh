#Script to compile test Address instruction module

vlog +acc -work libs/LIB_AddrInst rtl/addr_inst.sv 
vlog +acc -work libs/LIB_AddrInst bench/tbench_addr_inst.sv 

