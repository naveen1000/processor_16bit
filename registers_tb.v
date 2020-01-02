module registers_tb;
    reg [2:0]addr;
    reg rd;
    reg wr;
    reg [15:0]data_in;
    wire [15:0]data_out;
    integer i;

registers RegUT(addr,rd,wr,data_in,data_out);

initial
begin
$monitor ($time," addr=%d, data=%d   %d",addr,data_in,data_out);
    
    #5 addr=2'b00; wr=1; data_in=16'h0001;
    #5 wr=0; 
    #5 addr=2'b01; wr=1; data_in=16'h0002;
    #5 wr=0; 
    #5 addr=2'b10; wr=1; data_in=16'h0001;
    #5 wr=0; 
    #5 addr=2'b11; wr=1; data_in=16'h0003;
    #5 wr=0; 
    #5 addr=3'b111; wr=1; data_in=16'h0005;
    #5 wr=0; 
    
    #5 addr=2'b00; rd=1; 
    #5 addr=2'b01; rd=1;   
    #5 addr=2'b10; rd=1; 
    #5 addr=2'b11; rd=1; 
    #5 addr=3'b111; rd=1; 
#5 $finish;
end
endmodule