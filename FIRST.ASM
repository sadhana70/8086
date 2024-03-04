.model small
.stack 64h
.data
string db 'hello, world','$'

.code
main proc far

mov ax,@data
mov ds, ax
lea dx, string
mov ah,09h
int 21h

mov ax, 4c00h
int 21h
main endp
end main
