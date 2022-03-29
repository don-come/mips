//==================================
//Filename      : Test bench for Sign Extend Module
//Description   : Test if the 16bit -> 32 bits
//===================================

module tbench_sign_extend( ) ;

timeunit 1ns ;
timeprecision 100ps ;

//==Variable Declaration=============
logic   [15:0] in_sign ;

logic   [31:0] out_sign ;

//==Instanciate Sign Extend Module==
sign_extend SE1( .in_sign( in_sign ), .out_sign( out_sign ) ) ;

//==Monitor Result==================
initial 
        begin
                $timeformat( -9, 0, "ns", 3 ) ;
                $monitor( "%t - in_sign=%h", $time, in_sign ) ;
        end 

//==Verify Result===================
task xpects( input [31:0] expects ) ;
        if( out_sign != expects )
        begin 
                $display( "Results is : %h - should be : %h", out_sign, 
                        expects ) ;
                $display( "SIGN EXTEND TEST PASSED" ) ;
                $finish ;
        end 
endtask 

//==Apply stimulus===================
initial 
        begin 
                in_sign = 16'hFFFF ; #1ns xpects( 32'h0000FFFF ) ;
                in_sign = 16'h0 ; #1ns xpects( 32'h0 ) ;
                in_sign = 16'hF ; #1ns 
                $display( "out_sign : %b", out_sign ) ;

                $display( "Sign Extend PASSED" ) ;
                $finish( 0 ) ;
        end 
endmodule
