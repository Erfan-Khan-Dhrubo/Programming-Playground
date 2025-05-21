.MODEL SMALL        ; Use the small memory model: separate code and data, both under 64KB
.STACK 100H         ; Allocate 256 bytes for the stack

.DATA
    ; Declare string variables, each ending with '$' (used by INT 21h function 09h)
    promptChar     DB 'Please insert a character: $'
    promptDigit1   DB 13,10, 'Enter first digit (0-9): $'   ; 13 = Carriage Return, 10 = Line Feed
    promptDigit2   DB 13,10, 'Enter second digit (0-9): $'
    sumMsg         DB 13,10, 'The sum is: $'
    newline        DB 13,10, '$'       ; To create new lines
    upperPrompt    DB 13,10, 'Enter uppercase letter (A-Z): $'
    lowerMsg       DB 13,10, 'Lowercase version: $'
    hexPrompt      DB 13,10, 'Enter hex digit (A-F): $'
    decMsg         DB 13,10, 'In decimal it is: $'

.CODE
MAIN PROC

    ; =============== Setup ===============
    MOV AX, @DATA     ; Load data segment address into AX
    MOV DS, AX        ; Initialize DS to access .DATA segment variables

    ; ========== 1. Single Character Input and Output ==========

    LEA DX, promptChar   ; Load address of the prompt string into DX
    MOV AH, 09h          ; DOS function 09h: Display string at DS:DX until '$'
    INT 21h              ; Print: "Please insert a character: "

    MOV AH, 01h          ; DOS function 01h: Read single character from user
    INT 21h              ; AL now contains ASCII of the input character

    MOV DL, AL           ; Copy character to DL for printing
    MOV AH, 02h          ; DOS function 02h: Output single character in DL
    INT 21h              ; Show the input character on screen

    ; ========== Newline ==========

    LEA DX, newline      ; Load newline string (CR + LF) into DX
    MOV AH, 09h
    INT 21h              ; Move to new line   
    
    
    

    ; ========== 2. Arithmetic from User Input ==========

    LEA DX, promptDigit1
    MOV AH, 09h
    INT 21h              ; Prompt: "Enter first digit (0-9):"

    MOV AH, 01h
    INT 21h              ; Read character (e.g., '3'), ASCII stored in AL
    SUB AL, 30h          ; Convert ASCII to number: '3' - '0' = 3
    MOV BL, AL           ; Store the first digit in BL

    LEA DX, promptDigit2
    MOV AH, 09h
    INT 21h              ; Prompt: "Enter second digit (0-9):"

    MOV AH, 01h
    INT 21h              ; Read another character (e.g., '4')
    SUB AL, 30h          ; Convert ASCII to numeric value
    MOV BH, AL           ; Store second digit in BH

    ; Perform addition: sum = BL + BH
    MOV AL, BL
    ADD AL, BH           ; AL = BL + BH

    ADD AL, 30h          ; Convert numeric result back to ASCII for display

    LEA DX, sumMsg
    MOV AH, 09h
    INT 21h              ; Show: "The sum is: "

    MOV DL, AL
    MOV AH, 02h
    INT 21h              ; Display result (as ASCII character)

    ; ========== Newline ==========

    LEA DX, newline
    MOV AH, 09h
    INT 21h         
    
    
    

    ; ========== 3. Uppercase to Lowercase Conversion ==========

    LEA DX, upperPrompt
    MOV AH, 09h
    INT 21h              ; Prompt user: "Enter uppercase letter:"

    MOV AH, 01h
    INT 21h              ; AL = ASCII of uppercase input (e.g., 'C')

    ADD AL, 32           ; Convert to lowercase: 'A' + 32 = 'a'

    LEA DX, lowerMsg
    MOV AH, 09h
    INT 21h              ; Show: "Lowercase version:"

    MOV DL, AL
    MOV AH, 02h
    INT 21h              ; Display the lowercase letter

    ; ========== Newline ==========

    LEA DX, newline
    MOV AH, 09h
    INT 21h
                 
                 
                 
                 
    ; ========== 4. Hex Digit (A–F) to Decimal Conversion ==========

    LEA DX, hexPrompt
    MOV AH, 09h
    INT 21h              ; Prompt: "Enter hex digit (A-F):"

    MOV AH, 01h
    INT 21h              ; AL = ASCII of hex digit (e.g., 'C')

    SUB AL, 'A'          ; 'A' = 0, 'B' = 1, ..., 'F' = 5
    ADD AL, 10           ; Convert to decimal: A = 10, B = 11, ..., F = 15

    ADD AL, 30h          ; Convert result back to ASCII to print

    LEA DX, decMsg
    MOV AH, 09h
    INT 21h              ; Display: "In decimal it is:"

    MOV DL, AL
    MOV AH, 02h
    INT 21h              ; Show the decimal value (as ASCII)    
    
    
    

    ; ========== Exit Program ==========

    MOV AX, 4C00h        ; Return control to DOS
    INT 21h

MAIN ENDP
END MAIN
