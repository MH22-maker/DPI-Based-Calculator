import "DPI-C" function void calculator_wrapper(
    input logic [15:0] a,
    input logic [15:0] b,
    input logic [1:0]  op_code,
    output logic [15:0] result
);

module calculator (
    input  clk     ,
    input  [15:0] a,
    input  [15:0] b,
    input  [1:0]  op_code, //(00: Add, 01: Subtract, 10: Multiply, 11: Divide)
    output reg [15:0] result
);

always @(posedge clk) begin
    calculator_wrapper(a, b, op_code, result);
end
endmodule