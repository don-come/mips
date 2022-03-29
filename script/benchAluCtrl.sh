#Script to compile test Alu control module

vlog +acc -work libs/LIB_AluCtrl rtl/alu_ctrl.sv 
vlog +acc -work libs/LIB_AluCtrl bench/tbench_alu_ctrl.sv 
