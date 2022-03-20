//===============================
//Filename      : Read Register
//Description   : Read the value of the register i
//===============================

module register_read(
        input logic     [4:0] read_1 , //First value of the register 
        input logic     [4:0] read_2 ,
        input logic     [31:0] register [31:0] , //The register to read 

        output logic    [31:0] data_read_1 , //Value of the register[read_1]
        output logic    [31:0] data_read_2 , //Value of the register[read_2]
        output logic    [31:0] out_register [31:0]
) ;

//==Variable Declaration==========
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code=====================
always_comb 
        begin 
                out_register = register ;
                data_read_1 = register[read_1] ;
                data_read_2 = register[read_2] ;
        end 
endmodule
