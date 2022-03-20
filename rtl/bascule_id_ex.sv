//==========================
//Filename      : Bascule Decrypt / execution
//Descrition    : Sequential element for 2nd pipeline
//==========================

module bascule_id_ex( 
        input logic     clk,
        input logic     rst,

        input logic     [31:0] in_read_1,
        input logic     [31:0] in_read_2,
        input logic     [31:0] in_sign_extend,
        input logic     [4:0] in_instruction_1,
        input logic     [4:0] in_instruction_2,
        input logic     [31:0] in_pc,
        input logic     [27:0] in_jump_inst,
        input logic     in_reg_dst,
        input logic     in_branch,
        input logic     [1:0] in_alu_op,
        input logic     in_mem_read,
        input logic     in_mem_write,
        input logic     in_mem_reg,
        input logic     in_alu_src,
        input logic     in_reg_write,
        input logic     in_jump,

        output logic    [31:0] out_read_1,
        output logic    [31:0] out_read_2,
        output logic    [31:0] out_sign_extend,
        output logic    [4:0] out_instruction_1,
        output logic    [4:0] out_instruction_2,
        output logic    [31:0] out_pc,
        output logic    [27:0] out_jump_inst, 
        output logic    out_reg_dst,
        output logic    out_branch,
        output logic    [1:0] out_alu_op,
        output logic    out_mem_read,
        output logic    out_mem_write,
        output logic    out_mem_reg,
        output logic    out_alu_src,
        output logic    out_reg_write,
        output logic    out_jump
) ;

//==Variable Declaration===
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code==============
always_ff @( posedge clk )
begin 
        if( rst == 1'b1 )
        begin 
               out_read_1 = 32'h0 ;
               out_read_2 = 32'h0 ;
               out_sign_extend = 32'h0 ;
               out_instruction_1 = 5'b0 ;
               out_instruction_2 = 5'b0 ;
               out_pc = 32'h0 ;
               out_jump_inst = 28'h0 ;
               out_reg_dst = 0 ;
               out_branch = 0 ;
               out_alu_op = 2'b00 ;
               out_mem_read = 0 ;
               out_mem_write = 0 ;
               out_mem_reg = 0 ;
               out_alu_src = 0 ;
               out_reg_write = 0 ;
               out_jump = 0 ;
        end
        else 
        begin 
               out_read_1 = in_read_1 ;
               out_read_2 = in_read_2 ;
               out_sign_extend = in_sign_extend ;
               out_instruction_1 = in_instruction_1 ;
               out_instruction_2 = in_instruction_2 ;
               out_pc = in_pc ;
               out_jump_inst = in_jump_inst ;
               out_reg_dst = in_reg_dst ;
               out_branch = in_branch ;
               out_alu_op = in_alu_op ;
               out_mem_read = in_mem_read ;
               out_mem_write = in_mem_write ;
               out_mem_reg = in_mem_reg ;
               out_alu_src = in_alu_src ;
               out_reg_write = in_reg_write ;
               out_jump = in_jump ;
        end
end
endmodule
