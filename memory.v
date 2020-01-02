module memory(
    input[7:0]addr,
    input rd,wr,
    input [7:0]mwr_data,
    output reg [15:0]data);
    
reg [15:0] mem[0:256];

initial 
begin
    $readmemb("machine_code.mem",mem);
end

always @(*)
begin
    if(rd)
        data=mem[addr];
end
always @(*)
begin
    if(wr)
    begin
        mem[addr]=mwr_data;
        $display("data=%d",mwr_data);
        #5$writememb("memory_binary.txt", mem);
    end   
end


//assign data_out=r[addr];

endmodule // memory module
