`include "AdderAll.v"
`include "mux.v"

module aluselect (
    input wire [17:0] R1,
    input wire [17:0] R2,
    input wire [1:0] alu_op_type,
    output wire [17:0] result,
    output wire cout
);

    wire [17:0] add_result, and_result, nand_result, nor_result;

    Adder_18_bits adder (.bit_1(R1), .bit_2(R2), .c_in(1'b0), .s(add_result), .c_out(cout));

    assign and_result = R1 & R2;
    assign nand_result = ~(R1 & R2);
    assign nor_result = ~(R1 | R2);

    Mux_Alu m1 (
        .whichalu(alu_op_type),
        .input_0(add_result),
        .input_1(and_result),
        .input_2(nand_result),
        .input_3(nor_result),
        .out(result)
    );

endmodule

