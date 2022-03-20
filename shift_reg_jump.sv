//======================================
//Filename      : Shift Left Register For jump Inst 
//Description   : Shift Register by <<2 (*4)
//======================================

module shift_reg_jump ( 
        input logic     [25:0] in_shift ,
        output logic    [27:0] out_shift
) ;

//==Variable Declaration================
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code===========================
always_comb 
        out_shift = in_shift << 2 ;
endmodule
