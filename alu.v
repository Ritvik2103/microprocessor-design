`timescale 1ns / 1ps

module alu (
input clk,
    input wire [3:0] operand1, operand2, // ALU inputs
    input wire [3:0] alu_op,            // ALU operation control
    output reg [3:0] result,            // ALU result
    output reg zero_flag=0,               // Zero flag
    output reg carry_flag=0,              // Carry flag
    output reg write_enable=0          // Write enable for the register file
);
    always @(posedge clk) 
begin
        // Default values
        carry_flag = 0;
	zero_flag=0;


case (alu_op)
            4'b0000: begin // Add
                {carry_flag, result} = operand1 + operand2; // Add with carry-out
                write_enable = 1; // Enable write-back for add operation
            end
            4'b0001: begin // Subtract
                {carry_flag, result} = {1'b0, operand1} - operand2; // Subtract with borrow
                //carry_flag = ~carry_flag; // Invert for borrow indication
                write_enable = 1; // Enable write-back for subtract operation
            end
            4'b0010: begin // Multiply
                result = operand1 * operand2;
                write_enable = 1; // Enable write-back for multiply operation
            end
            4'b0011: begin // Divide
                if (operand2 != 0) begin
                    result = operand1 / operand2;
                end else begin
                    result = 4'b0000; // Handle divide-by-zero
                end
                write_enable = 1; // Enable write-back for divide operation
            end
            4'b0100: begin // AND
                result = operand1 & operand2;
                write_enable = 1; // Enable write-back for AND operation
            end
            4'b0101: begin // OR
                result = operand1 | operand2;
                write_enable = 1; // Enable write-back for OR operation
            end
            4'b0110: begin // XOR
                result = operand1 ^ operand2;
                write_enable = 1; // Enable write-back for XOR operation
            end
            4'b0111: begin // XNOR
                result = ~(operand1 ^ operand2);
                write_enable = 1; // Enable write-back for XNOR operation
            end
            4'b1000: begin // NOT
                result = ~operand1;
                write_enable = 1; // Enable write-back for NOT operation
            end
            4'b1001: begin // Right Shift
                result = operand1 >> 1;
                write_enable = 1; // Enable write-back for right shift operation
            end
            4'b1010: begin // Left Shift
                result = operand1 << 1;
                write_enable = 1; // Enable write-back for left shift operation
            end
            default: begin
                result = 4'b0000;
                write_enable = 0; // No write for undefined operations
            end
        endcase

        zero_flag = (result == 4'b0000); // Set zero flag if result is zero
    end
endmodule


