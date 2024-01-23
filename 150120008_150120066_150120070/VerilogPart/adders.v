

module OneBitAdder (
  input A,
  input B,
  input cin,
  output sum,
  output cout
);

  assign sum = (A ^ B) ^ cin;
  assign cout = ((A ^ B) & cin) | (A & B);

endmodule

module Adder_2_bits (
  input [1:0] bit_1, bit_2,
  input c_in,
  output [1:0] s,
  output c_out
);
  wire c0; // Ara ta??ma sinyalleri
  OneBitAdder birler (.A(bit_1[0]), .B(bit_2[0]), .cin(1'b1), .sum(s[0]), .cout(c0));
  OneBitAdder onlar (.A(bit_1[1]), .B(bit_2[1]), .cin(c0), .sum(s[1]), .cout(c_out));
endmodule

module Adder_4_bits (
  input [3:0] bit_1, bit_2,
  input c_in,
  output [3:0] s,
  output c_out
);
  wire  c0; // Ara ta??ma sinyalleri
  Adder_2_bits a_2_0 (.bit_1(bit_1[1:0]), .bit_2(bit_2[1:0]), .c_in(c_in), .s(s[1:0]), .c_out(c0));
  Adder_2_bits a_2_1 (.bit_1(bit_1[3:2]), .bit_2(bit_2[3:2]), .c_in(c0), .s(s[3:2]), .c_out(c_out));
endmodule

module Adder_8_bits (
  input [7:0] bit_1, bit_2,
  input c_in,
  output [7:0] s,
  output c_out
);
  wire  c0; // Ara ta??ma sinyalleri
  Adder_4_bits a_4_0 (.bit_1(bit_1[3:0]), .bit_2(bit_2[3:0]), .c_in(c_in), .s(s[3:0]), .c_out(c0));
  Adder_4_bits a_4_1 (.bit_1(bit_1[7:4]), .bit_2(bit_2[7:4]), .c_in(c0), .s(s[7:4]), .c_out(c_out));
endmodule

  module Adder_10_bits(
  input [9:0] bit_1,bit_2, 
  input c_in,
  output [9:0] s,
  output c_out

);
 wire  c0; // Ara ta??ma sinyalleri
   Adder_8_bits a_8 (.bit_1(bit_1[7:0]), .bit_2(bit_2[7:0]), .c_in(c_in), .s(s[7:0]), .c_out(c0));
   Adder_2_bits a_2 (.bit_1(bit_1[9:8]), .bit_2(bit_2[9:8]), .c_in(c0), .s(s[9:8]), .c_out(c_out));
endmodule

module Adder_16_bits (
  input [15:0] bit_1, bit_2,
  input c_in,
  output [15:0] s,
  output c_out
);
  wire  c0; // Ara ta??ma sinyalleri
  Adder_8_bits a_8_0 (.bit_1(bit_1[7:0]), .bit_2(bit_2[7:0]), .c_in(c_in), .s(s[7:0]), .c_out(c0));
  Adder_8_bits a_8_1 (.bit_1(bit_1[15:8]), .bit_2(bit_2[15:8]), .c_in(c0), .s(s[15:8]), .c_out(c_out));
endmodule

module Adder_18_bits (
  input [17:0] bit_1, bit_2,
  input c_in,
  output [17:0] s,
  output c_out
);
  wire  c0; // Ara ta??ma sinyalleri
  Adder_16_bits a_16 (.bit_1(bit_1[15:0]), .bit_2(bit_2[15:0]), .c_in(c_in), .s(s[15:0]), .c_out(c0));
  Adder_2_bits a_2 (.bit_1(bit_1[17:16]), .bit_2(bit_2[17:16]), .c_in(c0), .s(s[17:16]), .c_out(c_out));
endmodule

