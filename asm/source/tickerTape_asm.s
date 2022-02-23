tickerLength: .word 0
tickerTapeText: .skip 256

// No-op ticker scrolling
arepl_02070410:
    bx lr

// Load ticker length into (accessible) memory
arepl_02070338:
    push {r7}
    ldr r7, =tickerLength
    str r0, [r7]
    pop {r7}
    str r0, [r7, #8]
    bx lr

// Increase max ticker length to 0x42
arepl_02070344:
    mov r2, #0x42
    bx lr

// Increase max ticker length to 0x42
arepl_02070360:
    cmp r4, #0x42
    bx lr

// Clear array before using it
arepl_02070318:
    push {r0-r12, lr}

    mov r1, #0
    mov r2, #0
clearLoop:
    ldr r0, =tickerTapeText
    add r0, r2
    strb r1, [r0]
    add r2, r2, #1
    cmp r2, #256
    blt clearLoop

    pop {r0-r12, lr}
    mov r7, r0
    bx lr

// Copy char to own own address
arepl_0207036C:
    ldr r2, =tickerTapeText
    add r2, r2, r4          // Change array pointer position
    add r1, r6, r5
    strb r0, [r2, #0]       // Write first byte
    ldrsb r1, [r1, #1]
    add r4, r4, #2
    add r0, r5, #2
    strb r1, [r2, #1]       // Write second byte
    ldr lr, =0x02070388
    bx lr

// Make ticker load length = ticker string length
arepl_02070394:
    push {r1}
    ldr r1, =tickerLength
    ldr r0, [r1]
    pop {r1}
    push {lr}
    bl tickerTape_CalculateLoadLength
    cmp r4, r0
    pop {pc}

// Read information text from our own custom address
arepl_0206D7C0:
    ldr r0, =tickerTapeText
    bx lr

// Read information text from our own custom address
arepl_0206D7E0:
    ldr r2, =tickerTapeText
    bx lr

// Bottom part disabled because apparently it wasn't necessary and it also caused some issues
// Such as not being able to select the "Erase data" option in the "Config" menu
@ // Read information text from our own custom address
@ arepl_020608D8:
@     ldr r0, =tickerTapeText
@     bx lr

@ // Read information text from our own custom address
@ arepl_02060A30:
@     ldr r0, =tickerTapeText
@     bx lr

@ // Read information text from our own custom address
@ arepl_02060BC4:
@     ldr r0, =tickerTapeText
@     bx lr

@ // Read information text from our own custom address
@ arepl_02068D08:
@     ldr r0, =tickerTapeText
@     bx lr

// Read information text from our own custom address
@ arepl_020608E8:
@     ldr r0, =tickerTapeText
@     bx lr