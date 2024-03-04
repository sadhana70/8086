TITLE sorting five numbers in ascending order
.model small
.stack 64h

.data
array db 4,7,5,1,3,'$'
newline db 13, 10, '$' ; New line characters for display

.code
main proc far
mov ax, @data
mov ds, ax

next:
mov si, offset array
mov bl,0
mov cx, 4

again:
mov al, [si]
inc si
cmp al,[si]
jc down
mov dl, [si]
mov [si],al
dec si
mov [si],dl
inc si
mov bl,01

down:
loop again
dec bl
jz next

mov ax,4c00h
int 21h

main endp
end main 