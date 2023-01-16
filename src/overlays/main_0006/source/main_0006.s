@ Fixes bug with Kyon's speech bubbles during group selection not rendering long text
ahook_020C9FA0:
ahook_020C9FB8:
ahook_020C9FD4:
    ldr r0, =speechBubble
    bx lr

speechBubble: .skip 256