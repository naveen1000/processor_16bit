module inst_reg_tb;
reg [1:0]pc;
reg en;
wire [16:0]ir_data;
inst_reg IUT(pc,en,ir_data);
initial
begin
$monitor ($time," addr=%d, ir_data=%b ",pc,ir_data);
    
    #5 pc=2'b11; en=1; 

#5 $finish;
end
endmodule