//=====================================
//Filename      : Bascule to Write
//Description   : Bascule to link Memory acces to Write in registers
//=====================================

module bascule_to_write(
        input   clk,
        input logic     [31:0] in_bascule_1, //For out_complet
        input logic     [4:0] in_bascule_2, //For mux_reg_file
        input logic     in_bascule_3, //For reg_write
        input logic     [31:0] in_bascule_register [31:0], //For register

        output logic    [31:0] out_bascule_1,
        output logic    [4:0] out_bascule_2,
        output logic    out_bascule_3,
        output logic    [31:0] out_bascule_register [31:0]
) ;

//==Loop Sequential====================
always_ff @( posedge clk )
        begin
                out_bascule_1 <= in_bascule_1 ;
                out_bascule_2 <= in_bascule_2 ;
                out_bascule_3 <= in_bascule_3 ;
                out_bascule_register <= in_bascule_register ;
        end 
endmodule
