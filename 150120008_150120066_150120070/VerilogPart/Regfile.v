module Regfile (
  input [0:4] select_register, reg_1, reg_2,
  input [0:17] data,
  input clck, reset_enable, write_enable,
  output reg [0:17] read_reg_1_value,
  output reg [0:17] read_reg_2_value
);

  reg [0:17] registers [0:15]; // 16 adet 18-bit register
  integer i; // integer türünde bir de?i?ken tan?mla

  always @(posedge clck or posedge reset_enable) begin
    if (reset_enable) begin
      // Tüm register'lar? s?f?rla
      for (i = 0; i < 16; i = i + 1) begin
        registers[i] <= 18'b0;
      end
    end
    else if (write_enable) begin
      // write_enable aktifse belirtilen register'a data de?erini yaz
      registers[select_register] <= data;
    end
  end

  always @(posedge clck) begin
    // reg_1 ve reg_2 register'lar?ndan oku
    read_reg_1_value <= registers[reg_1];
    read_reg_2_value <= registers[reg_2];
  end

endmodule

