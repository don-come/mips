//+=======================
//Filename      : Control Unit Hazard
//Description   : Module to control the case of an hazard for LOAD instruction
//========================

module  control_hazard_unit( 
        input logic     id_ex_mem_read,
        input logic     [4:0] id_ex_reg_rt,
        input logic     [4:0] if_id_reg_rs,
        input logic     [4:0] if_id_reg_rt,

        output logic    pc_write,
        output logic    if_id_write,
        output logic    sel_mux_cu
) ;

//==Variable Declaration====
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code===============
always_comb
        unique case( id_ex_mem_read )
        1'b1: 
        begin 
                if( id_ex_reg_rt == if_id_reg_rs )
                begin 
                        pc_write = 1'b1 ;
                        if_id_write = 1'b1 ;
                        sel_mux_cu = 1'b1 ;
                end 
                if( id_ex_reg_rt == if_id_reg_rt )
                begin 
                        pc_write = 1'b1 ;
                        if_id_write = 1'b1 ;
                        sel_mux_cu = 1'b1 ;
                end 
                else 
                begin
                        pc_write = 1'b0 ;
                        if_id_write = 1'b0 ;
                        sel_mux_cu = 1'b0 ;
                end 
        end 
        default: 
        begin 
                pc_write = 1'b0 ;
                if_id_write = 1'b0 ;
                sel_mux_cu = 1'b0 ;
        end 
endcase

endmodule


