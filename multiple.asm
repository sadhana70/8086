.model small
.stack 32
.data
ten dw 10

.code 
main proc far
mov ax,@data
mov ds,ax

mov ah,01
int 21H

mov ah,0ah
int 21H
mov ah,0dh
int 21h

sub al,'0'
mov dl,01
mov cx,10


mainstart:
push cx
mov ah,0
push ax
push dx
mul dl

mov cx,00


table:
mov dx,00H
div ten
inc cx
add dx,30h
push dx
cmp ax ,00H
je l3
jmp table

l3:
pop dx
mov ah,02h
int 21H
loop l3


mov ah,02h
mov dl,' '
int 21H

pop dx
pop ax

pop cx
inc dl
loop mainstart
mov ax,4c00h
int 21H
main endp
end main