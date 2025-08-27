@ Hook into the evt_scenarioUnlockEndings and write some stuff
@ to the end of the save file (unused flags) for use by Chokuretsu Wrapped

ahook_0205C420:
    push {lr}
    push {r0-r12}
    bl wrapChoku
    pop {r0-r12}
    cmp r0, #0          @ original instruction
    pop {pc}