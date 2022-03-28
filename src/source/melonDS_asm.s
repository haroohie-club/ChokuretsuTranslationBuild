arepl_0202AB1C:
    push {r0}
    ldr r0, =0x15115111
    mcr p15,0,r0,c5,c0,2
    pop {r0}
    ldr r1, [r1]
    bx lr