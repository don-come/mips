//============================================
//Filename      : MUX before ALU
//Description   : MUX to select entry of the ALU
//============================================

module mux_alu(
        input logic     [31:0] in_mux_1, //Port for Direct Reg File
        input logic     [31:0] in_mux_2, //Port for mem_wb
        input logic     [31:0] in_mux_3, //Port for EX_MEM
        input logic     [1:0] sel_mux, //Forward A/B 

        output logic    [31:0] out_mux //To ALU
) ;

//==Variable Declaration======================
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code=================================
always_comb 
        unique case( sel_mux )
        2'b00 : 
                out_mux = in_mux_1 ;
        2'b10 :
                out_mux = in_mux_3 ;
        2'b01 : 
                out_mux = in_mux_2 ;
        default : 
                out_mux = in_mux_1 ;
        endcase
endmodule
