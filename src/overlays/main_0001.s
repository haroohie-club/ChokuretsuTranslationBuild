# Overlay file reference

arepl_020C77B0:
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

arepl_020C790C:
    cmp r0, #3
    blt nonreversed
    and r0, r0, #1
    mvn r0, r0
    nonreversed:
        and r0, r0, #1
        bx lr

arepl_020C77FC:
    push {r6}
    ldr r6, [pc, #0x1C]
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
    buttons: .word 0x4000130