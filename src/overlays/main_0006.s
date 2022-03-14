@ Fixes bug with Kyon's speech bubbles during group selection not rendering long text
arepl_020C9FA0:
    ldr r0, =speechBubbleLoc

arepl_020C9FB8:
    ldr r0, =speechBubbleLoc

arepl_020C9FD4:
    ldr r0, =speechBubbleLoc

aappend_00000000:
    speechBubbleLoc: .word [speechBubble]
    speechBubble: .skip 256