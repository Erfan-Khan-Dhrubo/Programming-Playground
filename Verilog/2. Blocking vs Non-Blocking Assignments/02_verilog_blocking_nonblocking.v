module verilog_lab3_blocking_nonblocking(
    input wire clk,        // Clock input for sequential logic
    input wire rst,        // Reset signal
    input wire [3:0] w,    // 4-bit vector input for encoder and mux
    input wire [1:0] sel,  // 2-bit select input for the 4:1 mux
    output wire f_mux,     // Output of the multiplexer
    output reg [1:0] y_enc, // Output from the priority encoder
    output reg [3:0] shift_demo // Output showing shift register behavior
);


// ---------------------------
// 1. Wire vs Reg + Assign
// ---------------------------

wire temp_and;              // Declare a wire (net type)
// Wire is used for concurrent logic and connections between components

assign temp_and = w[0] & w[1]; // Bitwise AND of w[0] and w[1], evaluated in parallel
// This is a concurrent assignment, evaluated at all times


// ---------------------------
// 2. 4:1 Multiplexer using case
// ---------------------------

reg mux_out;           // A reg is needed since we're assigning it in an always block
assign f_mux = mux_out; // Drive the output wire with the value from mux_out


always @(*) begin             // Always block that reacts to changes in any signal inside
    case (sel)                // Based on the value of sel (2 bits)
        2'b00: mux_out = w[0]; // If sel = 00, pick w[0]
        2'b01: mux_out = w[1]; // If sel = 01, pick w[1]
        2'b10: mux_out = w[2]; // If sel = 10, pick w[2]
        2'b11: mux_out = w[3]; // If sel = 11, pick w[3]
        default: mux_out = 1'b0; // Default fallback in case of x or z
    endcase
end


// ---------------------------
// 3. 4-to-2 Priority Encoder using casex
// Priority: w[3] > w[2] > w[1] > w[0]
// ---------------------------

always @(*) begin       // Combinational logic
    casex (w)           // casex treats x and z as don't care (for pattern matching)
        4'b1xxx: y_enc = 2'b11;  // w[3] is 1 ? highest priority
        4'b01xx: y_enc = 2'b10;  // w[2] is 1 ? second highest
        4'b001x: y_enc = 2'b01;  // w[1] is 1
        4'b0001: y_enc = 2'b00;  // w[0] is 1 ? lowest priority
        default: y_enc = 2'b00;  // If all inputs are 0
    endcase
end


// ---------------------------
// 4. Blocking vs Non-blocking assignment
// Sequential logic with shifting pattern
// ---------------------------

always @(posedge clk or posedge rst) begin
    if (rst) begin
        shift_demo <= 4'b1001;  // On reset, set initial value
    end else begin
        // Demonstrates NON-BLOCKING assignments
        shift_demo[3] <= shift_demo[2];  // bit[3] gets bit[2]
        shift_demo[2] <= shift_demo[1];  // bit[2] gets bit[1]
        shift_demo[1] <= shift_demo[0];  // bit[1] gets bit[0]
        shift_demo[0] <= shift_demo[3];  // bit[0] gets old bit[3] (before update)
    end
end


endmodule // End of lab3_all_concepts module
