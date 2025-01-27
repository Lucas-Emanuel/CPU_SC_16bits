module Pipeline_Stage4
(
    input clk,
    input rst,

    input logic reg_we_in,
	input logic store_pc_in,
    output logic reg_we_out,
	output logic store_pc_out,

    input mux_in,
    output mux_out,

    input wire logic[4:0] wa_in,
    output wire logic[4:0] wa_out,
);

always_ff@(posedge clk or negedge rst) begin
    if (!rst) begin
        mux_out <= '0;
        wa_out <= '0;
    end
    else if (clk) begin
        mux_out <= mux_in;
        wa_out <= wa_in;
    end
end

endmodule