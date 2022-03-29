//=============================
//Filename      : Addres TestBench
//Description   : Test bench for the adder module
//==============================

module tbench_adder( ) ;

timeunit 1ns ;
timeprecision 100ps ;

//==Variable Declaration========
logic   [31:0] input_1 ;
logic   [31:0] input_2 ;

logic   [31:0] out_add ;

//==Instanciate Module ADDER===
adder A1( .in_add_1( input_1 ), .in_add_2( input_2 ), .out_add( out_add ) ) ;

//==Monitor Result==============
initial 
        begin 
                $timeformat( -9, 0, "ns", 3 ) ;
                $monitor( "%t - input_1=%d - input_2=%d", 
                        $time, input_1, input_2 ) ;
        end

//==Verify Results==============
task xpects( input [31:0] expects ) ;
        if( out_add != expects )
        begin 
                $display( "Result is : %d - should be : %d",
                out_add, expects ) ;
                $display( "ADDER TEST FAILED" ) ;
                $finish ;
        end
endtask

//==Apply Stimulus================
initial 
        begin 
                input_1 = 32'h4 ; input_2 = 32'h8 ; #1ns xpects( 32'd12 ) ;
                input_1 = 32'h8 ; input_2 = 32'h4 ; #1ns xpects( 32'd12 ) ;

                $display( "ADDER TEST PASSED" ) ;
                $finish( 0 ) ;
        end 
endmodule

