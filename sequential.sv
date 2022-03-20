//=================================
//Filename      : Sequential
//Description   : Entire MIPS With sequential elements
//=================================

module sequential( 
        input logic     clk, //Clock of the system
        input logic     rst, //Reset signal
        input logic     start, //Signal to indicate the module start
        input logic     [31:0] address_start, //The starting PC
        //from memory 
        input logic     [31:0] instruction ,
        input logic     [31:0] data_mem,

        output logic    [31:0] address_inst ,
        output logic    [31:0] address_data ,
        output logic    mem_write ,
        output logic    mem_read ,
        output logic    [31:0] data_receive

) ;

//==Variable declaration===========
timeunit 1ns ;
timeprecision 100ps ;

//==Intern Wires===================
//==FIRST PIPELINE=================
logic   [31:0] pc_to_memory ; //Wire to connect PC to Memory 
logic   [31:0] pc_next ; //Wire at PC+4 
logic   [31:0] pc_register ; //PC after first bascule 

logic   [31:0] instruction_to_bascule ; //Connect Instrcuction to first bascule
logic   [31:0] instruction_register ; //Instruction to register bloc

//==SECOND REGISTER================
logic   reg_dst_to_mux ;
logic   branch_to_mux ;
logic   [1:0] alu_op_to_mux ;
logic   mem_read_to_mux ;
logic   mem_write_to_mux ;
logic   mem_reg_to_mux ;
logic   alu_src_to_mux ;
logic   reg_write_to_mux ;
logic   jump_to_mux ;
logic   reg_dst_to_bascule ;
logic   branch_to_bascule ;
logic   [1:0] alu_op_to_bascule ;
logic   mem_read_to_bascule ;
logic   mem_write_to_bascule ;
logic   mem_reg_to_bascule ;
logic   alu_src_to_bascule ;
logic   reg_write_to_bascule ;
logic   jump_to_bascule ;
logic   if_id_write ;
logic   pc_write ;
logic   sel_mux_cu ;

logic   [31:0] data_reg_1_to_bascule ;
logic   [31:0] data_reg_2_to_bascule ;
logic   [31:0] sign_extend_to_bascule ;

logic   [31:0] data_reg_1_alu ;
logic   [31:0] data_reg_2_mux ;
logic   [31:0] sign_extend_to_alu_ctrl ;
logic   [4:0] instruction_1_mux ;
logic   [4:0] instruction_2_mux ;
logic   [31:0] pc_adder ;
logic   reg_dst_mux ;
logic   branch ;
logic   [1:0] alu_op ;
logic   mem_read_bascule_bascule ;
logic   mem_write_bascule_bascule ;
logic   mem_reg_bascule_bascule ;
logic   alu_src_mux ;
logic   reg_write_bascule_bascule ;
logic   jump_bascule_bascule ;
logic   [27:0] jump_inst_bascule ;
logic   [1:0] forward_a ;
logic   [1:0] forward_b ;
logic   [31:0] mux_to_alu_rs ;
logic   [31:0] mux_to_alu_rt ;

logic   [4:0] write_reg_bascule ;
logic   [2:0] alu_ctrl ;
logic   [31:0] mux_alu ;
logic   [31:0] shift_to_adder ;
logic   [31:0] pc_add_to_bascule ;
logic   [31:0] alu_result_to_bascule ;
logic   [4:0] write_reg_bascule_bascule ;
logic   [31:0] write_data ;
logic   [31:0] alu_result ;
logic   zero ;
logic   [31:0] pc_beq ;
logic   [27:0] jump_inst_bascule_bascule ;
logic   branch_beq ;
logic   reg_write_bascule_2 ;
logic   mem_reg_bascule_2 ;
logic   [31:0] pc_jump_bascule ;
logic   zero_to_bascule ;

logic   [31:0] read_memory_bascule ;
logic   reg_write ;
logic   mem_reg ;
logic   jump ;
logic   [27:0] jump_inst_mux ;
logic   [31:0] data_mem_to_mux ;
logic   [31:0] address_to_mux ;
logic   [4:0] write_reg ;
logic   [31:0] write_register_file ;
logic   [31:0] pc_jump_mux ;

