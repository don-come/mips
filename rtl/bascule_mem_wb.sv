//===================================
//Filename      : Bascule memory //Store
//Description   : Bascule for 4th pipeline
//===================================

module bascule_mem_wb( 
        input logic     clk,
        input logic     rst,

        input logic     in_reg_write,
        input logic     in_mem_reg,
        input logic     [31:0] in_read_data_mem,
        input logic     [31:0] in_address_write,
        input logic     [4:0] in_write_reg,

        output logic    out_reg_write,
        output logic    out_mem_reg,
        output logic    [31:0] out_read_data_mem,
        output logic    [31:0] out_address_write,
        output logic    [4:0] out_write_reg
) ;

//==Variable Declaration=============
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code========================
always_ff @( posedge clk )
begin 
        if( rst == 1'b1 )
        begin 
                out_reg_write = 1'b0 ;
                out_mem_reg = 1'b0 ;
                out_read_data_mem = 32'h0 ;
                out_address_write = 32'h0 ;
                out_write_reg = 4'b0000 ;
        end

        else 
        begin 
                out_reg_write = in_reg_write ;
                out_mem_reg = in_mem_reg ;
                out_read_data_mem = in_read_data_mem ;
                out_address_write = in_address_write ;
                out_write_reg = in_write_reg ;
        end
end 

endmodule
