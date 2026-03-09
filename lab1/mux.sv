module mux
  (
    output logic [31:0]f,
    input  logic [31:0]a, [31:0]b, [31:0]c, [31:0]d, 
    input logic sel_1, sel_0
  ); 

  assign n_sel_1 = ~sel_1;
  assign n_sel_0 = ~sel_0;

  assign f = (a & {32{n_sel_1 & n_sel_0}}) |
(b & {32{n_sel_1 & sel_0}}) | 
(c & {32{sel_1 & n_sel_0}}) |
(d & {32{sel_1 & sel_0}});

endmodule