//Control beginning
logic   [31:0] in_pc ;
logic   [31:0] pc_mux ;
logic   [31:0] out_pc ;
//==Main code======================
always_ff @( posedge clk ) 
begin
        if( rst == 1'b1 )
                $finish( 0 ) ;
        else 
        begin   
                if( start == 1'b1 )
                begin
                        in_pc = address_start ;
      //                  address_inst = address_start ;
                        
                end
                else
                begin
                        in_pc = out_pc ;
        //                address_inst = out_pc ;
                end
        end
end
//==First Pipeline====================================================
addr_inst AI1( 
        .in_pc( in_pc ), 
        .pc_write( pc_write ),
        .pc( address_inst ), 
        .pc_next( pc_next )
) ;

bascule_if_id IFID1( 
        .clk( clk ),
        .rst( rst ),
        .if_id_write( if_id_write ),
        .in_pc( pc_next ),
        .in_instruction( instruction ),
        .out_pc( pc_register ),
        .out_instruction( instruction_register )
) ;

//==Second pipeline===================================================
control_hazard_unit CHU1( 
        .id_ex_mem_read( mem_read_bascule_bascule ),
        .id_ex_reg_rt( instruction_1_mux ),
        .if_id_reg_rs( instruction_register[25:21] ),
        .if_id_reg_rt( instruction_register[20:16] ),
        .pc_write( pc_write ),
        .if_id_write( if_id_write ),
        .sel_mux_cu( sel_mux_cu )
) ;

control_unit CU1( 
        .op_instruction( instruction_register[31:26] ),
        .reg_dst( reg_dst_to_mux ),
        .branch( branch_to_mux ),
        .alu_op( alu_op_to_mux ),
        .mem_read( mem_read_to_mux ),
        .mem_write( mem_write_to_mux ),
        .mem_to_reg( mem_reg_to_mux ),
        .alu_src( alu_src_to_mux ),
        .reg_write( reg_write_to_mux ),
        .jump( jump_to_mux ) 
) ;

mux_cu MCU1(
        .reg_dst( reg_dst_to_mux ),
        .branch( branch_to_mux ),
        .alu_op( alu_op_to_mux ),
        .mem_read( mem_read_to_mux ),
        .mem_write( mem_write_to_mux ),
        .mem_to_reg( mem_reg_to_mux ),
        .alu_src( alu_src_to_mux ),
        .reg_write( reg_write_to_mux ),
        .jump( jump_to_mux ),
        .sel_mux_cu( sel_mux_cu ),

        .out_reg_dst( reg_dst_to_bascule ),
        .out_branch( branch_to_bascule ),
        .out_alu_op( alu_op_to_bascule ),
        .out_mem_read( mem_read_to_bascule ),
        .out_mem_write( mem_write_to_bascule ),
        .out_mem_to_reg( mem_reg_to_bascule ),
        .out_alu_src( alu_src_to_bascule ),
        .out_reg_write( reg_write_to_bascule ),
        .out_jump( jump_to_bascule )
) ;

register_file RF1( 
        .read_1( instruction_register[25:21] ),
        .read_2( instruction_register[20:16] ),
        .write( write_reg ),
        .write_data( write_register_file ),
        .reg_write( reg_write ),
        .data_reg_1( data_reg_1_to_bascule ),
        .data_reg_2( data_reg_2_to_bascule )
) ;

sign_extend SE1( 
        .in_sign( instruction_register[15:0] ),
        .out_sign( sign_extend_to_bascule )
) ;

shift_reg_jump SRJ1(
        .in_shift( instruction_register[25:0] ),
        .out_shift( jump_inst_bascule )
) ;

bascule_id_ex BIDEX( 
        .clk( clk ),
        .rst( rst ),
        .in_read_1( data_reg_1_to_bascule ),
        .in_read_2( data_reg_2_to_bascule ),
        .in_sign_extend( sign_extend_to_bascule ),
        .in_instruction_1( instruction_register[20:16] ),
        .in_instruction_2( instruction_register[15:11] ),
        .in_pc( pc_register ),
        .in_jump_inst( jump_inst_bascule ),
        .in_reg_dst( reg_dst_to_bascule ),
        .in_branch( branch_to_bascule ),
        .in_alu_op( alu_op_to_bascule ),
        .in_mem_read( mem_read_to_bascule ),
        .in_mem_write( mem_write_to_bascule ),
        .in_mem_reg( mem_reg_to_bascule ),
        .in_alu_src( alu_src_to_bascule ),
        .in_reg_write( reg_write_to_bascule ),
        .in_jump( jump_to_bascule ),

        .out_read_1( data_reg_1_alu ),
        .out_read_2( data_reg_2_mux ),
        .out_sign_extend( sign_extend_to_alu_ctrl ),
        .out_instruction_1( instruction_1_mux ),
        .out_instruction_2( instruction_2_mux ),
        .out_pc( pc_adder ),
        .out_jump_inst( jump_inst_bascule_bascule ),
        .out_reg_dst( reg_dst_mux ),
        .out_branch( branch ),
        .out_alu_op( alu_op ),
        .out_mem_read( mem_read_bascule_bascule ),
        .out_mem_write( mem_write_bascule_bascule ),
        .out_mem_reg( mem_reg_bascule_bascule ),
        .out_alu_src( alu_src_mux ),
        .out_reg_write( reg_write_bascule_bascule ),
        .out_jump( jump_bascule_bascule )
) ;

//==Third Pipeline======================================================
mux #( 5 ) MU1( 
        .in_mux_1( instruction_2_mux ),
        .in_mux_2( instruction_1_mux ),
        .sel_mux( reg_dst_mux ),
        .out_mux( write_reg_bascule )
) ;

alu_ctrl AC1( 
        .inst_alu( sign_extend_to_alu_ctrl[5:0] ),
        .alu_op( alu_op ),
        .alu_ctrl( alu_ctrl )
) ;

mux MU2( 
        .in_mux_1( sign_extend_to_alu_ctrl ),
        .in_mux_2( data_reg_2_mux ),
        .sel_mux( alu_src_mux ),
        .out_mux( mux_alu )
) ;

shift_reg SR1( 
        .in_shift( sign_extend_to_alu_ctrl ),
        .out_shift( shift_to_adder )
) ;

adder AD1( 
        .in_add_1( shift_to_adder ),
        .in_add_2( pc_adder ),
        .out_add( pc_add_to_bascule )
) ;

assign pc_jump_bascule = pc_adder ;

forward_unit FU1( 
        .rs( data_reg_1_alu ),
        .rt( mux_alu ),
        .ex_mem_rd( alu_result ),
        .mem_wb_rd( address_to_mux ),
        .reg_write_ex_mem( reg_write_bascule_2 ),
        .reg_write_mem_wb( reg_write ),

        .forward_a( forward_a ),
        .forward_b( forward_b )
) ;
//For RS
mux_alu MA1(
        .in_mux_1( data_reg_1_alu ),
        .in_mux_2( address_to_mux ),
        .in_mux_3( alu_result ),
        .sel_mux( forward_a ),

        .out_mux( mux_to_alu_rs )
) ;

mux_alu MA2(
        .in_mux_1( mux_alu ),
        .in_mux_2( data_mem_to_mux ),
        .in_mux_3( alu_result ),
        .sel_mux( forward_b ),

        .out_mux( mux_to_alu_rt )
) ;

alu A1( 
        .in_alu_1( mux_to_alu_rs ),
        .in_alu_2( mux_to_alu_rt ),
        .alu_ctrl( alu_ctrl ),
        .zero( zero_to_bascule ),
        .alu_result( alu_result_to_bascule )
) ;

bascule_ex_mem BEXMEM1( 
        .clk( clk ),
        .rst( rst ),
        .in_write_reg( write_reg_bascule ),
        .in_write_data( data_reg_2_mux ),
        .in_alu_result( alu_result_to_bascule ),
        .in_zero( zero_to_bascule ),
        .in_pc( pc_add_to_bascule ),
        .in_pc_jump( pc_jump_bascule ),
        .in_jump_inst( jump_inst_bascule_bascule ),
        .in_branch( branch ),
        .in_mem_read( mem_read_bascule_bascule ),
        .in_mem_write( mem_write_bascule_bascule ),
        .in_reg_write( reg_write_bascule_bascule ),
        .in_mem_reg( mem_reg_bascule_bascule ),
        .in_jump( jump_bascule_bascule ),

        .out_write_reg( write_reg_bascule_bascule ),
        .out_write_data( data_receive ),
        .out_alu_result( address_data ),
        .out_zero( zero ),
        .out_pc( pc_beq ),
        .out_pc_jump( pc_jump_mux ),
        .out_jump_inst( jump_inst_mux ),
        .out_branch( branch_beq ),
        .out_mem_read( mem_read ),
        .out_mem_write( mem_write ),
        .out_reg_write( reg_write_bascule_2 ),
        .out_mem_reg( mem_reg_bascule_2 ),
        .out_jump( jump )
) ;
assign alu_result = address_data ;
//==Fourth Pipeline===================================================
mux MU3( 
        .in_mux_1( pc_beq ),
        .in_mux_2( pc_jump_mux ),
        .sel_mux( branch_beq & zero ),
        .out_mux( pc_mux ) 
) ;

mux MU5(
        .in_mux_1( {pc_jump_mux[31:28] , jump_inst_mux } ),
        .in_mux_2( pc_mux ),
        .sel_mux( jump ),
        .out_mux( out_pc )
) ;

bascule_mem_wb BMEMWB1(
        .clk( clk ),
        .rst( rst ),
        .in_reg_write( reg_write_bascule_2 ),
        .in_mem_reg( mem_reg_bascule_2 ),
        .in_read_data_mem( data_mem ),
        .in_address_write( alu_result ),
        .in_write_reg( write_reg_bascule_bascule ),

        .out_reg_write( reg_write ),
        .out_mem_reg( mem_reg ),
        .out_read_data_mem( data_mem_to_mux ),
        .out_address_write( address_to_mux ),
        .out_write_reg( write_reg )
) ;

mux MU4( 
        .in_mux_1( data_mem_to_mux ),
        .in_mux_2( address_to_mux ),
        .sel_mux( mem_reg ),
        .out_mux( write_register_file )
) ;

endmodule
