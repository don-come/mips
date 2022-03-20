//================================
//Filename      : Top module complete
//Description   : Top module to have memory and mips
//================================
//
module  top_sequential(
        input logic     clk ,
        input logic     rst ,
        input logic     start ,
        input logic     [31:0] address_start 
) ;

//==Variable Declaration=========
timeunit 1ns ;
timeprecision 100ps ;

logic   [31:0] instruction ;
logic   [31:0] address_data ;
logic   [31:0] address_inst ;
logic   mem_read ;
logic   mem_write ;
logic   [31:0] data_mem ;
logic   [31:0] data_receive ;

	
sequential S1( 
        .clk( clk ),
        .rst( rst ),
        .start( start ),
        .address_start( address_start ),
        .instruction( instruction ),
        .data_mem( data_mem ),

        .address_inst( address_inst ),
        .address_data( address_data ),
        .mem_write( mem_write ) ,
        .mem_read( mem_read ),
        .data_receive( data_receive ) 
) ;

memory M1( 
	.clk( clk ),
        .address_inst( address_inst ),
        .address_data( address_data ),
        .data_receive( data_receive ),
        .mem_write( mem_write ),
        .mem_read( mem_read ),
        .start( start ),

        .instruction( instruction ),
        .data_send( data_mem )
) ;

endmodule
