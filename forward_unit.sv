//=========================================
//Filename      : Forwarding Unit
//Dexcription   ; Control the hazard from datas , for add the result in entry
//of the alu

module forward_unit(
        input logic     [31:0] rs, //Current rs of the instruction
        input logic     [31:0] rt, //Current RS of the instruction

        input logic     [31:0] ex_mem_rd, //Data comming juste after ALU
        input logic     [31:0] mem_wb_rd, //Data coming after memory pipeline

        input logic     reg_write_ex_mem, //Reg write signal comming from execution-memory pipeline
        input logic     reg_write_mem_wb, //Reg write signal after memoy pipeline

        output logic    [1:0] forward_a, //Control the MUX for rs 
        output logic    [1:0] forward_b //Control the mux for rt 
) ;

//==Variable Declaration=====================
timeunit 1ns ;
timeprecision 100ps ;

//==Main Code================================
always_comb 
begin   
//Coming from execution-memory pipeline
        if( (reg_write_ex_mem == 1'b1) & (ex_mem_rd != 0) & (ex_mem_rd == rs ) )
        begin
                forward_a = 2'b10 ; //Select ex_mem_rd to RS
                forward_b = 2'b00 ;
        end
        if( (reg_write_ex_mem == 1'b1 ) & (ex_mem_rd != 0) & (ex_mem_rd == rt) )
        begin 
                forward_b = 2'b10 ; //Select ex_mem_rd to RT
                forward_a = 2'b00 ;
        end 
        //Coming from memory-writeback pipeline
        if( (reg_write_mem_wb == 1'b1) & (mem_wb_rd != 0) & !((reg_write_ex_mem == 1'b1) & (ex_mem_rd != 0) & (ex_mem_rd != rs )) & (mem_wb_rd == rs) )
        begin 
                forward_a = 2'b01 ; //Select mem_wb for RS
                forward_b = 2'b00 ;
        end
        if( (reg_write_mem_wb == 1'b1) & (mem_wb_rd != 0) & !((reg_write_ex_mem == 1'b1) & (ex_mem_rd != 0) & (ex_mem_rd != rt )) & (mem_wb_rd == rt) )
        begin 
                forward_b = 2'b01 ; //Select mem_wb for RT 
                forward_a = 2'b00 ;
        end
        else 
        begin   
                forward_a = 2'b00 ;
                forward_b = 2'b00 ;
        end
end 

endmodule

