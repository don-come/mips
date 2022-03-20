//=====================================================
//Filename      : Address of instruction Finite-state machine
//Description   : Calculate the next instruction address 
//=====================================================

module addr_inst (
        input logic     [31:0] in_pc , //The previous instruction address
        input logic     pc_write,

        output logic    [31:0] pc , //In_PC 
        output logic    [31:0] pc_next  //PC+4  
);

//==Variables declaration =============================
timeunit 1ns ;
timeprecision 100ps ;

//== Main Code =========================================
always_comb
        begin 
                unique case( pc_write )
                        1'b1: 
                        begin
                                pc = 32'h0 ;
                                pc_next = 32'h0 ;
                        end
                        default: 
                        begin
                                pc=in_pc ;
                                pc_next=in_pc + 4 ;
                        end 
                endcase

        end

endmodule



