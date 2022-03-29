#Script to compile test Draft draft module

vlog +acc -work libs/LIB_Seq rtl/addr_inst.sv
vlog +acc -work libs/LIB_Seq rtl/memory.sv
vlog +acc -work libs/LIB_Seq rtl/bascule_if_id.sv
vlog +acc -work libs/LIB_Seq rtl/control_unit.sv
vlog +acc -work libs/LIB_Seq rtl/register_file.sv
vlog +acc -work libs/LIB_Seq rtl/sign_extend.sv

vlog +acc -work libs/LIB_Seq rtl/control_hazard_unit.sv
vlog +acc -work libs/LIB_Seq rtl/mux_cu.sv

vlog +acc -work libs/LIB_Seq rtl/bascule_id_ex.sv
vlog +acc -work libs/LIB_Seq rtl/mux.sv
vlog +acc -work libs/LIB_Seq rtl/alu_ctrl.sv
vlog +acc -work libs/LIB_Seq rtl/shift_reg.sv
vlog +acc -work libs/LIB_Seq rtl/adder.sv
vlog +acc -work libs/LIB_Seq rtl/alu.sv
vlog +acc -work libs/LIB_Seq rtl/bascule_ex_mem.sv
vlog +acc -work libs/LIB_Seq rtl/bascule_mem_wb.sv
vlog +acc -work libs/LIB_Seq rtl/shift_reg_jump.sv
vlog +acc -work libs/LIB_Seq rtl/forward_unit.sv
vlog +acc -work libs/LIB_Seq rtl/mux_alu.sv
vlog +acc -work libs/LIB_Seq rtl/sequential.sv

vlog +acc -work libs/LIB_Seq rtl/top_sequential.sv

vlog +acc -work libs/LIB_Seq bench/tbench_seq.sv 
