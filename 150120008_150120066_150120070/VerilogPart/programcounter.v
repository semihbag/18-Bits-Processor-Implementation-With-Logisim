

// ProgramCounter.v
module ProgramCounter (
  input wire clk,
  input wire rst,
  input wire is_jump,
  input wire pc_enable,
  input wire next,
  input wire [9:0] address_input,
  output reg [9:0] current_address
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      current_address <= 10'b0;
    end else begin
      if (is_jump) begin
        current_address <= current_address+address_input;
      end else if (pc_enable && next) begin
        current_address <= current_address + 1;
      end
    end
  end

endmodule

