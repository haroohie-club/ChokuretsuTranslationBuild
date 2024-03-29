tickerLength: .word 0
tickerTapeText: .skip 256
tickerTapeRenderText: .skip 256

// No-op ticker scrolling
ahook_0205B8E0:
    bx lr

// Load ticker length into (accessible) memory
ahook_0205B7F0:
    push {r6}
    ldr r6, =tickerLength
    str r0, [r6]
    pop {r6}
    str r0, [r6, #8]
    bx lr

// Increase max ticker length to 0x100
ahook_0205B7FC:
    mov r2, #0x100
    ldr r0, =tickerTapeText
    bx lr

// Increase max ticker length to 0x100
ahook_0205B814:
    cmp r4, #0x100
    bx lr

// Clear array before using it
ahook_0205B7C8:
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
    mov r6, r0
    bx lr

// Copy char to own own address
ahook_0205B820:
    ldr r2, =tickerTapeText
    add r2, r2, r4          // Change array pointer position
    ldr r0, [r0, #0x20]
    add r4, r4, #2
    ldrsb r1, [r0, r5]
    add r0, r5, #2
    strb r1, [r2]           // Write first byte
    ldr r1, [r6, #0x50]
    ldr r1, [r1, #0x20]
    add r1, r1, r5
    ldrsb r1, [r1, #1]
    strb r1, [r2, #1]       // Write second byte
    ldr lr, =0x205B84C
    bx lr

// Make ticker load length = ticker string length
ahook_0205B858:
    push {r1}
    ldr r1, =tickerLength
    ldr r0, [r1]
    pop {r1}
    push {lr}
    bl tickerTape_CalculateLoadLength
    cmp r4, r0
    pop {pc}

ahook_02058CC0:
    ldr r2, =tickerTapeText
    bx lr

// Below this point focuses on the rendering portion of the ticker tape text

// Rewrite reference set for dbg_sprintf (setting text)
ahook_02058CBC:
    ldr r0, =tickerTapeRenderText
    bx lr

// Rewrite reference set for scene_renderDialog (reading text)
ahook_02058CF0:
    ldr r0, =tickerTapeRenderText
    bx lr

// Rewrite reference set for dbg_sprintf (setting text)
ahook_0205A8EC:
    ldr r0, =tickerTapeRenderText
    bx lr

// Rewrite reference set for scene_renderDialog (reading text)
ahook_0205A900:
    ldr r0, =tickerTapeRenderText
    bx lr