TITLE to add two numbers
.MODEL SMALL
.STACK 32

.DATA
VAL1 DW 1234H
VAL2 DW 2345H
SUM DW ?

.CODE
MAIN PROC FAR
MOV AX,@DATA
MOV DS,AX
MOV AX,VAL1
ADD AX,VAL2
MOV SUM,AX
MOV AX,4C00H
INT 21H

MAIN ENDP
END MAIN