//=========================
//Filename      : Write register
//Description   : Module to write value, or not, in register
//==========================

module register_write(
        input logic     [31:0] register [31:0] , //The register 
        input logic     [4:0] number , //The register where write 
        input logic     [31:0] write_data , //The value to attribute
        input logic     reg_write , //output of Control Unit

        output logic    [31:0] out_register [31:0]
) ; 

//==Variable Declaration=====
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code================
always_comb
        begin
                unique case( reg_write ) 
                       1'b0 : //Do NOT read
                               out_register  = register ;
                       1'b1 : //Do read
                       begin 
                               out_register = register ;
                               out_register[number] = write_data ;
                        end 
                        default : 
                                out_register = register ;
                endcase
        end 
endmodule
