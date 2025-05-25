// Vending Machine FSM for a 10 Taka product
// Accepts: 0, 5, 10, 20 Taka (encoded as 2-bit input)
// Outputs: Purchase signal and appropriate change
// FSM Type: Mealy (output depends on state + input)

module Vending_Machine_FSM_Code(clock, reset, cash_in, purchase, present_state, next_state, cash_return);

    // Input declarations
    input clock;                  // Clock signal
    input reset;                  // Asynchronous reset
    input [1:0] cash_in;          // 2-bit input representing money inserted

    // Output declarations
    output reg purchase;          // 1 = product dispensed
    output reg [1:0] cash_return; // 2-bit change returned
    output reg [1:0] present_state, next_state; // FSM state tracking

    // State definitions
    parameter [1:0] 
        state0 = 2'b00,  // Initial state (0 Taka)
        state1 = 2'b01,  // 5 Taka inserted
        state2 = 2'b10,  // (Unused, can be for 10 Taka)
        state3 = 2'b11;  // (Unused, can be for 15 Taka)

    // Constants for output encoding
    parameter 
        R0  = 2'b00, // Return 0 Taka
        R5  = 2'b01, // Return 5 Taka
        R10 = 2'b10, // Return 10 Taka
        R15 = 2'b11; // Return 15 Taka

    // FSM logic triggered on positive clock edge
    always @(posedge clock) begin
        // Reset condition: return to state0
        if (reset == 1) begin
            present_state = state0;
            next_state = state0;
        end
        else begin
            // Update the current state to the next state
            present_state = next_state;

            // FSM behavior based on the current state
            case (present_state)

                // ----- STATE 0: No money inserted -----
                state0: begin
                    case (cash_in)
                        2'b00: begin // 0 Taka
                            next_state   = state0;
                            purchase     = 0;
                            cash_return  = R0;
                        end
                        2'b01: begin // 5 Taka
                            next_state   = state1;
                            purchase     = 0;
                            cash_return  = R0;
                        end
                        2'b10: begin // 10 Taka
                            next_state   = state0;
                            purchase     = 1;  // Product given
                            cash_return  = R0;
                        end
                        2'b11: begin // 20 Taka
                            next_state   = state0;
                            purchase     = 1;  // Product given
                            cash_return  = R10; // Return 10 Taka
                        end
                    endcase
                end

                // ----- STATE 1: 5 Taka inserted -----
                state1: begin
                    case (cash_in)
                        2'b00: begin // Cancel: return 5 Taka
                            next_state   = state0;
                            purchase     = 0;
                            cash_return  = R5;
                        end
                        2'b01: begin // 5 + 5 = 10 Taka
                            next_state   = state0;
                            purchase     = 1;  // Product given
                            cash_return  = R0;
                        end
                        2'b10: begin // 5 + 10 = 15 Taka
                            next_state   = state0;
                            purchase     = 1;
                            cash_return  = R5;
                        end
                        2'b11: begin // 5 + 20 = 25 Taka
                            next_state   = state0;
                            purchase     = 1;
                            cash_return  = R15;
                        end
                    endcase
                end

                // Additional states (state2, state3) can be added for higher pricing tiers

            endcase
        end
    end
endmodule
