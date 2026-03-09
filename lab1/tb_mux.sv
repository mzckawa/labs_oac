`timescale 1ns/1ps

module tb_mux;

logic [9:0]count; 
logic [31:0]mux_out;

mux dut(.f (mux_out),
	.a ({{16{count[1]}},{16{count[0]}}}),
	.b ({{16{count[3]}},{16{count[2]}}}),
	.c ({{16{count[5]}},{16{count[4]}}}),
	.d ({{16{count[7]}},{16{count[6]}}}),
	.sel_1 (count[9]), .sel_0 (count[8]));

initial begin 
    $monitor ($time, " a = %d | b = %d | c = %d | d = %d | sel_1 = %b | sel_0 = %b | mux_out = %d",
	({{16{count[1]}},{16{count[0]}}}),
	({{16{count[3]}},{16{count[2]}}}),
	({{16{count[5]}},{16{count[4]}}}),
	({{16{count[7]}},{16{count[6]}}}),
	count[9], count[8], mux_out);

    for(count = 0; count != 10'b11111111111; count++) #10;
    #10 $stop;
end 

endmodule: tb_mux
