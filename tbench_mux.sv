//==================================
//Filename      : Test module for MUX 
//Description   : Test the instruction of MUX
//==================================

module tbench_mux( ) ;

timeunit 1ns ;
timeprecision 100ps ;

//==Variable Declaration============
logic   [31:0] in_mux_1 ;
logic   [31:0] in_mux_2 ;
logic   [31:0] out_mux ;
logic   sel_mux ;

//==Instanciate MUX module===========
mux M1( .in_mux_1( in_mux_1 ), .in_mux_2( in_mux_2 ), .sel_mux( sel_mux ), .out_mux( out_mux ) ) ;

//==Monitor Result===================
initial 
        begin 
                $timeformat( -9, 0, "ns", 3 ) ;
                $monitor( "%t - in_mux_1=%h - in_mux_2=%h - sel_mux=%b", 
                        $time, in_mux_1, in_mux_2, sel_mux ) ;
        end

//==Verify Results===================
task xpects( input [31:0] expects ) ;
        if( out_mux != expects )
        begin 
                $display( "Result=%h - expects=%h",
                out_mux, expects ) ;
                $display( "MUX TEST FAILED" ) ;
                $finish ;
        end
endtask

//==Apply Stimulus===================
initial 
        begin 
                in_mux_1 = 32'hAABBCCDD ; in_mux_2 = 32'h11223344 ; sel_mux=1'b1 ; #1ns xpects( 32'hAABBCCDD ) ;
                in_mux_1 = 32'hAABBCCDD ; in_mux_2 = 32'h11223344 ; sel_mux=1'b0 ; #1ns xpects( 32'h11223344 ) ;

                $display( "MUX TEST PASSED" ) ;
                $finish( 0 ) ;
        end 
endmodule


