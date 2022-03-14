@ Expand to five logos
arepl_020C76D4:
    mov r1, #4

@ Move logo reference one back
arepl_020C76B4:
    add r0, r0, #0xF1

@ Move logo reference one back
arepl_020C78E4:
    add r0, r0, #0xF1

@ Make our splash screen and credits show up for longer
ahook_020C77B0:
    push {r0}
    ldr r0,[r0]
    ldr r0,[r0, #4]
    cmp r0, #3
    bge longer
    mov r2, #0x780
    b end
    longer:
        mov r2, #0x1E00
    end:
        pop {r0}
        bx lr

@ Change the screen order for our logos
ahook_020C790C:
    cmp r0, #3
    blt nonreversed
    and r0, r0, #1
    mvn r0, r0
    nonreversed:
        and r0, r0, #1
        bx lr

@ Skip logo if button pressed
ahook_020C77FC:
    push {r6}
    ldr r6, [pc, #0x1C] @ reference buttons manually bc I can't overcome my own limitations
    ldrb r6, [r6]
    cmp r6, #0xFF
    bne skip
    sub r0, r2, r0
    b done
    skip:
        mov r0, #0
    done:
        pop {r6}
        bx lr
    buttons: .word 0x04000130