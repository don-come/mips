//====================================
//Filename      : Bascule D
//Description   : Memory element D-Flip-Flop
//====================================

module bascule #( WIDTH=32 )( 
        input           clk, //Clock
        input logic     [WIDTH-1:0] in_bascule, 

        output logic    [WIDTH-1:0] out_bascule
) ;

//==Loop Sequential==================
always_ff @( posedge clk ) 
        begin
                out_bascule <= in_bascule ;
        end

endmodule
