.MODEL SMALL             ; Define memory model as SMALL (separate segments for code and data, each under 64KB)
.STACK 100H              ; Allocate 256 bytes of stack space

.DATA                    ; Begin data segment

    ; Strings for various outputs
    msgPositive    DB 13,10, 'AX is positive or zero.$'
    msgReplaced    DB 13,10, 'AX was negative. Replaced with 5.$'
    msgGreater     DB 13,10, 'AL is greater than BL.$'
    msgLess        DB 13,10, 'AL is less than BL.$'
    msgEqual       DB 13,10, 'AL equals BL.$'
    msgVowel       DB 13,10, 'It is a vowel.$'
    msgConsonant   DB 13,10, 'It is a consonant.$'
    newline        DB 13,10, '$'            ; Newline (CR + LF)

.CODE                    ; Begin code segment

MAIN PROC                ; Start of main procedure

    ;===========================
    ; Step 1: Initialize Data Segment
    ;===========================
    MOV AX, @DATA         ; Load address of data segment into AX
    MOV DS, AX            ; Initialize DS to access variables in the .DATA section

    ;===========================
    ; Step 2: IF-THEN structure
    ; Replace AX with 5 if AX < 0
    ;===========================
    MOV AX, -7            ; Simulate a negative number in AX
    CMP AX, 0             ; Compare AX with 0 ? sets flags based on (AX - 0)
    JGE AX_Positive       ; Jump to AX_Positive if AX >= 0 (i.e., no need to replace)

    ; If AX < 0, this block executes
    MOV AX, 5             ; Replace negative AX with 5
    LEA DX, msgReplaced   ; Load message address into DX
    MOV AH, 09h           ; DOS function 09h: print string
    INT 21h               ; Call interrupt to display: "AX was negative. Replaced with 5"
    JMP After_AX_Check    ; Skip the "positive" block

AX_Positive:             
    ; If AX >= 0, this block runs
    LEA DX, msgPositive   ; Load message: "AX is positive or zero"
    MOV AH, 09h
    INT 21h

After_AX_Check:
    ; Print a newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ;===========================
    ; Step 3: IF-THEN-ELSE structure
    ; Compare AL and BL
    ;===========================
    MOV AL, 5             ; Assign value to AL
    MOV BL, 5             ; Assign value to BL
    CMP AL, BL            ; Compare AL with BL ? sets flags

    JE AL_Equal           ; Jump if AL == BL
    JG AL_Greater         ; Jump if AL > BL
    JL AL_Less            ; Jump if AL < BL

AL_Equal:
    ; If AL == BL
    LEA DX, msgEqual      ; Load message: "AL equals BL"
    MOV AH, 09h
    INT 21h
    JMP After_Comparison

AL_Greater:
    ; If AL > BL
    LEA DX, msgGreater
    MOV AH, 09h
    INT 21h
    JMP After_Comparison

AL_Less:
    ; If AL < BL
    LEA DX, msgLess
    MOV AH, 09h
    INT 21h

After_Comparison:
    ; Print a newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ;===========================
    ; Step 4: CASE structure simulation
    ; Check if AL is a vowel (A, E, I, O, U)
    ;===========================
    MOV AL, 'E'           ; Simulate character input ? AL = ASCII of 'E'

    CMP AL, 'A'           ; Is AL = 'A'?
    JE IsVowel
    CMP AL, 'E'           ; Is AL = 'E'?
    JE IsVowel
    CMP AL, 'I'           ; Is AL = 'I'?
    JE IsVowel
    CMP AL, 'O'           ; Is AL = 'O'?
    JE IsVowel
    CMP AL, 'U'           ; Is AL = 'U'?
    JE IsVowel

    ; Default: Not a vowel ? consonant
    LEA DX, msgConsonant  ; Load "It is a consonant"
    MOV AH, 09h
    INT 21h
    JMP End_VowelCheck

IsVowel:
    ; If any vowel matched
    LEA DX, msgVowel      ; Load "It is a vowel"
    MOV AH, 09h
    INT 21h

End_VowelCheck:
    ; Print a newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ;===========================
    ; Step 5: Exit Program
    ;===========================
    MOV AX, 4C00h         ; DOS terminate program call
    INT 21h

MAIN ENDP
END MAIN
