.MODEL SMALL
.STACK 100H

.DATA
    newline     DB 13, 10, '$'
    prompt1     DB 'Enter characters (press space to stop): $'
    msgEven     DB 13,10, 'Even numbers between 1 and 10:$'
    promptHex   DB 13,10, 'Enter a hex digit (0-9, A-F): $'
    invalid     DB 13,10, 'Invalid input. Try again.$'
    askRepeat   DB 13,10, 'Do you want to try again? (Y/N): $'
    msgLeap     DB 13,10, 'Leap year.$'
    msgNotLeap  DB 13,10, 'Not a leap year.$'
    msgRow      DB 13,10, 'Pattern Output:$'

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

; ========== 1. EXPLICIT LOOP (Print 0 to 4) ==========
    MOV DL, 30H          ; Start with ASCII '0'
PrintLoop:
    CMP DL, 35H          ; Check if DL >= ASCII '5'
    JGE EndPrintLoop     ; Exit if DL >= '5'
    MOV AH, 02h
    INT 21h              ; Print character in DL
    INC DL
    JMP PrintLoop

EndPrintLoop:
    LEA DX, newline
    MOV AH, 09h
    INT 21h              ; Newline

; ========== 2. IMPLICIT LOOP (Print 0 to 4 using LOOP) ==========
    MOV DL, 30H          ; Start again at ASCII '0'
    MOV CX, 5            ; Loop 5 times
LoopPrint:
    MOV AH, 02h
    INT 21h
    INC DL
    LOOP LoopPrint

    LEA DX, newline
    MOV AH, 09h
    INT 21h              ; Newline

; ========== 3. REPEAT-UNTIL LOOP (Echo input until space) ==========
    LEA DX, prompt1
    MOV AH, 09h
    INT 21h

RepeatInput:
    MOV AH, 01h          ; Read char
    INT 21h
    MOV DL, AL
    MOV AH, 02h          ; Echo char
    INT 21h
    CMP AL, 20h          ; Check if space was pressed
    JNE RepeatInput

    LEA DX, newline
    MOV AH, 09h
    INT 21h

; ========== 4. Nested Loop: Print Pattern ==========
    MOV CX, 5            ; Number of rows
    LEA DX, msgRow
    MOV AH, 09h
    INT 21h

OuterLoop:
    PUSH CX              ; Save outer loop counter
    MOV BL, 1            ; Start number
    MOV CL, 5
    SUB CL, CH           ; Print row = 6 - CX
InnerLoop:
    CMP BL, CL
    JG EndInner
    MOV DL, BL
    ADD DL, 30h
    MOV AH, 02h
    INT 21h
    MOV DL, ' '
    INT 21h
    INC BL
    JMP InnerLoop
EndInner:
    POP CX
    LEA DX, newline
    MOV AH, 09h
    INT 21h
    LOOP OuterLoop

; ========== 5. Summation (1 to 100 based on divisible condition) ==========
    MOV CX, 100
    MOV SI, 0            ; M = divisible sum
    MOV DI, 0            ; N = non-divisible sum
    MOV BX, 5            ; Assume '5' is last non-zero digit

SumLoop:
    MOV AX, 101
    SUB AX, CX           ; AX = current number
    MOV DX, 0
    DIV BX               ; AX / BX ? remainder in DX
    CMP DX, 0
    JE AddToSI
    ADD DI, AX
    JMP SkipAdd
AddToSI:
    ADD SI, AX
SkipAdd:
    LOOP SumLoop

; ========== 6. End ==========
    MOV AX, 4C00h
    INT 21h

MAIN ENDP
END MAIN
