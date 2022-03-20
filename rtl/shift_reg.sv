//======================================
//Filename      : Shift Left Register 
//Description   : Shift Register by <<2 (*4)
//======================================

module shift_reg #(parameter WIDTH=32) ( 
        input logic     [WIDTH-1:0] in_shift ,
        output logic    [WIDTH-1:0] out_shift
) ;

//==Variable Declaration================
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code===========================
always_comb 
        out_shift = in_shift << 2 ;
endmodule
