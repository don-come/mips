//====================================
//Filename      : Test Bench for register file Module 
//Descripttion  : Test the read/write of registers 
//==================================

//logic   [31:0] register [31:0] ;

module tbench_register_file() ;

timeunit 1ns ;
timeprecision 100ps ;

//==Variables Decalration===========
//reg     [31:0] register [31:0] ;

logic   [4:0] read_1 ;
logic   [4:0] read_2 ;
logic   [4:0] write ; 
logic   [31:0] write_data ;
logic   reg_write ;

logic   [31:0] data_reg_1 ;
logic   [31:0] data_reg_2 ;

logic   start ;

//==Instanciate Module Register File 
register_file RF1( .read_1( read_1 ), .read_2( read_2 ), .write( write ),
                .write_data( write_data ), .reg_write( reg_write ),
                .data_reg_1( data_reg_1 ), .data_reg_2( data_reg_2 ) ) ;

//==Monitor Results===============
initial 
        begin 
                $timeformat( -9, 0, "ns", 3 ) ;
                $monitor( "%t - read_1=%h - read_2=%h - write=%h - write_data=%h - reg_write=%h", $time, read_1, read_2, write, write_data,
                reg_write ) ;
        end
//==Verify Results================
task xpects( input [31:0] expects, input [31:0] expects_2 ) ;
        if( data_reg_1 != expects || data_reg_2 != expects_2 ) 
        begin 
                $display( "data_reg_1 is : %h - data_reg_2 is : %h ; it should be : %h or %h", 
                        data_reg_1, data_reg_2, expects, expects_2 ) ;
                $display( "TEST FAILED" ) ;
                $finish ;
        end
endtask

//==Apply Stimulus================
initial
        begin
                //Writting in registers
                read_1 = 5'b00111 ; read_2 = 5'b01010 ; write = 5'b00111 ; write_data = 32'h1 ; reg_write = 1'b1 ; #1ns ;
                read_1 = 5'b00001 ; read_2 = 5'b00110 ; write = 5'b00010 ; write_data = 32'h5 ; reg_write = 1'b1 ; #1ns ;
                read_1 = 5'b00111 ; read_2 = 5'b01010 ; write = 5'b00101 ; write_data = 32'hC ; reg_write = 1'b1 ; #1ns ;
                read_1 = 5'b00111 ; read_2 = 5'b01010 ; write = 5'b00000 ; write_data = 32'hF ; reg_write = 1'b1 ; #1ns ;

                //Read datats in register
                read_1 = 5'b00111 ; read_2 = 5'b00010 ; write = 5'b00110 ; write_data = 32'h1 ; reg_write = 1'b0; #1ns ;
                read_1 = 5'b00101 ; read_2 = 5'b00000 ; write = 5'b00110 ; write_data = 32'h1 ; reg_write = 1'b0 ; #1ns ;

                
                $display( "REGISTER FILE TEST PASSED" ) ;
                $finish( 0 ) ;
        end 
endmodule

