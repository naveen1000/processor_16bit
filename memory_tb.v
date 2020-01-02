module memory_tb;
    reg [7:0]maddr,mwr_data;
    reg mrd,mwr;
    wire [15:0]data;
    integer i;

memory RegUT(maddr,mrd,mwr,mwr_data,data);

initial
begin
$monitor ($time," addr=%d, data=%b ",maddr,data);
    
    #5 maddr=8'h00; mwr=1;mwr_data=8'h00;  
    #5 mwr=0; 
    #5 maddr=8'h01; mwr=1; mwr_data=8'h01;  
    #5 mwr=0;
    #5 maddr=8'h01; mrd=1; 
    #5 maddr=8'h00; mrd=1; 

#5 $finish;
end
endmodule