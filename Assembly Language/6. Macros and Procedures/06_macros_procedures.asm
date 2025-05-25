.MODEL SMALL             ; Define a small memory model (separate code/data under 64KB)
.STACK 100H              ; Allocate 256 bytes of stack

.DATA                    ; Start of data segment

    nums        DB 3, 9, 5, 7, 4, 6, 1, 2, 8, 0      ; Array of 10 numbers
    valToCheck  DB 5                                 ; Value to search for in array
    msgFound    DB 13,10,'Value found.$'             ; Message if value is found
    msgNotFound DB 13,10,'Value NOT found.$'         ; Message if value is not found
    msgString   DB 13,10,'Printed from procedure.$'  ; Message for print procedure

.CODE                    ; Start of code segment

MAIN PROC                ; Start of main procedure

    MOV AX, @DATA        ; Load address of data segment into AX
    MOV DS, AX           ; Move AX into DS to access defined variables

    ; === Macro: Calculate factorial of 4 ===
    factorial 4          ; Calls macro to compute 4! (4 factorial), result in AX

    ; === Macro: Max of 2 values ===
    max2 7, 3            ; Calls macro to find max of 7 and 3, result in AL

    ; === Procedure: Print a string ===
    CALL PrintMsg        ; Call procedure to print a fixed message

    ; === Procedure: Find max of AL, BL, CL ===
    MOV AL, 3            ; Load 3 into AL (first number)
    MOV BL, 8            ; Load 8 into BL (second number)
    MOV CL, 6            ; Load 6 into CL (third number)
    CALL MaxOfThree      ; Call procedure to get max(AL, BL, CL) in AL

    ; === Procedure: Search for value in array ===
    CALL SearchArray     ; Check if valToCheck exists in nums array

    MOV AX, 4C00h        ; Prepare DOS interrupt to terminate program
    INT 21h              ; Return control to DOS
MAIN ENDP                ; End of main procedure

; ========== MACRO DEFINITIONS ==========

factorial MACRO n
    LOCAL loop           ; Declare local label for loop
    MOV AX, 1            ; Start AX as 1 (initial factorial result)
    MOV CX, n            ; Set loop counter to n
loop:
    MUL CX               ; AX = AX * CX (accumulate factorial)
    LOOP loop            ; Decrement CX and repeat until CX = 0
ENDM                     ; End of macro definition

max2 MACRO a, b
    MOV AL, a            ; Load first value into AL
    CMP AL, b            ; Compare AL with second value
    JG skip              ; If AL > b, skip MOV
    MOV AL, b            ; Otherwise, update AL with b
skip:                    ; Label to continue execution
ENDM                     ; End of max2 macro

; ========== PROCEDURE DEFINITIONS ==========

PrintMsg PROC
    LEA DX, msgString    ; Load address of string into DX
    MOV AH, 09h          ; DOS print string function
    INT 21h              ; Display string on screen
    RET                  ; Return from procedure
PrintMsg ENDP

MaxOfThree PROC
    CMP AL, BL           ; Compare AL and BL
    JG next              ; If AL > BL, skip next step
    MOV AL, BL           ; Else, set AL = BL (new max)
next:
    CMP AL, CL           ; Compare current max (AL) with CL
    JG done              ; If AL > CL, done
    MOV AL, CL           ; Else, set AL = CL (new max)
done:
    RET                  ; Return with max in AL
MaxOfThree ENDP

SearchArray PROC
    MOV CX, 10           ; Set loop counter to 10 (array length)
    LEA SI, nums         ; Load address of nums[] into SI
check:
    MOV AL, [SI]         ; Load current array value
    CMP AL, valToCheck   ; Compare with target value
    JE found             ; If equal, jump to found label
    INC SI               ; Move to next element
    LOOP check           ; Repeat for 10 elements

    ; Value not found
    LEA DX, msgNotFound  ; Load "not found" message
    JMP show             ; Jump to show result
found:
    LEA DX, msgFound     ; Load "found" message
show:
    MOV AH, 09h          ; DOS print string function
    INT 21h              ; Display result
    RET                  ; Return from procedure
SearchArray ENDP

END MAIN                 ; End of program
