
module DecoderForOpcode (
  input [3:0] select,
  output reg add,
  output reg and_,
  output reg nand_,
  output reg nor_,
  output reg addi,
  output reg andi,
  output reg ld,
  output reg st,
  output reg cmpjump,
  output reg je,
  output reg ja,
  output reg jb,
  output reg jae,
  output reg jbe,
  output reg reset
);

  always @*
  begin
    add      = (select == 4'b0001) ? 1 : 0;
    and_      = (select == 4'b0010) ? 1 : 0;
    nand_     = (select == 4'b0011) ? 1 : 0;
    nor_      = (select == 4'b0100) ? 1 : 0;
    addi     = (select == 4'b0101) ? 1 : 0;
    andi     = (select == 4'b0110) ? 1 : 0;
    ld       = (select == 4'b0111) ? 1 : 0;
    st       = (select == 4'b1000) ? 1 : 0;
    cmpjump  = (select == 4'b1001) ? 1 : 0;
    je       = (select == 4'b1010) ? 1 : 0;
    ja       = (select == 4'b1011) ? 1 : 0;
    jb       = (select == 4'b1100) ? 1 : 0;
    jae      = (select == 4'b1101) ? 1 : 0;
    jbe      = (select == 4'b1110) ? 1 : 0;
    reset    = (select == 4'b1111) ? 1 : 0;
  end

endmodule
