//====================================
//Filename      : Adder for Jump/Bench Instruction
//Description   : Adder used to add input_1+input_2
//====================================

module adder(
        input logic     [31:0] in_add_1 ,
        input logic     [31:0] in_add_2 ,

        output logic    [31:0] out_add 
) ;

//==Variable Declaration==============
timeunit 1ns ; 
timeprecision 100ps ;

//==Main Code=========================
always_comb
        out_add = in_add_1 + in_add_2 ;

endmodule
