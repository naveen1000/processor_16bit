module registers(
    input[2:0]addr,
    input rd,wr,
    input [15:0]data_in,
    output reg [15:0]data_out);
    
reg [15:0] r[0:7];
always @(*)
begin
    if(wr)
        r[addr]=data_in;
        //$display("wr=r[%d]=%d",addr,data_in);
end
always @(*)
begin
    if(rd)
        data_out=r[addr];
        $display("rd=r[%d]=%b=%d",addr,data_out,data_out);
end
endmodule // register ram module
