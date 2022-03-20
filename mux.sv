//=============================
//Filename      : Multiplexor MUX
//Description   : Multiplexor 32'b : if sel=1 -> out=in_1
//=============================

module mux #(WIDTH = 32)( 
        input logic     [WIDTH-1:0] in_mux_1 ,
        input logic     [WIDTH-1:0] in_mux_2 ,
        input logic     sel_mux ,

        output logic    [WIDTH-1:0] out_mux
) ;

//==Variable Declaration=======
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code===================
always_comb 
        unique case( sel_mux ) 
                1'b1: //Case : in_1 
                        out_mux = in_mux_1 ;
                1'b0: //Case : in_2 
                        out_mux = in_mux_2 ;
                default:
                        out_mux = 0 ;
        endcase
endmodule
