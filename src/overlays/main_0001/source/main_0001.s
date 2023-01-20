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
ahook_020C78E4:
    cmp r0, #3
    blt original
    push {r0,r3,r12}
    add r0, r0, #0xF1
    mov r0, r0, lsl#1
    ldrsh r0, [r3, r0]
    str r0, [r12, #0x0C]
    bl load_sysTexFromDat9B
    ldr r0, =loadSysTexSubMode
    mov r1, #6
    str r1, [r0]
    pop {r0,r3,r12}
    add r0, r0, #0xF2
    mov r0, r0, lsl#1
    ldrsh r0, [r3, r0]
    str r0, [r12, #0x0C]
    mov r1, #1
    bl load_sysTexFromDat9B
    ldr r0, =loadSysTexSubMode
    mov r1, #14
    str r1, [r0]
    bl 0x20C799C
    ldr r2, =oamOffset
    mov r1, #0
    str r1, [r2]
    bl sys_copyToOAM
    ldr r2, =oamOffset
    mov r1, #0x400
    str r1, [r2]

    push {r0-r12}
    bl logoSetPalette
    pop {r0-r12}

    mov r0, #2
    mov r2, #2
    mov r1, #30
    bl screenFadeMonochrome
    ldr r0, =0x20C7924
    bx r0
    original:
        add r0, r0, #0xF1
        bx lr

@ Skip logo if button/screen pressed
ahook_020C77FC:
    push {r6}
    ldr r6, =buttonPressAddress
    ldrb r6, [r6]
    tst r6, #0x01
    beq skip
    tst r6, #0x02
    beq skip
    tst r6, #0x08
    beq skip
    ldr r6, =stylusDownAddress
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