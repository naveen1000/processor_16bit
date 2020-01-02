module alu_tb;
reg [2:0]opcode;
reg [15:0]A,B;
wire [15:0]alu_out;
wire cy,zero;
integer i;
alu DUT(opcode,A,B,alu_out,cy,zero);
initial
begin
$monitor ($time," A=%d, B=%d,out=%d cy=%d zero=%d  op=%d",A,B,alu_out,cy,zero,opcode);
    for (i=0; i<8; i=i+1)
    begin
    #5 A=16'hffff; B=16'h0001; opcode=i;
    end
#5 $finish;
end
endmodule