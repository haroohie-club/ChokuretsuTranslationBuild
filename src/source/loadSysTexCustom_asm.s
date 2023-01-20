ahook_2034290:
    ldr r1, =loadSysTexSubMode
    ldr r1, [r1]
    bx lr

ahook_2003C4C:
    mvn r12, #0
    mov r3, r2
    bx lr

ahook_2003C6C:
    push {r0-r12,lr}
    add r2, r2, #0x07000000
    bl 0x2006ED0
    pop {r0-r12,pc}

ahook_2003C60:
    ldr r2, =oamOffset
    ldr r2, [r2]
    add r2, r1, r2
    bx lr

loadSysTexSubMode: .word 0x0E
oamOffset: .word 0x400