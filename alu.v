module alu(opcode,A,B,alu_out,cy,zero);
input [2:0]opcode;
input [15:0]A,B;
output reg [15:0]alu_out;
output reg  cy,zero;

always @(opcode,A,B) 
begin
case(opcode)
0: begin{cy,alu_out} = A + B;zero=(alu_out==16'b0);end//blocking
1: begin{cy,alu_out} = A - B;zero=(alu_out==16'b0);end
2: begin{cy,alu_out} = A & B;zero=(alu_out==16'b0);end
3: begin{cy,alu_out} = A | B;zero=(alu_out==16'b0);end
4: begin{cy,alu_out} = A ^ B;zero=(alu_out==16'b0);end
5: begin{cy,alu_out} = ~A;zero=(alu_out==16'b0);end
6: begin{cy,alu_out} = A>>B;zero=(alu_out==16'b0);end
7: begin{cy,alu_out} = A<<B;zero=(alu_out==16'b0);end
default: begin{cy,alu_out} = 0;zero=(alu_out==16'b0);end 
endcase


//$display($time," ALU: %b",ALUOut);
//$display($time, " Zero: %b", (ALUOut==0));
end
endmodule // alu