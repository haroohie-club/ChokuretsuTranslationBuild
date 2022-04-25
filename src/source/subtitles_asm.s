subtitle: .skip 512         @ char array where we store the subtitle to display
subtitleTimer: .word 0      @ integer timer representing how long to display the subtitles on the screen
xysizescreen: .skip 8       @ array of four shorts representing x, y, font size, and target screen
voiceMapLoc: .word 0        @ location of custom evt voice map in memory

@ Hook into voice play routine so we can determine when to display subtitles
arepl_02036394:
    ldr r1, [r1, r6, lsl#2] @ load in voice filename (instruction we were replacing)
    push {r0-r13, lr}

    ldr r0, =voiceMapLoc
    ldr r0, [r0]
    cmp r0, #0
    beq load
    ldr r0, [r0]
    ldr r9, =0x11D
    cmp r0, r9              @ The first int of the voice map
    beq skipLoad
load:
    @ Load the voice map into memory
    mov r9, r1
    mov r0, #2              @ evt.bin
    ldr r1, =589            @ file 589
    bl 0x02033FC4           @ arc_loadFileAndResolvePointers
    ldr r1, =voiceMapLoc
    str r0, [r1]
    mov r1, r9
skipLoad:
    ldr r0, =subtitle
    ldr r2, =voiceMapLoc
    ldr r2, [r2]
    ldr r3, =xysizescreen
    bl subtitles_getSubs
    ldr r1, =subtitleTimer
    str r0, [r1]

    pop {r0-r13, pc}

@ Hook into a routine that runs every frame so we can draw text until timer elapses
arepl_0202F500:
    push {lr}
    push {r0-r13}

    ldr r0, =subtitleTimer
    ldr r1, [r0]
    cmp r1, #0
    beq end

    @ If there is time on the timer, we're gonna draw the text stored in subtitle
    sub r1, r1, #1
    str r1, [r0]
    ldr r0, =subtitle
    ldr r1, =xysizescreen
    ldrsh r3, [r1, #6]
    ldr r2, =0x020A9AC8     @ Load target screen-containing struct
    str r3, [r2, #0x50]     @ Store target screen in the struct
    ldrsh r3, [r1, #4]
    ldrsh r2, [r1, #2]
    ldrsh r1, [r1]
    add r0, r0, #4          @ Get rid of the formatting so we default to white text
    bl 0x0202D41C           @ scene_renderDialogue
    ldr r0, =subtitle
    ldr r1, =xysizescreen
    ldrsh r3, [r1, #6]
    cmp r3, #1
    beq end                 @ skip rendering backdrop for top screen subs
    ldrsh r3, [r1, #4]
    ldrsh r2, [r1, #2]
    ldrsh r1, [r1]
    add r1, r1, #1          @ Increment x for drop shadow
    add r2, r2, #1          @ Increment y for drop shadow
    bl 0x0202D41C           @ scene_renderDialogue
    ldr r0, =subtitle
    ldr r1, =xysizescreen
    ldrsh r3, [r1, #4]
    ldrsh r2, [r1, #2]
    ldrsh r1, [r1]
    add r2, r2, #1          @ Increment just y for enhanced drop shadow
    bl 0x0202D41C           @ scene_renderDialogue
end:
    pop {r0-r13}
    mov r0, r4              @ instruction we were replacing
    pop {pc}

@ Change z-coord of subtitles so they draw above cutscene frames
arepl_0202D944:
    push {r1}
    ldr r1, =subtitleTimer
    ldr r1, [r1]
    cmp r1, #0
    bgt modifyZ
    mov r2, #14
    b return
modifyZ:
    mov r2, #0
return:
    pop {r1}
    bx lr