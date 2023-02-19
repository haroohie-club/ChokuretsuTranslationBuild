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
        mov r2, #0x2D00
    end:
        pop {r0}
        bx lr

@ Turn off the custom OAM allocation function after the splash screen is displayed
ahook_020C78AC:
    push {r0,r1}
    ldr r0, =customOamSwitch
    mov r1, #0
    str r1, [r0]
    pop {r0,r1}
    str r0, [r1]
    bx lr

@ Turn on the custom OAM allocation function for the splash screen
ahook_020C78B4:
    cmp r1, #2
    blt dontEnableCustomOam
    push {r1}
    ldr r0, =customOamSwitch
    mov r1, #1
    str r1, [r0]
    pop {r1}
    dontEnableCustomOam:
        ldr r0, [r2, #0x0C]
        bx lr

@ Change fade outs to be dual screen and turns on white out timer after last fade
ahook_020C7830:
    push {lr}
    push {r0}
    ldr r0, =customOamSwitch
    ldr r0, [r0]
    cmp r0, #0
    pop {r0}
    beq endOfFadeCheck
    push {r0-r1}
    ldr r0, =whiteOutMainScreenTimer
    mov r1, #90
    str r1, [r0]
    pop {r0-r1}
    endOfFadeCheck:
        mov r2, #3
        pop {pc}

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
    
    ldr r0, =vramAddress
    ldr r1, =0x063F4000
    str r1, [r0]
    pop {r0,r3,r12}
    add r0, r0, #0xF2
    mov r0, r0, lsl#1
    ldrsh r0, [r3, r0]
    str r0, [r12, #0x0C]
    mov r1, #1
    bl load_sysTexFromDat9B
    ldr r0, =vramAddress
    ldr r1, =0x06600000
    str r1, [r0]
    ldr r0, =loadedPaletteStart
    ldr r1, =mainSpritePalette
    mov r2, #0x200
    bl memcpy2007314
    mov r0, #2
    mov r2, #3
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
    beq skipLogo
    tst r6, #0x02
    beq skipLogo
    tst r6, #0x08
    beq skipLogo
    ldr r6, =stylusDownAddress
    ldrb r6, [r6]
    cmp r6, #0x01
    beq skipLogo
    sub r0, r2, r0
    b endButtonCheck
    skipLogo:
        mov r0, #0
    endButtonCheck:
        pop {r6}
        bx lr

@ Call custom OAM allocation method
ahook_020C7A10:
    push {r0-r12}
    ldr r0, =customOamSwitch
    ldr r0, [r0]
    cmp r0, #0
    beq useDefaultOamAlloc
    ldr r0, =dispcntA
    ldr r1, =0x00211110
    str r1, [r0]
    ldr r0, =engineAOAMStart
    bl oamAllocation
    ldr r0, =engineBOAMStart
    bl oamAllocation
    ldr lr, =0x20C7A84
    useDefaultOamAlloc:
        pop {r0-r12}
        ldr r1, [r5,#0x610]
        bx lr

customOamSwitch: .word 0