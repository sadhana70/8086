.model small
.stack 100h

.data
    msg db 'Enter a number: $'
    result db 15h

.code
main:
    
    mov ax, @data
    mov ds, ax

    ; Display message to enter a number
    mov ah, 09h
    lea dx, msg
    int 21h

    ; Read the number from the user
    mov ah, 01h
    int 21h
    sub al, 30h  ; Convert ASCII to numeric value

    ; Compute factorial
    mov bl, al   ; Save the number
    mov cx, 1    ; Initialize factorial counter
    mov ax, 1    ; Initialize result

factorial_loop:
    mul cx       ; Multiply result by counter
    inc cx       ; Increment counter
    cmp cl, bl   ; Compare counter with the number
    jle factorial_loop ; Jump if counter is less than or equal to the number

    ; Display the result
    mov ah, 09h
    lea dx, result
    int 21h

    ; Display the factorial value
    mov ax, dx   ; Move the address of the result message into DX
    mov bx, 10   ; Set up to divide by 10 for digit extraction

display_loop:
    xor dx, dx   ; Clear any previous remainder
    div bx       ; Divide AX by 10
    add dl, '0'  ; Convert remainder to ASCII
    push dx      ; Save the digit
    cmp ax, 0    ; Check if quotient is zero
    jnz display_loop ; If not, continue

    ; Display the digits in reverse order to get the factorial
pop_loop:
    pop dx       ; Get the next digit
    mov ah, 02h
    int 21h
    cmp sp, bp   ; Check if the stack is empty
    jnz pop_loop ; If not, continue

    ; Terminate program
    mov ax, 4c00h
    int 21h

end main
