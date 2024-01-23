module Mux_Alu (
  input  [1:0] whichalu,
  input  [17:0] input_0, input_1, input_2, input_3,
  output reg [17:0] out
);

    always @ (input_0 or input_1 or input_2 or input_3 or whichalu)
    begin
	if(whichalu== 2'b00)
	   out=input_0;
	if(whichalu== 2'b01)
	   out=input_1;
	if(whichalu== 2'b10)
	   out=input_2;
	if(whichalu== 2'b11)
	   out=input_3;
    end

endmodule

// bu alu içindi 
// 4 bitlik alan var adresleri secmek icin dst mi str mi 

module Mux_4bit (
  input  select,
  input  [3:0] src1_op1,
  input  [3:0] dst_src,
  output reg [3:0] out
);

    always @ (select or src1_op1 or dst_src)
    begin
        if (select == 1'b0)
            out = src1_op1;
        else
            out = dst_src;
    end

endmodule


// 18 bitlik alan var rege yazarken aludan m? ramden mi geldi diye
// 18 bitlik bi daha var addi mi add mi diye

module Mux_18bit (
  input wire select,
  input wire [17:0] input_1, //src2value ve datafromram
  input wire [17:0] input_2, //immvalue ve aluresult
  output reg [17:0] out //isalu ve isimm
);

    always @ (select or input_1 or input_2)
    begin
        if (select == 1'b0)
            out = input_1;
        else
            out = input_2;
    end

endmodule



// read regde 4bitlik seçti?in select var 18 bitlik 16 registerdan data gelebilir

module Mux_16x1 (
  input wire [3:0] select,
  input wire [17:0] input_0, input_1, input_2, input_3, input_4, input_5, input_6, input_7,
                   input_8, input_9, input_10, input_11, input_12, input_13, input_14, input_15,
  output reg [17:0] out
);

    always @ (select or input_0 or input_1 or input_2 or input_3 or input_4 or input_5 or input_6 or
              input_7 or input_8 or input_9 or input_10 or input_11 or input_12 or input_13 or input_14 or input_15)
    begin
	if(select== 4'b0000)
	   out=input_0;
	if(select== 4'b0001)
	   out=input_1;
	if(select== 4'b0010)
	   out=input_2;
	if(select== 4'b0011)
	   out=input_3;
	if(select== 4'b0100)
	   out=input_4;
	if(select== 4'b0101)
	   out=input_5;
	if(select== 4'b0110)
	   out=input_6;
	if(select== 4'b0111)
	   out=input_7;
	if(select== 4'b1000)
	   out=input_8;
	if(select== 4'b1001)
	   out=input_9;
	if(select== 4'b1010)
	   out=input_10;
	if(select== 4'b1011)
	   out=input_11;
	if(select== 4'b1100)
	   out=input_12;
	if(select== 4'b1101)
	   out=input_13;
	if(select== 4'b1110)
	   out=input_14;
	if(select== 4'b1111)
	   out=input_15;
	end
endmodule


module MuxForExtends (
  input [11:0] bit_1,
  input [11:0] bit_2,
  output reg [11:0] extendvalue,
  input select
);

  assign bit_1 = 12'b0;
  assign bit_2 = 12'b1;

  always @* begin
    if (select == 1'b0)
      extendvalue = bit_1;
    else
      extendvalue = bit_2;
  end

endmodule

