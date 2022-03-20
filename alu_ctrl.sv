//================================
//Filename      : Alu Control 
//Description   : Alu control Module -> send alu_ctrl signal
//================================

module alu_ctrl(
        input logic     [5:0] inst_alu , //Instruction read to determine wich Rtype instruction it is
        input logic     [1:0] alu_op , //Instruction comming from Control Unit

        output logic    [2:0] alu_ctrl
) ;

//==Variable Declaration==========
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code=====================
always_comb 
        unique case( alu_op ) 
                2'b00: //Case : LW Inst (ADD needed)
                        alu_ctrl = 3'b010 ;
                2'b01: //Case SW inst (ADD Needed)
                        alu_ctrl = 3'b010 ;
                2'b10: //Case : R - Inst
                        begin 
                                unique case( inst_alu )
                                        6'b100100: //Case : AND
                                                alu_ctrl = 3'b000 ;
                                        6'b100101: //case : OR
                                                alu_ctrl = 3'b001 ;
                                        6'b100000: //case : ADD 
                                                alu_ctrl = 3'b010 ;
                                        6'b100010: //CAse SUB 
                                                alu_ctrl = 3'b011 ;
                                        6'b100111: //Case : NOR 
                                                alu_ctrl = 3'b101 ;
                                        default: //Case : SLT 
                                                alu_ctrl = 3'b100 ;
                                endcase
                        end
                default: 
                        begin
                                alu_ctrl = 3'b111 ;
                        end

        endcase 
endmodule
