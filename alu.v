`timescale 1ns/1ps

module alu (
input [7:0] a,
input [7:0] b,
input [2:0] sel,
output reg [7:0] result,
output reg carry,
output reg zero
);

always @(*) begin
carry = 0;

```
case(sel)
    3'b000: {carry, result} = a + b;
    3'b001: {carry, result} = a - b;
    3'b010: result = a & b;
    3'b011: result = a | b;
    3'b100: result = a ^ b;
    3'b101: result = a << 1;
    3'b110: result = a >> 1;
    default: result = 8'b00000000;
endcase

// Zero flag
zero = (result == 8'b00000000) ? 1 : 0;
```

end

endmodule

