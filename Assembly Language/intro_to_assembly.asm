.MODEL SMALL
.STACK 100H

.DATA

; === Variables ===
    num1     DB 10        ; 8-bit value
    num2     DB 5         ; 8-bit value
    char1    DB 'A'       ; character
    msg1     DB 'Basic Ops Done$'       ; output message 1
    word1    DW 1234H     ; 16-bit value
    word2    DW 0002H     ; another 16-bit value
    msg2     DB 13,10,'16-bit MUL/DIV Done$'  ; newline + message 2

.CODE
MAIN PROC

; === Initialize DS ===
    MOV AX, @DATA
    MOV DS, AX 
    

; === MOV, ADD, SUB ===
    MOV AL, num1        ; AL = 10
    MOV BL, num2        ; BL = 5
    ADD AL, BL          ; AL = AL + BL = 15
    SUB AL, 3           ; AL = AL - 3 = 12
    

; === INC, DEC ===
    INC BL              ; BL = 6
    DEC BL              ; BL = 5 
    

; === NEG ===
    NEG BL              ; BL = -5 (two's complement) 
    

; === 8-bit MUL ===
    MOV AL, 4
    MOV BL, 3
    MUL BL              ; AX = AL * BL = 12  
    

; === 8-bit DIV ===
    MOV AX, 10
    MOV BL, 3
    DIV BL              ; AL = quotient, AH = remainder
    

; === 16-bit MUL ===
    MOV AX, word1       ; AX = 1234h
    MOV BX, word2       ; BX = 0002h
    MUL BX              ; DX:AX = AX * BX = 2468h
    

; === 16-bit DIV ===
    MOV DX, 0           ; Clear DX before 32-bit division
    MOV AX, 2468h       ; Load result back for division
    MOV BX, word2       ; BX = 2
    DIV BX              ; AX = quotient, DX = remainder
    

; === Word operations ===
    MOV AX, word1
    INC AX              ; AX = AX + 1
    DEC AX              ; AX = AX - 1
    

; === String output ===
    LEA DX, msg1        ; Load address of string
    MOV AH, 09h         ; DOS function to display string
    INT 21h 
    

; === 16-bit ops done message ===
    LEA DX, msg2
    MOV AH, 09h
    INT 21h 
    

; === Exit to DOS ===
MOV AX, 4C00H
INT 21H

MAIN ENDP
END MAIN

