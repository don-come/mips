//========================================
//filename      : Test bench for ALU module 
//Description   : Test if all alu operation are made
//========================================

module tbench_alu( );

timeunit 1ns ;
timeprecision 100ps ;

//==Variable Declaration==================
logic   [31:0] input_1 ;
logic   [31:0] input_2 ;
logic   [2:0] alu_ctrl ;

logic   zero ;
logic   [31:0] result ;

//==Instanciate Module ALU================
alu A1( .in_alu_1( input_1 ), .in_alu_2( input_2 ), .alu_ctrl( alu_ctrl ),
        .zero( zero ), .alu_result( result ) ) ;

//==Monitor Result========================
initial 
        begin 
                $timeformat( -9, 0, "ns", 3 ) ;
                $monitor( "%t - input_1=%d - input_2=%d - alu_ctrl=%b", 
                        $time, input_1, input_2, alu_ctrl ) ;
        end
//==Verify Results=========================
task xpects( input [31:0] expects, input expects_2 ) ;
        if( result != expects || zero != expects_2 )
        begin 
                $display( "result is : %d ; should be : %d -- zero is : %b ; should be : %b",
                result, expects, zero, expects_2 ) ;
                $display( "ALU TEST FAILED" ) ;
                $finish ;
        end
endtask

//==Apply Stimulus========================
initial 
        begin
                //AND
                input_1 = 32'h5 ; input_2 = 32'h7 ; alu_ctrl = 3'b000 ; #1ns xpects( 32'h5, 0 ) ;
                //OR
                input_1 = 32'hC ; input_2 = 32'h4 ; alu_ctrl = 3'b001 ; #1ns xpects( 32'hC, 0 ) ;
                //ADD
                input_1 = 32'hE ; input_2 = 32'h19 ; alu_ctrl = 3'b010 ; #1ns xpects( 32'h27, 0 ) ;
                //SUB
                input_1 = 32'hF ; input_2 = 32'h4 ; alu_ctrl = 3'b011 ; #1ns xpects( 32'hB, 0 ) ;
                input_1 = 32'h8 ; input_2 = 32'hA ; alu_ctrl = 3'b011 ; #1ns xpects( 32'hFFFFFFFE, 0 ) ;
                //BEQ
                input_1 = 32'h4 ; input_2 = 32'h5 ; alu_ctrl = 3'b100 ; #1ns xpects( 32'h0, 0 ) ;
                input_1 = 32'h5 ; input_2 = 32'h5 ; alu_ctrl = 3'b100 ; #1ns xpects( 32'h0, 1 ) ;
                //NOR 
                input_1 = 32'h5 ; input_2 = 32'h4 ; alu_ctrl = 3'b101 ; #1ns xpects( 32'hFFFFFFFA, 0 ) ;
               
                $display( "ALU TES PASSED" ) ;
                $finish( 0 ) ;
        end 
endmodule
