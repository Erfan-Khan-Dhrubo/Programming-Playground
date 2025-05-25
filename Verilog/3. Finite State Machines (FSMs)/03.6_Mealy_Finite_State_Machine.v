// Mealy FSM: Output z = 1 if the last two inputs w were both 1
// Output depends on both the current state and input


module Mealy(clk, reset, w, z, y, Y);

    // Inputs
    input clk;    // Clock signal
    input reset;  // Asynchronous reset (active-low)
    input w;      // Input signal

    // Output
    output z;     // Output signal

    // State variables
    output reg y, Y;  // y = current state, Y = next state (1-bit each)

    // State encoding
    parameter A = 0,  // Initial state
              B = 1;  // Seen one '1', waiting for another

    // State transition block
    always @(posedge clk or negedge reset) 
    begin
        if (reset == 0)
            y = A;    // If reset is active (low), return to state A
        else begin
            y = Y;    // Update current state on rising clock edge
            casex (y)
                A: // In state A
                    if (w == 1) 
                        Y = B;   // If input is 1, go to state B
                    else 
                        Y = A;   // Else stay in A
                B: // In state B
                    if (w == 1) 
                        Y = B;   // If input is again 1, stay in B
                    else 
                        Y = A;   // If input is 0, reset to A
            endcase
        end
    end

    // Output logic (Mealy style: depends on both state and input)
    assign z = ((y == B) & (w == 1));  
    // Output z = 1 if current state is B and current input is 1

endmodule
