`include "Decoder.v"

module controlunit(
    input [17:0] irAddress,
    output reg isAlu, isrammemory, isjump,iscmp, // Declare isjump as an output
    output reg add, and_, nand_, nor_, addi, andi, ld, st, cmp, jump, je, ja, jb, jae, jbe, reset
);
    wire [3:0] opcode;
  
    assign opcode = irAddress[17:14];
  
    always @*
    begin
        DecoderForOpcode(opcode[3:0], add, and_, nand_, nor_, addi, andi, ld, st, cmp, jump, je, ja, jb, jae, jbe, reset);
  
        if (add | and_ | nand_ | nor_ | addi | andi ) begin
            isrammemory = 1'b0;
            isAlu = 1'b1;
            isjump = 1'b0;
	    iscmp=1'b0;
        end
        else if (st | ld) begin
            isrammemory = 1'b0;
            isAlu = 1'b0;
            isjump = 1'b1;
	    iscmp=1'b0;
        end
	else if (cmp) begin
	    iscmp=1'b1;
            isrammemory = 1'b0;
            isAlu = 1'b0;
            isjump = 1'b0;
        end
        else if (jump | je | ja | jb | jae | jbe) begin
            isrammemory = 1'b1;
            isAlu = 1'b0;
            isjump = 1'b0;
	    iscmp=1'b0;
        end
        else begin
            isAlu = 1'b0;
            isrammemory = 1'b0;
            isjump = 1'b0;
	    iscmp=1'b0;
        end
    end
	

	
	






endmodule

