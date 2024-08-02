module InterruptController
#(
    localparam NUM_INT = 16
)
(
    input  logic              clk   ,
    input  logic              rst   ,
    input  logic[NUM_INT:0]   ier_in,
    input  logic[NUM_INT-1:0] ifr_in,
    input  logic[15:0]        rtrn_addr_in,
    input  logic              end_routine,
    output logic              enable,
    output logic[15:0]        addr_out
);

logic [NUM_INT:0]   ier_out;
logic [NUM_INT-1:0] ifr_out;
logic [NUM_INT-1:0] excpt_en;
logic [NUM_INT-1:0] rtrn_addr_out;

Reg #(.WIDTH(NUM_INT + 1)) IER (
    .clk,
    .rst,
    .in(ier_in),
    .out(ier_out)
);

Reg #(.WIDTH(NUM_INT)) IFR (
    .clk,
    .rst,
    .in(ifr_in),
    .out(ier_out)
);

Reg #(.WIDTH(16)) ReturnAddr (
    .clk,
    .rst,
    .input(rtrn_addr_in),
    .output(rtrn_addr_out)
);

CounterMem #(.NUM_EXC(NUM_INT)) HandlerAddrMem (
    .clk,
    .rst,
    .excpt_en,
    .excpt_addr(handler_addr)
);

always_comb begin

    excpt_en[NUM_INT-1:0] = (ier_out[NUM_INT-1:0] & ifr_out[NUM_INT-1:0]);
    enable = ier_out[NUM_INT];

    if(end_routine == '1) begin
        addr_out = rtrn_addr_out;
    end
    else begin
        addr_out = handler_addr;
    end

end

endmodule