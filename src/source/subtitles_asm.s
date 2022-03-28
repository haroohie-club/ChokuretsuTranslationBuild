subtitle: .skip 512
subtitleTimer: .word 0
x: .word 0
y: .word 0

arepl_02036394:
    ldr r1, [r1, r6, lsl#2]
    push {r0-r13, lr}

    ldr r0, =subtitle
    ldr r2, =x
    ldr r3, =y
    bl subtitles_getSubs
    ldr r1, =subtitleTimer
    str r0, [r1]

    pop {r0-r13, pc}

arepl_0202F500:
    push {lr}
    push {r0-r13}

    ldr r0, =subtitleTimer
    ldr r1, [r0]
    cmp r1, #0
    beq end

    sub r1, r1, #1
    str r1, [r0]
    ldr r0, =subtitle
    ldr r1, =x
    ldr r1, [r1]
    ldr r2, =y
    ldr r2, [r2]
    mov r3, #0x100
    bl 0x0202D41C

end:
    pop {r0-r13}
    mov r0, r4
    pop {pc}