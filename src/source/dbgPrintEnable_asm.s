@ Hook into dbg_print20228DC and make it print to the no$ console
@ Note: we specifically don't hook into dbg_print because it was clearly intended
@ to be displayed on the screen and thus is extremely noisy (updates like once a frame at least)

@ Store the string to be printed right before dbg_print2011D4C is called
ahook_0202293C:
    push {r1}
    ldr r1, =stringAddress
    str r0, [r1]
    pop {r1} 
    add r2, r2, #4
    bx lr

@ Loads the now formatted string right after dbg_print2011D4C is called and sends it to our print routine
ahook_02022944:
    push {lr}
    ldr r0, =stringAddress
    ldr r0, [r0]
    bl nocashPrint
    pop {lr}                    @ you're not clever, don't try to pop {pc}, it doesn't work
    add sp, sp, #0x1000
    bx lr

stringAddress: .word 0