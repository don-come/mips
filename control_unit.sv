//===============================
//Filename      : Control Unit
//Description   : Control Unit of the CPU 
//===============================

module control_unit( 
        input logic     [5:0] op_instruction , //The op code of the instruction
       
        output logic    reg_dst , //Case : rd is final
        output logic    branch , //Case of BEQ inst 
        output logic    [1:0] alu_op , //To ALU-CTRL 
        output logic    mem_read , //Read datas from memory 
        output logic    mem_write , //Write datas in memory
        output logic    mem_to_reg , //Write datas from memory to register file
        output logic    alu_src , //Case : Offset is the second operand
        output logic    reg_write , //Case : write in register file
        output logic    jump 
) ;

//==Variable Declaration==========
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code======================
always_comb 
        unique case( op_instruction ) 
                6'b000000: //Case : R-Instruction 
                        begin
                                reg_dst = 1'b1 ;
                                mem_read = 1'b0 ;
                                mem_write = 1'b0 ;
                                mem_to_reg = 1'b0 ;
                                alu_src = 1'b0 ;
                                reg_write = 1'b1 ;
                                alu_op = 2'b10 ;
                                branch = 1'b0 ;
                                jump = 1'b0 ;
                        end
                6'b000100: //Case : BEQ Inst
                        begin
                                reg_dst = 1'b0 ;
                                mem_read = 1'b0 ;
                                mem_write = 1'b0 ;
                                mem_to_reg = 1'b0 ;
                                alu_src = 1'b1 ;
                                reg_write = 1'b0 ;
                                alu_op = 2'b10 ;
                                branch = 1'b1 ;
                                jump = 1'b0 ;
                        end
                6'b100011: //Case : LW 
                        begin
                                reg_dst = 1'b0 ;
                                branch = 1'b0 ;
                                mem_read = 1'b1 ;
                                mem_write = 1'b0 ;
                                mem_to_reg = 1'b1 ;
                                alu_src = 1'b1 ;
                                reg_write = 1'b1 ;
                                alu_op = 2'b00 ;
                                jump = 1'b0 ;
                        end
                6'b101011: //Case : SW 
                        begin
                                reg_dst = 1'b0 ;
                                branch = 1'b0 ;
                                mem_read = 1'b0 ;
                                mem_write = 1'b1 ;
                                mem_to_reg = 1'b0 ;
                                alu_src = 1'b1 ;
                                reg_write = 1'b0 ;
                                alu_op = 2'b01 ;
                                jump = 1'b0 ;
                        end
                6'b000010: //Case JUMP
                        begin
                                reg_dst = 1'b0 ;
                                branch = 1'b0 ;
                                mem_read = 1'b0 ;
                                mem_write = 1'b0 ;
                                mem_to_reg = 1'b0 ;
                                alu_src = 1'b0 ;
                                reg_write = 1'b0 ;
                                alu_op = 2'b11 ;
                                jump = 1'b1 ;
                        end
                default:
                        begin
                                reg_dst = 1'b0 ;
                                branch = 1'b0 ;
                                mem_read = 1'b0 ;
                                mem_write = 1'b0 ;
                                mem_to_reg = 1'b0 ;
                                alu_src = 1'b0 ;
                                reg_write = 1'b0 ;
                                alu_op = 2'b11 ;
                                jump = 1'b0 ;
                        end
        endcase 
endmodule
