subtitle: .skip 512     @ char array where we store the subtitle to display
subtitleTimer: .word 0  @ integer timer representing how long to display the subtitles on the screen
xysize: .skip 8         @ array of three shorts representing x, y, and font size
voiceMapLoc: .word 0    @ location of custom evt voice map in memory

@ Hook into voice play routine so we can determine when to display subtitles
arepl_02036394:
    ldr r1, [r1, r6, lsl#2] @ load in voice filename (instruction we were replacing)
    push {r0-r13, lr}

    ldr r0, =voiceMapLoc
    ldr r0, [r0]
    cmp r0, #0
    beq load
    ldr r0, [r0]
    ldr r9, =0x10D
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
    ldr r3, =xysize
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
    ldr r1, =xysize
    ldrsh r3, [r1, #4]
    ldrsh r2, [r1, #2]
    ldrsh r1, [r1]
    add r0, r0, #4      @ Get rid of the formatting so we default to white text
    bl 0x0202D41C       @ scene_renderDialogue
    ldr r0, =subtitle
    ldr r1, =xysize
    ldrsh r3, [r1, #4]
    ldrsh r2, [r1, #2]
    ldrsh r1, [r1]
    add r1, r1, #1      @ Increment x for drop shadow
    add r2, r2, #1      @ Increment y for drop shadow
    bl 0x0202D41C       @ scene_renderDialogue
    ldr r0, =subtitle
    ldr r1, =xysize
    ldrsh r3, [r1, #4]
    ldrsh r2, [r1, #2]
    ldrsh r1, [r1]
    add r2, r2, #1      @ Increment just y for enhanced drop shadow
    bl 0x0202D41C       @ scene_renderDialogue
end:
    pop {r0-r13}
    mov r0, r4          @ instruction we were replacing
    pop {pc}

@ Hook into game_loadStaticFiles during shdInit2 to load custom evt voice mapping file
@ arepl_0203513C:
@     push {r1-r13, lr}

@     mov r0, #2              @ evt.bin
@     ldr r1, =359            @ file 589
@     bl 0x02033FC4           @ arc_loadFileAndResolvePointers
@     cmp r0, #0
@     beq skip
@     ldr r1, =voiceMapLoc    
@     str r0, [r1]
@ skip:
@     mov r0, #1
@     pop {r1-r13, pc}