.MODEL SMALL             ; Use small memory model: separate segments for code and data
.STACK 100H              ; Allocate 256 bytes for the stack

.DATA
    byteArray     DB 10 DUP(?)        ; Declare a 10-element BYTE array, uninitialized
    reverseArray  DB 10 DUP(?)        ; Array to store reversed values
    copyArray     DB 10 DUP(?)        ; Array to store copied values
    msg           DB 13,10, 'Result: $' ; Newline + label for displaying results

.CODE
MAIN PROC

    MOV AX, @DATA         ; Load address of data segment into AX
    MOV DS, AX            ; Initialize DS with AX to access variables

; === Input 10 values into byteArray ===
    MOV CX, 10            ; Set loop counter to 10
    MOV SI, 0             ; Use SI as index for array

input_loop:
    MOV AH, 01h           ; DOS interrupt function to read one character
    INT 21h               ; Read from keyboard ? result in AL
    SUB AL, 30h           ; Convert ASCII digit ('0'–'9') to number
    MOV byteArray[SI], AL ; Store the value at byteArray[SI]
    INC SI                ; Move to next index
    LOOP input_loop       ; Decrement CX and repeat if not zero

; === Sum array ===
    MOV CX, 10            ; Set loop counter to 10
    MOV SI, 0             ; Reset index
    MOV AL, 0             ; AL will accumulate the sum

sum_loop:
    ADD AL, byteArray[SI] ; Add current value to AL
    INC SI                ; Move to next index
    LOOP sum_loop         ; Repeat until CX = 0

    ADD AL, 30h           ; Convert sum to ASCII for display
    LEA DX, msg           ; Load address of "Result: " message
    MOV AH, 09h           ; DOS function to print string
    INT 21h
    MOV DL, AL            ; Move ASCII result into DL
    MOV AH, 02h           ; Function to print a single character
    INT 21h

; === Reverse array ===
    MOV CX, 10            ; Loop counter for 10 elements
    MOV SI, 0             ; Start of source array
    MOV DI, 9             ; Start at end of destination array

rev_loop:
    MOV AL, byteArray[SI]    ; Load from source
    MOV reverseArray[DI], AL ; Store in reverse order
    INC SI                   ; Move forward in source
    DEC DI                   ; Move backward in destination
    LOOP rev_loop

; === Copy array ===
    MOV CX, 10            ; Loop for 10 elements
    MOV SI, 0             ; Index for both source and destination

cpy_loop:
    MOV AL, byteArray[SI] ; Load value
    MOV copyArray[SI], AL ; Store to same index in copyArray
    INC SI
    LOOP cpy_loop

; === Find Max & Min ===
    MOV CX, 10
    MOV SI, 0
    MOV AL, byteArray[SI] ; Load first element
    MOV BL, AL            ; Assume max = first value
    MOV BH, AL            ; Assume min = first value
    INC SI

cmp_loop:
    MOV AL, byteArray[SI] ; Load next value
    CMP AL, BL
    JG set_max            ; If AL > max ? update max
    CMP AL, BH
    JL set_min            ; If AL < min ? update min
    JMP skip_cmp

set_max: MOV BL, AL       ; Update max
         JMP skip_cmp

set_min: MOV BH, AL       ; Update min

skip_cmp:
    INC SI
    LOOP cmp_loop

; === Even numbers from array ===
    MOV CX, 10            ; Loop for 10 elements
    MOV SI, 0

even_loop:
    MOV AL, byteArray[SI] ; Load value
    MOV AH, 0             ; Clear AH for 8-bit divide
    MOV BL, 2
    DIV BL                ; AL / 2 ? remainder in AH
    CMP AH, 0             ; Is remainder 0?
    JNZ skip_even         ; If not zero, not even ? skip
    MOV AL, byteArray[SI] ; Load original value
    ADD AL, 30h           ; Convert to ASCII
    MOV DL, AL
    MOV AH, 02h
    INT 21h               ; Print even number
skip_even:
    INC SI
    LOOP even_loop

; === Odd numbers from array ===
    MOV CX, 10
    MOV SI, 0

odd_loop:
    MOV AL, byteArray[SI]
    MOV AH, 0
    MOV BL, 2
    DIV BL
    CMP AH, 1             ; Is remainder 1?
    JNZ skip_odd          ; If not, skip
    MOV AL, byteArray[SI]
    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h               ; Print odd number
skip_odd:
    INC SI
    LOOP odd_loop

; === Exit Program ===
    MOV AX, 4C00h         ; DOS terminate program
    INT 21h

MAIN ENDP
END MAIN

