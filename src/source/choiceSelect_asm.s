// Expand the choice select sprintf target buffer in order to not corrupt the struct
// like I did for the ticker tape

choiceText: .skip 256

ahook_02061344:
    ldr r0, =choiceText
    bx lr

ahook_02061358:
    ldr r0, =choiceText
    bx lr

ahook_02061378:
    ldr r0, =choiceText
    bx lr