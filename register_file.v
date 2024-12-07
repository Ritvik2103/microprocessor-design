`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.12.2024 13:37:18
// Design Name: 
// Module Name: register_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module register_file (
    input wire clk,               // Clock signal
    input wire reset,             // Reset signal
    input wire [1:0] read_sel1,   // Register select for operand1
    input wire [1:0] read_sel2,   // Register select for operand2
    input wire [1:0] write_sel,   // Register select for write-back
    input wire [3:0] write_data,  // Data to write to register
    input wire write_enable,      // Write enable signal
    output reg [3:0] operand1,    // First operand
    output reg [3:0] operand2    // Second operand
     
);
reg [3:0] register1,register2,register3, register4;  // Registers
    always @(posedge clk or posedge reset) begin
        if (reset) 
begin
            // Reset all registers to default value
            register1 <= 4'd0;
            register2 <= 4'd1;
            register3 <= 4'd2;
            register4 <= 4'd3;
        end 
else if (write_enable) 
begin
            case(write_sel)
0: begin register1<= write_data; end
1: begin register2<= write_data; end
2: begin register3<= write_data; end
3: begin register4<= write_data; end
default: begin register1<= write_data; end
endcase
        
end
end

    // Assign operands based on selected registers
    always @(*) 
begin
        case({read_sel1, read_sel2})

4'd0 : begin operand1= register1; operand2= register1; end
4'd1 : begin operand1= register1; operand2= register2; end
4'd2 : begin operand1= register1; operand2= register3; end
4'd3 : begin operand1= register1; operand2= register4; end


4'd4 : begin operand1= register2; operand2= register1; end
4'd5 : begin operand1= register2; operand2= register2; end
4'd6 : begin operand1= register2; operand2= register3; end
4'd7 : begin operand1= register2; operand2= register4; end

4'd8 : begin operand1= register3; operand2= register1; end
4'd9 : begin operand1= register3; operand2= register2; end
4'd10: begin operand1= register3; operand2= register3; end
4'd11: begin operand1= register3; operand2= register4; end

4'd12: begin operand1= register4; operand2= register1; end
4'd13: begin operand1= register4; operand2= register2; end
4'd14: begin operand1= register4; operand2= register3; end
4'd15: begin operand1= register4; operand2= register4; end

default: begin operand1= register1; operand2= register1; end 

endcase


end
endmodule

