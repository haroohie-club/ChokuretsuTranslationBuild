ahook_2003CFC:
    push {r5}
    mov r5, r1
    bx lr

ahook_02003D1C:
    add r2, r12, r5
    pop {r5}
    bx lr

ahook_020342F4:
    push {r14}
    push {r11,r12}
    ldr r11, =0x06600000
    ldr r12, =vramAddress
    ldr r12, [r12]
    cmp r11,r12
    pop {r11,r12}
    bne skipSubScreenPalette
    bl 0x2020AB0
    skipSubScreenPalette:
        pop {pc}

ahook_02003D08:
    ldr r12, =vramAddress
    ldr r12, [r12]
    bx lr

vramAddress: .word 0x06600000
customOamSwitch: .word 0