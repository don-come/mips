//=======================================
//Filename      : Test Bench for memory module
//Description   : Test the memory manager
//=======================================

module tbench_memory ();

timeunit 1ns ;
timeprecision 100ps ;
logic clk ;
logic start ;

logic   [31:0] address_inst ;
logic   [31:0] instruction ;
logic [31:0] address_data ; 
logic [31:0] data_receive ;
logic mem_write ;
logic mem_read ;
logic [31:0] data_send ;

//instanciate memory 
memory MEM ( .clk( clk ),
        .start( start ),
        .address_inst( address_inst ) ,
        .address_data( address_data ), 
        .data_receive( data_receive ), 
        .mem_write( mem_write ), 
        .mem_read( mem_read ),
        .instruction( instruction ) ,
        .data_send( data_send ) ) ;
//Monitor results
initial
        begin
                $timeformat( -9, 0, "ns", 3 ) ;
                $monitor( "%t address=%h data_receive=%h" , $time, address_data, data_receive ) ;
        end

//Verify results
task xpects( input [31:0] expects ) ;
        if( data_send != expects ) 
        begin 
                $display( "data_send is : %h ; it should be : %h", data_send, expects ) ;
                $display( "TEST FAILED" ) ;
                $finish ;
        end
endtask

//Apply stimulus 
initial
        begin
                //Sending datas to memory at differents addresses
                address_data = 32'h0 ; mem_write = 1'b1 ; mem_read = 1'b0 ; data_receive = 32'hAAAAAAAA ; #1ns ;
                address_data = 32'h4 ; mem_write = 1'b1 ; mem_read = 1'b0 ; data_receive = 32'hBBBBBBBB ; #1ns ;
                address_data = 32'h8 ; mem_write = 1'b1 ; mem_read = 1'b0 ; data_receive = 32'hCCCCCCCC ; #1ns ;
                address_data = 32'hC ; mem_write = 1'b1 ; mem_read = 1'b0 ; data_receive = 32'hDDDDDDDD ; #1ns ;
                address_data = 32'h10 ; mem_write = 1'b1 ; mem_read = 1'b0 ; data_receive = 32'hEEEEEEEE ; #1ns ;
                address_data = 32'h18 ; mem_write = 1'b1 ; mem_read = 1'b0 ; data_receive = 32'hFFFFFFFF ; #1ns ;
                address_data = 32'h1C ; mem_write = 1'b1 ; mem_read = 1'b0 ; data_receive = 32'hAABBAABB ; #1ns ;
                address_data = 32'h20 ; mem_write = 1'b1 ; mem_read = 1'b0 ; data_receive = 32'hCCDDCCDD ; #1ns ;
                address_data = 32'h24 ; mem_write = 1'b1 ; mem_read = 1'b0 ; data_receive = 32'hEEFFEEFF ; #1ns ;
                address_data = 32'h28 ; mem_write = 1'b1 ; mem_read = 1'b0 ; data_receive = 32'hABCDABCD ; #1ns ;
                 
                //Test the value in memory 
                address_data = 32'h0 ; mem_write = 1'b0 ; mem_read = 1'b1 ; data_receive = 32'hAAAAAAAA ; #1ns xpects( 32'hAAAAAAAA ) ;
                address_data = 32'h4 ; mem_write = 1'b0 ; mem_read = 1'b1 ; data_receive = 32'hBBBBBBBB ; #1ns xpects( 32'hBBBBBBBB ) ;
                address_data = 32'h8 ; mem_write = 1'b0 ; mem_read = 1'b1 ; data_receive = 32'hCCCCCCCC ; #1ns xpects( 32'hCCCCCCCC ) ;
                address_data = 32'hC ; mem_write = 1'b0 ; mem_read = 1'b1 ; data_receive = 32'hDDDDDDDD ; #1ns xpects( 32'hDDDDDDDD ) ;
                address_data = 32'h10 ; mem_write = 1'b0 ; mem_read = 1'b1 ; data_receive = 32'hEEEEEEEE ; #1ns xpects( 32'hEEEEEEEE ) ;
                address_data = 32'h18 ; mem_write = 1'b0 ; mem_read = 1'b1 ; data_receive = 32'hFFFFFFFF ; #1ns xpects( 32'hFFFFFFFF ) ;
                address_data = 32'h1C ; mem_write = 1'b0 ; mem_read = 1'b1 ; data_receive = 32'hAABBAABB ; #1ns xpects( 32'hAABBAABB ) ;
                address_data = 32'h20 ; mem_write = 1'b0 ; mem_read = 1'b1 ; data_receive = 32'hCCDDCCDD ; #1ns xpects( 32'hCCDDCCDD ) ;
                address_data = 32'h24 ; mem_write = 1'b0 ; mem_read = 1'b1 ; data_receive = 32'hEEFFEEFF ; #1ns xpects( 32'hEEFFEEFF ) ;
                address_data = 32'h28 ; mem_write = 1'b0 ; mem_read = 1'b1 ; data_receive = 32'hABCDABCD ; #1ns xpects( 32'hABCDABCD ) ;
                address_inst = 32'h0 ; #1ns ;
                address_inst = 32'h4 ;#1ns
                $display( "MEMORY TEST PASSED" );
                $finish( 0 );
        end 
endmodule
                
