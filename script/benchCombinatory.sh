#Script to compile test Combinatory module

vlog +acc -work libs/LIB_Combinatory rtl/adder.sv
vlog +acc -work libs/LIB_Combinatory rtl/addr_inst.sv
vlog +acc -work libs/LIB_Combinatory rtl/alu_ctrl.sv
vlog +acc -work libs/LIB_Combinatory rtl/alu.sv
vlog +acc -work libs/LIB_Combinatory rtl/control_unit.sv
vlog +acc -work libs/LIB_Combinatory rtl/memory.sv
vlog +acc -work libs/LIB_Combinatory rtl/mux.sv
vlog +acc -work libs/LIB_Combinatory rtl/register_file.sv
vlog +acc -work libs/LIB_Combinatory rtl/shift_reg.sv
vlog +acc -work libs/LIB_Combinatory rtl/sign_extend.sv
vlog +acc -work libs/LIB_Combinatory rtl/comb.sv

vlog +acc -work libs/LIB_Combinatory bench/complete/tbench_comb.sv 
