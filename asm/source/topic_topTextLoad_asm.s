// corresponds to 0x8F4 past the main class
topicAnimClass: .skip 4096

arepl_02057974:
    ldr r0, =topicAnimClass
    add r0, r0, #0x54
    bx lr

arepl_02057EB4:
    ldr r0, =topicAnimClass
    bx lr

arepl_02057ED4:
    ldr r0, =topicAnimClass
    add r0, r0, #0x54
    bx lr

arepl_02058B3C:
    ldr r0, =topicAnimClass
    add r0, r0, #0x54
    bx lr

arepl_02058B90:
    ldr r0, =topicAnimClass
    bx lr

arepl_02058B10:
    ldr r0, =topicAnimClass
    bx lr

arepl_02058BB4:
    ldr r0, =topicAnimClass
    add r0, r0, #0x54
    bx lr

// 0x50 -> 0x944
arepl_02058CAC:
    ldr r0, =topicAnimClass
    add r0, r0, #0x50
    bx lr

arepl_0205AECC:
    ldr r0, =topicAnimClass
    add r0, r0, #0x84
    bx lr

arepl_02058CD8:
    ldr r0, =topicAnimClass
    add r0, r0, #0x3C
    bx lr

arepl_0205B348:
    ldr r1, =topicAnimClass
    ldr r1, [r1, #0x68]
    bx lr

arepl_0205AEB0:
    ldr r1, =topicAnimClass
    ldr r1, [r1, #0x54]
    bx lr

arepl_0205AEE8:
    ldr r0, =topicAnimClass
    add r0, r0, #0x70
    bx lr

arepl_0205AF04:
    ldr r1, =topicAnimClass
    ldr r1, [r1, #0x58]
    bx lr

arepl_0205AF10:
    ldr r0, =topicAnimClass
    ldr r0, [r0, #0x5C]
    bx lr

arepl_0205AF2C:
    ldr r1, =topicAnimClass
    ldr r1, [r1, #0x60]
    bx lr

arepl_0205AF38:
    ldr r0, =topicAnimClass
    ldr r0, [r0, #0x64]
    bx lr

arepl_0205AF50:
    ldr r1, =topicAnimClass
    ldr r5, [r1, #0x58]
    ldr r1, [r1, #0x60]
    ldr lr, =0x0205AF58
    bx lr

arepl_0205AF7C:
    ldr r0, =topicAnimClass
    ldr r4, [r0, #0x5C]
    ldr r0, [r0, #0x64]
    ldr lr, =0x0205AF84
    bx lr

arepl_0205AFBC:
    ldr r0, =topicAnimClass
    ldr r0, [r0, #0x50]
    bx lr

arepl_0205B058:
    ldr r2, =topicAnimClass
    ldr r2, [r2, #0x50]
    bx lr

arepl_0205B074:
    ldr r0, =topicAnimClass
    ldr r0, [r0, #0x50]
    bx lr

arepl_0205B288:
    ldr r1, =topicAnimClass
    ldr r1, [r1, #0x54]
    bx lr

// commenting these out effectively no-ops title text display
// arepl_0205B294:
//     ldr r1, =topicAnimClass
//     ldr r1, [r1, #0x68]
//     bx lr

// arepl_0205B2BC:
//     push {r0}
//     ldr r0, =topicAnimClass
//     add r0, r0, #0xC
//     add r1, r0, r7
//     pop {r0}
//     bx lr

// arepl_0205B2D0:
//     ldr r0, =topicAnimClass
//     add r0, r0, #0xAC
//     add r0, r0, r7
//     bx lr

arepl_0205B2E4:
    ldr r1, =topicAnimClass
    ldr r1, [r1, #0x50]
    bx lr

arepl_0205B2FC:
    ldr r1, =topicAnimClass
    ldr r1, [r1, #0x50]
    bx lr

// time gain marker
arepl_0205B384:
    ldr r0, =topicAnimClass
    ldr r0, [r0, #0x50]
    bx lr

// time gain marker
arepl_0205B4BC:
    ldr r1, =topicAnimClass
    ldr r1, [r1, #0x50]
    bx lr

arepl_0205B8A4:
    ldr r0, =topicAnimClass
    add r0, r0, #0x50
    bx lr

// function no-ops
// arepl_0205AE50:
//     pop {r4-r11, lr}
//     bx lr

// arepl_02058BF4:
//     pop {r3-r11, lr}
//     bx lr

// the one to actually no-op to make things work
// arepl_0205BA3C:
//     pop {r3-r11,lr}
//     bx lr
