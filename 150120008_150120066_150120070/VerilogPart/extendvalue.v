
module ExtendValue (
  input [0:5] inp,
  output reg [0:17] out
);

  always @* begin
    out[0:5] = inp[0:5];
    if (inp[5] == 1'b0)
      out[6:17] = 12'b0;
    else
      out[6:17] = 12'b1;
  end

endmodule
