lastReadChar: .word 0
nextCharacter: .word 0

@ Save the next read character so we can adjust offset in certain cases
ahook_202D820:
    push {r0,r1}
    add r1, r1, #1
    ldrb r0, [r1]
    cmp r0, #0x60
    bne nextByte
    add r1, r1, #2
    ldrb r0, [r1]
nextByte:
    ldrb r1, [r1,#1]
    mov r0, r0, lsl #8
    orr r0, r0, r1
    ldr r1, =nextCharacter
    strh r0, [r1]
    pop {r0,r1}
    cmp r0, #0
    bx lr

@ Save last read character so we can calculate font offset later
ahook_0202D830:
    push {r1}
    ldr r1, =lastReadChar
    str r0, [r1]
    pop {r1}
    cmp r0, r1
    bx lr

@ Calculate font offset
ahook_0202D8A8:
    push {r1,lr}
    ldr r0, =lastReadChar
    ldr r0, [r0]
    ldr r1, =nextCharacter
    ldr r1, [r1]
    bl font_calculateOffset
    pop {r1,pc}