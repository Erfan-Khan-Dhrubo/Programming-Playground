.MODEL SMALL             ; Use small memory model (separate 64KB code and data)
.STACK 100H              ; Reserve 256 bytes of stack memory

.DATA                    ; Begin data segment
    msg1 DB 13,10,'Reversed string: $'        ; Message for reversed output
    msg2 DB 13,10,'The word is a palindrome.$'; Message if input is a palindrome
    msg3 DB 13,10,'The word is NOT a palindrome.$' ; Message if input is not
    str  DB 'LEVEL$', 0                       ; Input string (5 letters)
    rev  DB 6 DUP('$')                        ; Empty buffer to store reversed string

.CODE                    ; Begin code segment
MAIN PROC                ; Start of main procedure

    MOV AX, @DATA        ; Load address of data segment into AX
    MOV DS, AX           ; Set DS = AX to access data variables

; === 1. Swap two numbers using the stack ===
    MOV AX, 1234h        ; Load first value into AX
    MOV BX, 5678h        ; Load second value into BX
    PUSH AX              ; Push AX onto the stack
    PUSH BX              ; Push BX onto the stack
    POP AX               ; Pop top (BX) ? AX (now AX = 5678h)
    POP BX               ; Pop next (AX) ? BX (now BX = 1234h)
    ; Values swapped using stack

; === 2. Push 5 numbers and compute their sum ===
    MOV CX, 5            ; Counter = 5 numbers
    MOV SI, 0            ; SI used to simulate increasing values 1 to 5

SumLoopPush:
    MOV AX, SI           ; Load current index into AX
    ADD AX, 1            ; AX = 1 to 5
    PUSH AX              ; Push value onto the stack
    INC SI               ; SI++
    LOOP SumLoopPush     ; Decrement CX, repeat until CX = 0

    MOV CX, 5            ; Reset counter for popping
    MOV BX, 0            ; BX will store the total sum

SumLoopPop:
    POP AX               ; Pop one number from the stack into AX
    ADD BX, AX           ; Add AX to the total sum in BX
    LOOP SumLoopPop      ; Repeat 5 times

; === 3. Reverse a string using the stack ===
    LEA SI, str          ; Load address of input string into SI
    MOV CX, 5            ; We'll reverse 5 characters

ReversePush:
    MOV AL, [SI]         ; Load one character from str
    PUSH AX              ; Push it onto the stack (16-bit push)
    INC SI               ; Move to next character
    LOOP ReversePush     ; Push all characters to stack

    MOV CX, 5            ; Reset counter
    LEA DI, rev          ; DI points to rev[] for storing output

ReversePop:
    POP AX               ; Pop character from stack
    MOV [DI], AL         ; Store character in rev[]
    INC DI               ; Move to next character in rev
    LOOP ReversePop      ; Repeat 5 times

    LEA DX, msg1         ; Load "Reversed string:" message
    MOV AH, 09h
    INT 21h              ; Print the message

    LEA DX, rev          ; Load address of reversed string
    MOV AH, 09h
    INT 21h              ; Print the reversed string

; === 4. Palindrome check using stack ===
    LEA SI, str          ; SI points to input string
    MOV CX, 5            ; We'll check 5 characters

PushPal:
    MOV AL, [SI]         ; Load character from str
    PUSH AX              ; Push it onto the stack
    INC SI               ; Move to next character
    LOOP PushPal         ; Push all characters

    LEA SI, str          ; Reset SI to start of original string
    MOV CX, 5            ; Reset loop counter

CheckPal:
    POP BX               ; Pop one character from stack into BX
    MOV AL, [SI]         ; Load current character from original string
    CMP AL, BL           ; Compare with character popped from stack
    JNE NotPal           ; If mismatch, not a palindrome
    INC SI               ; Move to next character
    LOOP CheckPal        ; Repeat 5 times

    ; All matched — it's a palindrome
    LEA DX, msg2
    JMP ShowResult

NotPal:
    ; Mismatch found — not a palindrome
    LEA DX, msg3

ShowResult:
    MOV AH, 09h
    INT 21h              ; Print the result message

; === Exit program ===
    MOV AX, 4C00h        ; DOS function to terminate program
    INT 21h              ; Return control to DOS
MAIN ENDP
END MAIN
