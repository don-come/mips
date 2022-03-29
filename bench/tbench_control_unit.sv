//====================================
//Filename      : Test bench Control Unit
//Description   : Module for testing Control Unit
//====================================

module tbench_control_unit( ) ;

timeunit 1ns ;
timeprecision 100ps ;

//==Variable Declaration==============
//Inputs
logic   [5:0] op_instruction ;
//outputs
logic   reg_dst ;
logic   branch ;
logic   [1:0] alu_op ;
logic   mem_read ;
logic   mem_write ;
logic   mem_to_reg ;
logic   alu_src ;
logic   reg_write ;
logic   jump ;

//==Instanciate Module CONTROL UNIT===
control_unit CU1( .op_instruction( op_instruction ), .reg_dst( reg_dst ), .branch( branch ), 
                .alu_op( alu_op ), .mem_read( mem_read ), .mem_write( mem_write ), .mem_to_reg( mem_to_reg ), 
                .alu_src( alu_src ), .reg_write( reg_write ) , 
                .jump( jump ) ) ;

//==Monitor Result========================
initial 
        begin 
                $timeformat( -9, 0, "ns", 3 ) ;
                $monitor( "%t -op_inst=%b", 
                        $time, op_instruction ) ;
        end

//==Verify Results=======================
task xpects( input exp_reg_dst, input exp_branch,  input [1:0] exp_alu_op, input exp_mem_read, 
        input exp_mem_write, input exp_mem_to_reg, input exp_alu_src, input exp_reg_write ) ;
        if( reg_dst!=exp_reg_dst || branch!=exp_branch || alu_op!=exp_alu_op || mem_read!=exp_mem_read ||
                mem_write!=exp_mem_write || mem_to_reg!=exp_mem_to_reg || alu_src!=exp_alu_src || 
                reg_write != exp_reg_write )
        begin 
                $display( "reg_dst=%b / exp_reg_dst=%b -- branch=%b / exp_branch=%b-- alu_op=%b / exp_alu_op=%b -- mem_read=%b / exp_mem_read=%b -- mem_write=%b / exp_mem_write=%b - mem_to_reg=%b / exp_mem_to_reg=%b - alu_src=%b / exp_alu_src=%b - reg_write=%b /exp_reg_write=%b",
                reg_dst, exp_reg_dst, branch, exp_branch, alu_op, exp_alu_op, mem_read, exp_mem_read, mem_write, exp_mem_write, mem_to_reg, exp_mem_to_reg, alu_src, exp_alu_src, reg_write, exp_reg_write ) ;
                $display( "CONTROL UNIT TEST FAILED" ) ;
                $finish ;
        end
endtask

//==Apply Stimulus=======================
initial 
        begin
                op_instruction = 6'b000000 ; #1ns xpects( 1'b1, 1'b0, 2'b10, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1  ) ; //Case : R-Instruction 
                op_instruction = 6'b000100 ; #1ns xpects( 1'b0, 1'b1, 2'b10, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0  ) ; //Case : BEQ  
                op_instruction = 6'b100011 ; #1ns xpects( 1'b0, 1'b0, 2'b00, 1'b1, 1'b0, 1'b1, 1'b1, 1'b1  ) ; //Case : LW 
                op_instruction = 6'b101011 ; #1ns xpects( 1'b0, 1'b0, 2'b01, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0  ) ; //Case : SW 
                op_instruction = 6'b000010 ; #1ns ; //Case : JUMP 
                op_instruction = 6'b111111 ; #1ns xpects( 1'b0, 1'b0, 2'b11, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0  ) ; //Other 
                
                $display( "CONTROL UNIT TEST PASSED") ;
                $finish( 0 ) ;

        end 
endmodule

