`timescale 1ns / 1ps

module microprocessor (
    input wire clk,               // Clock signal
    input wire reset,             // Reset signal
    input wire [3:0] instruction, // ALU operation control
    input wire [1:0] read_sel1,   // Register select for operand1
    input wire [1:0] read_sel2,   // Register select for operand2
    input wire [1:0] write_sel,   // Register select for write-back

    output wire [3:0] result,     // ALU result
   // output [3:0]register1, register2, register3, register4, //internal registers
    output wire zero_flag,        // Zero flag from ALU
    output wire carry_flag        // Carry flag from ALU
);
    wire [3:0] operand1, operand2; // ALU operands
    wire write_enable;             // Write enable from ALU

    // Instantiate Register File
    register_file rf (
        .clk(clk),
        .reset(reset),
        .read_sel1(read_sel1),
        .read_sel2(read_sel2),
        .write_sel(write_sel),
        .write_data(result),
        .write_enable(write_enable), // Pass write_enable from ALU
        .operand1(operand1),
        .operand2(operand2)
//,.register1(register1), .register2(register2), .register3(register3), .register(4)
    );

    // Instantiate ALU
    alu alu_unit (
	.clk(clk),
        .operand1(operand1),
        .operand2(operand2),
        .alu_op(instruction),
        .result(result),
        .zero_flag(zero_flag),
        .carry_flag(carry_flag),
        .write_enable(write_enable) // Pass write_enable signal
    );
endmodule

