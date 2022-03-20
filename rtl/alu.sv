//======================================
//filename      : ALU 
//Description   : Module ALU to operate for R-Instrcutions
//======================================

module alu( 
        input logic     [31:0] in_alu_1 , //The first opêrande of ALU 
        input logic     [31:0] in_alu_2 , //The second input of ALU 
        input logic     [2:0] alu_ctrl , //The signal to control ALU -> see truth table 

        output logic    zero , //Indicate if result is zero or not (case of SLT instruction)
        output logic    [31:0] alu_result //Resulta of ALU operations
) ;

//==Variable Declaration================
timeunit 1ns ; 
timeprecision 100ps ;

//==Main Code===========================
always_comb 
        unique case( alu_ctrl )
                3'b000: //Case : AND 
                        begin
                                alu_result = in_alu_1 & in_alu_2 ;
                                zero = 1'b0 ;
                        end 
                3'b001: //Case : OR 
                        begin
                                alu_result = in_alu_1 | in_alu_2 ;
                                zero = 1'b0 ;
                        end 
                3'b010: //Case : ADD 
                        begin
                                alu_result = in_alu_1 + in_alu_2 ;
                                zero = 1'b0 ;
                        end 
                3'b011: //Case : SUB
                        begin
                                alu_result = in_alu_1 - in_alu_2 ;
                                zero = 1'b0 ;
                        end 
                3'b100: //Case : BEQ 
                        begin 
                                if( in_alu_1 == in_alu_2 ) 
                                begin 
                                        alu_result = 32'h00000000 ;
                                        zero = 1'b1 ;
                                end 
                                else 
                                begin 
                                        alu_result = 32'h00000000 ;
                                        zero = 1'b0 ;
                                end
                        end
                3'b101: //Case : NOR 
                        begin
                                alu_result = ~( in_alu_1 | in_alu_2 ) ;
                                zero = 1'b0 ;
                        end
                default: 
                        begin 
                                alu_result = 32'h0000000 ;
                                zero = 1'b1 ;
                        end 
        endcase
endmodule


