//==========================
//Filename      : MUX after Control Unit
//Description   : Detect if there is an hazard -> stall
//==========================

module  mux_cu(
        input logic     reg_dst,
        input logic     branch,
        input logic     [1:0] alu_op,
        input logic     mem_read,
        input logic     mem_write,
        input logic     mem_to_reg,
        input logic     alu_src,
        input logic     reg_write,
        input logic     jump,

        input logic     sel_mux_cu,

        output logic    out_reg_dst , //Case : rd is final
        output logic    out_branch , //Case of BEQ inst 
        output logic    [1:0] out_alu_op , //To ALU-CTRL 
        output logic    out_mem_read , //Read datas from memory 
        output logic    out_mem_write , //Write datas in memory
        output logic    out_mem_to_reg , //Write datas from memory to register file
        output logic    out_alu_src , //Case : Offset is the second operand
        output logic    out_reg_write , //Case : write in register file
        output logic    out_jump 


) ;

//==Variable Declaration=======
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code==================
always_comb 
        unique case( sel_mux_cu )
        1'b1: 
        begin
                out_reg_dst = 1'b0 ;
                out_branch = 1'b0 ;
                out_alu_op = 2'b11 ;
                out_mem_read = 1'b0 ;
                out_mem_write = 1'b0 ;
                out_mem_to_reg = 1'b0 ;
                out_alu_src = 1'b0 ;
                out_reg_write = 1'b0 ;
                out_jump = 1'b0 ;
        end 
        1'b0: 
        begin
                out_reg_dst = reg_dst ;
                out_branch = branch ;
                out_alu_op = alu_op ;
                out_mem_read = mem_read ;
                out_mem_write = mem_write ;
                out_mem_to_reg = mem_to_reg ;
                out_alu_src = alu_src ;
                out_reg_write = reg_write ;
                out_jump = jump ;
        end 
endcase 

endmodule

