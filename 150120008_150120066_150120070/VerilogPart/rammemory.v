module Memory (
  input wire clk,
  input wire is_st,
  input wire memory_enable,
  input wire is_ld,
  input wire [0:9] address,
  input wire [0:17] data_in,
  output reg [0:17] data_out
);

  reg [17:0] memory [0:1023]; // 2^10 adres, her biri 18 bit geni?li?inde

  always @(posedge clk) begin
    if (memory_enable) begin
      if (is_st) begin
        memory[address] <= data_in;
      end else if (is_ld) begin
        data_out <= memory[address];
      end
    end
  end

endmodule

