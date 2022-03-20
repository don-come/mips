//======================================
//Filename      : Register File 
//Description   : Module to read data in register // Write datas in register 
//======================================

module register_file(
        input logic     [4:0] read_1 , //Numero of the register to read 
        input logic     [4:0] read_2 ,//Numero of the second register to read 
        input logic     [4:0] write ,//Numero of the register to write 
        input logic     [31:0] write_data ,//datas to write in the register "write_reg" 
        input logic     reg_write ,//Signal to indicate if we write/read register : 1 write /0 read 
        output logic    [31:0] data_reg_1 , //Value of the register 1 
        output logic    [31:0] data_reg_2 //Value of the register 2
) ;

//==Variable Declaration================
timeunit 1ns ;
timeprecision 100ps ;

logic   [31:0] register_global [31:0] ;
//==Main Code===========================
always_comb
begin 
        register_global[0] = 32'h0 ;
        unique case( reg_write ) 
                1'b0: //Case : read datas 
                        begin 
                                data_reg_1 = register_global[ read_1 ] ;
                                data_reg_2 = register_global[ read_2 ] ;
                        end 
                1'b1: //Case write datas 
                        begin   
                                register_global[ write ] = write_data ;
                                data_reg_1 = register_global[ read_1 ] ;
                                data_reg_2 = register_global[ read_2 ] ;
                        end 
                default: 
                        begin 
                                data_reg_1 = register_global[ read_1 ] ;
                                data_reg_2 = register_global[ read_2 ] ;
                        end 
        endcase
end

endmodule

