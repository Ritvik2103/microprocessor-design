`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.12.2024 13:40:46
// Design Name: 
// Module Name: microprocessor_tb
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


module microprocessor_tb(

    );
reg clk, reset;
reg [3:0] instruction;
reg [1:0]read_sel1, read_sel2, write_sel;

//wire [3:0]register1, register2, register3, register4;
wire [3:0]result;
wire zero_flag, carry_flag;
//wire write_enable;

microprocessor uut (.clk(clk), .reset(reset), .instruction(instruction), .read_sel1(read_sel1), .read_sel2(read_sel2), .write_sel(write_sel), .result(result), .zero_flag(zero_flag), .carry_flag(carry_flag));

//.write_enable(write_enable), .register1(register1), .register2(register2), .register3(register3), .register4(register4));

initial begin
clk=0;
forever #5 clk= ~clk;
end

initial begin
reset=1;
write_sel=0;
read_sel1= 3;
read_sel2= 1;
#10;
reset=0;
#10;
instruction=0;
#10;
instruction=1;
#10;
instruction=2;
#10;
//write_sel=1;
instruction=3;
#10;
instruction=4;
#10;
instruction=5;
#10;
//write_sel=2;
instruction=6;
#10;
//read_sel2=2;
instruction=7;
#10;
instruction=8;
#10;
instruction=9;
#10;
instruction=10;
#10;
instruction=11;
end
endmodule 


