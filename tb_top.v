module tb_top;

    // Testbench signals
    logic [15:0] a;
    logic [15:0] b;
    logic [1:0]  op_code;
    logic [15:0] result;
    logic clk;

    // Instantiate the calculator module
    calculator calc (
        .clk(clk),
        .a(a),
        .b(b),
        .op_code(op_code),
        .result(result)
    );

    always #5 clk = ~clk;  // Toggle clock every 5 time units

    initial begin
        // Initialize clock signal
        clk = 0;

        // Test addition
        a = 16'd10;
        b = 16'd5;
        op_code = 2'b00; // Add
        #10;
        $display("Addition Result: %d", result);

        // Test subtraction
        op_code = 2'b01; // Subtract
        #10;
        $display("Subtraction Result: %d", result);

        // Test multiplication
        op_code = 2'b10; // Multiply
        #10;
        $display("Multiplication Result: %d", result);

        // Test division
        op_code = 2'b11; // Divide
        #10;
        $display("Division Result: %d", result);

        $finish;
    end
endmodule
