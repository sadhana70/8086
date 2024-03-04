;Write a program that takes a string and count the no of vowels in the string. Display the count in decimal format.

TITLE VOWEL IN A STRING
.MODEL SMALL
.DATA
STRLEN DB 80
STRSZ DB ?
STR DB 81 DUP('$')
.STACK
.CODE

MAIN PROC FAR
MOV AX, @DATA
MOV DS, AX

;; GETTING THE NUMBER
LEA DX, STRLEN
MOV AH, 0AH
INT 21H

;; CALCULATING THE NUM OF WORD
MOV AX, 00
MOV CH, 00
MOV CL, STRSZ
LEA BX, STR

L2: CMP BYTE PTR[BX], 'a'
JE AD
CMP BYTE PTR[BX], 'e'
JE AD
CMP BYTE PTR[BX], 'i'
JE AD
CMP BYTE PTR[BX], 'o'
JE AD
CMP BYTE PTR[BX], 'u'
JE AD
CMP BYTE PTR[BX], 'A'
JE AD
CMP BYTE PTR[BX], 'E'
JE AD
CMP BYTE PTR[BX], 'I'
JE AD
CMP BYTE PTR[BX], 'O'
JE AD
CMP BYTE PTR[BX], 'U'
JE AD
JMP EX

AD: INC AX
EX: INC BX

LOOP L2

;; CONVERTING TO DECIMAL
MOV CX, 00
MOV BX, 10

L3: MOV DX, 00
INC CX
DIV BX
CMP AX, 00
PUSH DX
JG L3

;; PRINTING IN DECIMAL
;; NEW LINE CHARACTER
MOV AH, 02H
MOV DL, 0AH
INT 21H

DIS: POP DX
OR DX, 30H
MOV AH, 02H
INT 21H
LOOP DIS

;; ENDING PROGRAM
MOV AH, 4CH
INT 21H
MAIN ENDP

END MAIN