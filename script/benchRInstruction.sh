#Script to compile test R instruction module

vlog +acc -work libs/LIB_RInstruction rtl/adder.sv
vlog +acc -work libs/LIB_RInstruction rtl/addr_inst.sv
vlog +acc -work libs/LIB_RInstruction rtl/alu_ctrl.sv
vlog +acc -work libs/LIB_RInstruction rtl/alu.sv
vlog +acc -work libs/LIB_RInstruction rtl/control_unit.sv
vlog +acc -work libs/LIB_RInstruction rtl/memory.sv
vlog +acc -work libs/LIB_RInstruction rtl/mux.sv
vlog +acc -work libs/LIB_RInstruction rtl/register_file.sv
vlog +acc -work libs/LIB_RInstruction rtl/shift_reg.sv
vlog +acc -work libs/LIB_RInstruction rtl/sign_extend.sv

vlog +acc -work libs/LIB_RInstruction bench/complete/tbench_r_inst.sv 
