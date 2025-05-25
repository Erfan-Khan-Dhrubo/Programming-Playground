// Moore FSM: Output z = 1 if the last two inputs w were both 1

module Moore(clk, reset, w, z, y, Y);

    // Inputs
    input clk;         // Clock signal
    input reset;       // Asynchronous reset (active high)
    input w;           // Input signal

    // Outputs
    output z;                  // Output signal
    output reg [1:0] y, Y;     // y = current state, Y = next state

    // State encoding using 2 bits
    parameter [1:0] A = 2'b00, // Initial state
                   B = 2'b01, // First 1 seen
                   C = 2'b10; // Two consecutive 1s seen (z=1)

    // Sequential logic: update state on rising edge of clock or reset
    always @(posedge clk or posedge reset) 
    begin
        if (reset == 1)
            y = A;     // Reset state to A
        else begin
            y = Y;     // Update current state from next state
            casex (y)
                // Transition logic based on current state and input w
                A: if (w == 1) 
                        Y = B;   // Move to B if w=1
                   else 
                        Y = A;   // Stay in A if w=0
                B: if (w == 1) 
                        Y = C;   // Move to C if another w=1
                   else 
                        Y = A;   // Otherwise reset to A
                C: if (w == 1) 
                        Y = C;   // Stay in C if w=1
                   else 
                        Y = A;   // Reset to A if w=0
            endcase
        end
    end

    // Moore-style output logic: output depends ONLY on current state
    assign z = (y == C);  // z = 1 only in state C

endmodule
