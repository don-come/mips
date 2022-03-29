#Script to compile test top comb module

vlog +acc -work libs/LIB_TopComb rtl/adder.sv
vlog +acc -work libs/LIB_TopComb rtl/addr_inst.sv
vlog +acc -work libs/LIB_TopComb rtl/alu_ctrl.sv
vlog +acc -work libs/LIB_TopComb rtl/alu.sv
vlog +acc -work libs/LIB_TopComb rtl/control_unit.sv
vlog +acc -work libs/LIB_TopComb rtl/memory.sv
vlog +acc -work libs/LIB_TopComb rtl/mux.sv
vlog +acc -work libs/LIB_TopComb rtl/register_use.sv
vlog +acc -work libs/LIB_TopComb rtl/initialize_register.sv
vlog +acc -work libs/LIB_TopComb rtl/register_file.sv
vlog +acc -work libs/LIB_TopComb rtl/shift_reg.sv
vlog +acc -work libs/LIB_TopComb rtl/sign_extend.sv
vlog +acc -work libs/LIB_TopComb rtl/bascule_to_write.sv
vlog +acc -work libs/LIB_TopComb rtl/shift_reg_jump.sv
vlog +acc -work libs/LIB_TopComb rtl/comb.sv
vlog +acc -work libs/LIB_TopComb rtl/top_comb.sv

vlog +acc -work libs/LIB_TopComb bench/complete/tbench_top_comb.sv
