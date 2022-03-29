//======================================
//Filename      : Test Bench Sequential MIPS
//Description   : Test Bench for the entire sequential CPU
//======================================

module tbench_seq( ) ;

timeunit 10ns ;
timeprecision 100ps ;

//==Inputs==============================
logic   clk=1'b0 ;
logic   rst=1'b0 ;
logic   [31:0] in_pc ;
logic   start ;
//==Outputs==============================

//==Clock Definition=====================
`define PERIOD 10
always 
         #( `PERIOD/2 ) clk = ~clk ;

//==Instanciate Module===================
top_sequential TS1( 
        .clk( clk ),
        .rst( rst ),
        .start( start ),
        .address_start( in_pc )
) ;

//==Monitor Results======================
initial 
begin 
        $timeformat( -9, 0, "ns", 3 );
        $monitor( "%t", $time ) ;
end 

//==Apply Stimulus=======================
initial
begin 
        @( negedge clk ) ;
        rst = 1'b0 ; start = 1'b1 ; in_pc = 32'h0 ; @( negedge clk ) ;
        rst = 1'b0 ; start = 1'b0 ; in_pc = 32'h0 ; @( negedge clk ) ;
        rst = 1'b0 ; start = 1'b0 ; in_pc = 32'h0 ; @( negedge clk ) ;
        rst = 1'b0 ; start = 1'b0 ; in_pc = 32'h0 ; @( negedge clk ) ;
        rst = 1'b0 ; start = 1'b0 ; in_pc = 32'h0 ; @( negedge clk ) ;

        rst = 1'b0 ; start = 1'b0 ; in_pc = 32'hFFFFF ; @( negedge clk ) ;
        rst = 1'b0 ; start = 1'b0 ;in_pc = 32'h00 ; @( negedge clk ) ;
        rst = 1'b0 ; start = 1'b0 ;in_pc = 32'h00 ; @( negedge clk ) ;
        #20000ns ;

        $display( "TEST SEQUENTIAL DONE" ) ;
        $finish( 0 ) ;
end
endmodule
