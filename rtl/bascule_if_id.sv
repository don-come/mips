//============================
//Filename      : Bascule Instruction Fetch Instruction Decode
//Description   : First element for Pipeline
//============================

module bascule_if_id( 
        input logic     clk,
        input logic     rst,
        
        input logic     if_id_write,
        input logic     [31:0] in_pc,
        input logic     [31:0] in_instruction,
        output logic    [31:0] out_pc,
        output logic    [31:0] out_instruction
) ;

//==Variable Declaration======
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code=================
always_ff @( posedge clk )
        begin
                if( rst == 1'b1 )
                begin
                        out_pc = 32'h0 ;
                        out_instruction = 32'h0 ;
                end
                else 
                begin 
                        unique case( if_id_write )
                                1'b1: 
                                begin
                                        out_instruction = 32'h0 ;
                                        out_pc = 21'h0 ;
                                end
                                default:
                                begin
                                        out_pc = in_pc ;
                                        out_instruction = in_instruction ;
                                end
                        endcase
                end
        end 
endmodule
