//=====================================
//Filename      : Sign Extend module 
//Description   : Module to extend 16->32 bits 
//=====================================

module sign_extend( 
        input logic     [15:0] in_sign ,
        
        output logic    [31:0] out_sign 
) ;

//==Variable Declaration===============
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code==========================
always_comb 
       out_sign = in_sign ;

endmodule
