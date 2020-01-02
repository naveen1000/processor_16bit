module inst_reg(
    input [7:0]pc,
    input en,
    output [15:0]ir_data);


reg [7:0]mwr_data;
reg mwr;
memory RegUT(pc,en,mwr,mwr_data,ir_data);

endmodule 