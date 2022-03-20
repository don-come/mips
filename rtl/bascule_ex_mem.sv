//====================================
//Filename      : Bascule Execution / memory
//Description   : Third Pipeline - execution to memory
//====================================

module bascule_ex_mem(
        input logic     clk,
        input logic     rst,

        input logic     [4:0] in_write_reg,
        input logic     [31:0] in_write_data,
        input logic     [31:0] in_alu_result,
        input logic     in_zero,
        input logic     [31:0] in_pc,
        input logic     [31:0] in_pc_jump,
        input logic     [27:0] in_jump_inst,
        input logic     in_branch,
        input logic     in_mem_read,
        input logic     in_mem_write,
        input logic     in_reg_write,
        input logic     in_mem_reg,
        input logic     in_jump,

        output logic    [4:0] out_write_reg,
        output logic    [31:0] out_write_data,
        output logic    [31:0] out_alu_result,
        output logic    out_zero,
        output logic    [31:0] out_pc,
        output logic    [31:0] out_pc_jump,
        output logic    [27:0] out_jump_inst,
        output logic    out_branch,
        output logic    out_mem_read,
        output logic    out_mem_write,
        output logic    out_reg_write,
        output logic    out_mem_reg,
        output logic    out_jump
) ;

//==Variable Declaration==============
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code=========================
always_ff @( posedge clk )
begin   
        if( rst == 1'b1 )
        begin 
                out_write_reg = 4'b0000 ;
                out_write_data = 32'h0 ;
                out_alu_result = 32'h0 ;
                out_zero = 1'b0 ;
                out_pc = 32'h0 ;
                out_pc_jump = 32'h0 ;
                out_jump_inst = 28'h0 ;
                out_branch = 1'b0 ;
                out_mem_read = 1'b0 ;
                out_mem_write = 1'b0 ;
                out_reg_write = 1'b0 ;
                out_mem_reg =1'b0 ;
                out_jump = 1'b0 ;
        end

        else 
        begin 
                out_write_reg = in_write_reg ;
                out_write_data = in_write_data ;
                out_alu_result = in_alu_result ;
                out_zero = in_zero ;
                out_pc = in_pc ;
                out_pc_jump = in_pc_jump ;
                out_jump_inst = in_jump_inst  ;
                out_branch = in_branch ;
                out_mem_read = in_mem_read ;
                out_mem_write = in_mem_write ;
                out_reg_write = in_reg_write ;
                out_mem_reg = in_mem_reg ;
                out_jump = in_jump ;

        end 
end

endmodule

