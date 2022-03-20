//============================
//Filename      : Bascule for Registers
//Description   : Sequential For registers
//============================

module bascule_register( 
        input           clk,
        input logic     [31:0] in_bascule [31:0],

        output logic    [31:0] out_bascule [31:0]
) ;

//==Loop Sequential===========
always_ff @( posedge clk )
        begin
                out_bascule <= in_bascule ;
        end 
endmodule
