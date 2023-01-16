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

@ Skip logo if button/screen pressed
ahook_020C77FC:
    push {r6}
    ldr r6, =0x04000130 @ button presses address
    ldrb r6, [r6]
    tst r6, #0x01
    beq skip
    tst r6, #0x02
    beq skip
    tst r6, #0x08
    beq skip
    ldr r6, =0x023FFFAD @ stylus down address
    ldrb r6, [r6]
    cmp r6, #0x01
    beq skip
    sub r0, r2, r0
    b done
    skip:
        mov r0, #0
    done:
        pop {r6}
        bx lr