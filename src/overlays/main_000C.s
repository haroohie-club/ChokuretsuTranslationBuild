@ Fixes the topic viewer in extras mode
@ Base location of shift: 0219FE40
@ New location after shift: 020CCA44

ahook_020CB8D4:
    ldr r1, =topicAnimClass
    add r1, r1, r7
    bx lr

ahook_020CB8E8:
    ldr r0, =topicAnimClass
    add r0, r0, #0xA4
    bx lr

@@@@

@ Topic Title (comment out)
@ ahook_020CB900:
@     ldr r1, =topicAnimClass
@     bx lr

@ ahook_020CB91C:
@     ldr r1, =topicAnimClass
@     bx lr

@ ahook_020CB970:
@     ldr r1, =topicAnimClass
@     bx lr

@ Topic Card
ahook_020CB540:
    ldr r1, =topicAnimClass
    bx lr

ahook_020CB5B4:
    ldr r0, =topicAnimClass
    bx lr

ahook_020CB658:
    ldr r0, =topicAnimClass
    bx lr

ahook_020CB678:
    ldr r0, =topicAnimClass
    bx lr

@@@@

ahook_020CB89C:
    ldr r1, =topicAnimClass
    bx lr

ahook_020CB48C:
    ldr r0, =topicAnimClass
    bx lr

ahook_020CB4C8:
    ldr r0, =topicAnimClass
    add r0, r0, #0x68
    bx lr

ahook_020CB4AC:
    ldr r0, =topicAnimClass
    add r0, r0, #0x7C
    bx lr

ahook_020CB570:
    ldr r0, =topicAnimClass
    bx lr

@@@@ Routines below this are known to be good @@@@

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