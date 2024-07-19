@ Increase hardcoded max size of event files

ahook_02033F00:
    mov r0, #0x16000
    bx lr

ahook_02033F14:
    add r2, r5, #0x16000
    bx lr

ahook_02033F18:
    mov r3, #0x16000
    bx lr

ahook_02033F24:
    add r0, r5, #0x16000
    bx lr