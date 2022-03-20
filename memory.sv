//========================================
//Filename      : Memory Tab
//Description   : Memory Tab (size 10 slots, address multiple 4)
//========================================

module memory (
	input logic 	clk,
        input logic     [31:0] address_inst , //address where act in memory 
        input logic     [31:0] address_data ,
        input logic     [31:0] data_receive , //data receive from CPU 
        input logic     mem_write , //If 1 : write at mem[address] = data_receive 
        input logic     mem_read , //if 1 : read data_send=mem[address]
        input logic     start ,

        output logic    [31:0] instruction ,
        output logic    [31:0] data_send    //data send to CPU 
) ;

//==Variables Declaration===============
timeunit 1ns ;
timeprecision 100ps ;
logic [31:0] memory [128:0] ;
//==Main Code===========================

always_comb
begin  
        if( start == 1'b1 )
                $readmemh( "$PWD/rtl/memory.dat", memory ) ;
end
        
always @( address_data, mem_write, mem_read, data_receive )
        
        begin
                unique case( mem_write )
                1'b1 : //Write datas in memory 
                begin 
                        if( mem_read == 1'b1 )
                        begin 
                                memory[ address_data>>2 ] = data_receive ;
                                data_send = memory[ address_data>>2 ] ;
                        end 
                        else 
                        begin 
                                memory[ address_data>>2 ] = data_receive ;
                                data_send = 32'b0 ;
                        end 
                end 
                1'b0 : 
                begin 
                        if( mem_read == 1'b1 )
                        begin 
        
                                data_send = memory[ address_data>>2 ] ;
                        end 
                        else 
                        begin 
                                data_send = 32'b0 ;
                        end 
                end 
                default :
                begin 
                        if( mem_read == 1'b1 )
                        begin 
        
                                data_send = memory[ address_data>>2 ] ;
                        end 
                        else 
                        begin 
                                data_send = 32'b0 ;
                        end 
                end
        endcase
        end

always @( address_inst )
		instruction = memory[ address_inst>>2 ] ;
endmodule
