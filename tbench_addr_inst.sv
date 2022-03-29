//========================================
//Filename      : TestBench of addr_inst
//Description   : Bench of the addr_inst bloc. Test if the pc value change
//========================================

module tbench_addr_inst();

timeunit 1ns ;
timeprecision 100ps ;

logic [31:0] in_pc ; //input

logic [31:0] pc ; //output
logic [31:0] pc_next ;

//Instanciate addr_inst
addr_inst AI1 ( .in_pc( in_pc ), .pc( pc ), .pc_next( pc_next ) ) ;

//Monitor results
initial
        begin
                $timeformat( -9, 0, "ns", 3 ) ;
                $monitor( "%t in_pc=%h", $time, in_pc ) ;
        end
//Verify results
task xpects( input [31:0] expects , input [31:0] expects_2 ) ;
        if( pc != expects || pc_next!= expects_2 ) 
        begin 
                $display( "pc=%h - should be=%h -- pc_next=%h - should be=%h", pc, expects,
                        pc_next, expects_2 ) ;
                $display( "ADDRESS INSTRUCTION TEST FAILED" ) ;
                $finish ;
        end
endtask

//Apply stimulus
initial
        begin
                in_pc = 32'h4 ; #1ns xpects( 32'h4, 32'h8 ) ;
                in_pc=32'h4 ; #1ns xpects( 32'h4, 32'h8 ) ;

                $display( "ADDRESS INSTRUCTION TEST PASSED" );
                $finish( 0 );
        end
endmodule
