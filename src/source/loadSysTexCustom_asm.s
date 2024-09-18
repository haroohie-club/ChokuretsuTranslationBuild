ahook_2003CFC:
    push {r5}
    mov r5, r1
    bx lr

ahook_02003D1C:
    add r2, r12, r5
    pop {r5}
    bx lr

ahook_02003D30:
    add r1, r12, r5
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
    bl tex_allocSimpleCaller
    skipSubScreenPalette:
        pop {pc}

ahook_02003D08:
    ldr r12, =vramAddress
    ldr r12, [r12]
    bx lr

ahook_0202F4FC:
    push {r0-r2}
    ldr r0, =whiteOutMainScreenTimer
    ldr r1, [r0]
    cmp r1, #0
    beq endWhiteOutMainScreenTimerCheck
    cmp r1, #1
    sub r1, r1, #1
    str r1, [r0]
    beq whiteOutMainScreen
    b endWhiteOutMainScreenTimerCheck
    whiteOutMainScreen:
        ldr r1, =0x06400000
        mvn r0, #0
        mov r2, #0
        whiteOutMainScreenLoop:
            str r0, [r1]
            add r1, r1, #4
            add r2, r2, #1
            cmp r2, #0x3000
            ble whiteOutMainScreenLoop
    endWhiteOutMainScreenTimerCheck:
        pop {r0-r2}
        ldr r1, [r0, #4]
        bx lr

@ Save the texture palette address to memory so we can access it elsewhere
ahook_2021320:
    add r7, r5, #0x14   @ replaced instruction
    push {r0}
    ldr r0, =saveTexturePaletteAddress
    ldr r0, [r0]
    cmp r0, #0
    beq skipSaveTexturePalette
    ldr r0, =texturePaletteAddress
    str r7, [r0]
    skipSaveTexturePalette:
        pop {r0}
        bx lr

vramAddress: .word 0x06600000
whiteOutMainScreenTimer: .word 0
saveTexturePaletteAddress: .word 0
texturePaletteAddress: .word 0