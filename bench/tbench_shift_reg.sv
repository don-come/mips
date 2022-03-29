//===================================
//Filename      : Test bench Shift Register 
//Description   : Test if the shift reg is good 
//===================================

module tbench_shift_reg( ) ;

timeunit 1ns ;
timeprecision 100ps ;

//==Variable Declaration============
logic   [31:0] in_shift ;
logic   [31:0] out_shift ;

//==Instanciate Module SHIFT REG===
shift_reg SR1( .in_shift( in_shift ), .out_shift( out_shift ) ) ;

//==Monitor Result===================
initial 
        begin 
                $timeformat( -9, 0, "ns", 3 ) ;
                $monitor( "%t - in_shif=%h", 
                        $time, in_shift ) ;
        end

//==Verify Results===================
task xpects( input [31:0] expects ) ;
        if( out_shift != expects )
        begin 
                $display( "Result is : %d - should be : %d",
                out_shift, expects ) ;
                $display( "SHIFT REG TEST FAILED" ) ;
                $finish ;
        end
endtask

//==Apply Stimulus===================
initial 
        begin 
                in_shift = 32'hF ; #1ns xpects( 32'h3C ) ;
                in_shift = 32'hFFFFFFFF ; #1ns xpects( 32'hFFFFFFFC ) ;
                in_shift = 32'hC ; #1ns $display( "out_shift = %b", out_shift ) ;

                $display( "SHIFT REG TEST PASSED" ) ;
                $finish( 0 ) ;
        end 
endmodule



