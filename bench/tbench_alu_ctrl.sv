//=================================
//Filename      : Alu Control Test bench 
//Description   : Module to test Alu Control bloc 
//=================================

module tbench_alu_ctrl( ) ;

timeunit 1ns ;
timeprecision 100ps ;

//==Variable Declaration===========
logic   [5:0] inst_alu ;
logic   [1:0] alu_op ;
logic   [2:0] alu_ctrl ;

//==Instanciate Module ALU==========
alu_ctrl AC1( .inst_alu( inst_alu ), .alu_op( alu_op ), .alu_ctrl( alu_ctrl ) ) ;

//==Monitor Result========================
initial 
        begin 
                $timeformat( -9, 0, "ns", 3 ) ;
                $monitor( "%t - inst_alu=%b - alu_op=%b", 
                        $time, inst_alu, alu_op ) ;
        end

//==Verify Results=========================
task xpects( input [2:0] expects ) ;
        if( alu_ctrl != expects )
        begin 
                $display( "alu_ctrl = %b - should be %b", alu_ctrl, expects ) ;
                $display( "ALU CTRL TEST FAILED" ) ;
                $finish ;
        end
endtask

//==Apply stimulus==========================
initial 
        begin
                //AND
                inst_alu = 6'b100100 ; alu_op = 2'b10 ; #1ns xpects( 3'b000 ) ;
                //OR
                inst_alu = 6'b100101 ; alu_op = 2'b10 ; #1ns xpects( 3'b001 ) ;
                //ADD 
                inst_alu = 6'b100000 ; alu_op = 2'b10 ; #1ns xpects( 3'b010 ) ;
                //SUB 
                inst_alu = 6'b100010 ; alu_op = 2'b10 ; #1ns xpects( 3'b011 ) ;
                //SLT 
                inst_alu = 6'b101010 ; alu_op = 2'b10 ; #1ns xpects( 3'b100 ) ;
                //NOR 
                inst_alu = 6'b100111 ; alu_op = 2'b10 ; #1ns xpects( 3'b101 ) ;

                //LW : need ADD
                inst_alu = 6'b110011 ; alu_op = 2'b00 ; #1ns xpects( 3'b010 ) ;
                //SW : Need ADD 
                inst_alu = 6'b010101 ; alu_op = 2'b01 ; #1ns xpects( 3'b010 ) ;

                $display( "ALU CTRL TEST PASSED" ) ;
                $finish ( 0 );
        end
endmodule

