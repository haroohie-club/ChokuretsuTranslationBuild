@ Fixes the topic viewer in extras mode
@ Base location of shift: 0219FE40
@ New location after shift: 020CCA44

@ anything more than this seems to cause a freeze on hardware
@ rip

@ move write reference (anim data) away from class
ahook_020C7D00:
    ldr r0, =topicAnimClass
    add r0, r0, #0x4C
    bx lr

@ move write reference away from class
ahook_020C9904:
    ldr r0, =topicAnimClass
    add r0, r0, #0x4C
    bx lr

@ move write reference away from class
ahook_020CBBE8:
    ldr r0, =topicAnimClass
    add r0, r0, #0x4C
    bx lr

aappend_00000000:
    topicAnimClass: .skip 4096