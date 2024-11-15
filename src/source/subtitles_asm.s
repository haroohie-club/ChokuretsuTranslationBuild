subtitle: .skip 512         @ char array where we store the subtitle to display
subtitleTimer: .word 0      @ integer timer representing how long to display the subtitles on the screen
xysizescreen: .skip 8       @ array of four shorts representing x, y, font size, and target screen
voiceMapLoc: .word 0        @ location of custom evt voice map in memory
displayTimer: .word 0       @ timer to prevent duplication of top screen subs in OAM

newCZeroLoc: .skip 1024     @ new array where we store the 'C0' data so it doesn't corrupt the next class

@ Hook into voice play routine so we can determine when to display subtitles
ahook_02036394:
    ldr r1, [r1, r6, lsl#2] @ load in voice filename (instruction we were replacing)
    push {r0-r13, lr}

    ldr r0, =voiceMapLoc
    ldr r0, [r0]
    cmp r0, #0              @ if there isn't a location saved in voiceMapLoc, the file hasn't been loaded yet
    beq load
    ldr r0, [r0, #0x08]
    ldr r9, =0x53425553     @ Hex for SUBS, the file magic
    cmp r0, r9              @ If these aren't equal, the voice map has been unloaded and needs to be loaded again
    beq skipLoad
load:
    @ Load the voice map into memory
    mov r9, r1
    mov r0, #2              @ evt.bin
    ldr r1, =589            @ file 589
    bl arc_loadFileAndResolvePointers
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

@ Hook into criSsPly_Stop (the routine that stops voices & BGM) so we can avoid rendering subs when no voice is playing
ahook_0203CB8C:
    push {r1,r2}
    ldr r1, =subtitleTimer
    mov r2, #0
    str r2, [r1]
    pop {r1,r2}
    ldr r0, [r0]
    bx lr

@ Hook into a routine that runs every frame so we can draw text until timer elapses
ahook_0202F500:
    push {lr}
    push {r0-r13}

    ldr r0, =subtitleTimer
    ldr r1, [r0]
    cmp r1, #0
    beq endSubs

    @ If there is time on the timer, we're gonna draw the text stored in subtitle
    sub r1, r1, #1
    str r1, [r0]
    ldr r0, =subtitle
    ldr r1, =xysizescreen
    ldr r5, =displayTimer   @ we use a display timer to render only 1ce/frame rather than 3ce/frame
    ldr r4, [r5]
    cmp r4, #2
    moveq r4, #0
    addne r4, r4, #1
    str r4, [r5]            @ top screen subs render with the OAM and are 
    cmp r4, #0              @ rendered in triplicate without this hack
    bne endSubs             @ skip rendering subs if top screen timer is not 0
renderSubs:
    ldr r2, =0x4000000
    ldr r2, [r2]            @ Load DISPCNT register
    and r2, r2, #7          @ Check bits 0-2 (current BG mode)
    cmp r2, #4
    beq endSubs             @ Don't render subs if we're in BG mode 4 as they're prohibited in that mode
    ldrsh r3, [r1, #6]
    ldr r2, =0x020A9AC8     @ Load target screen-containing struct
    str r3, [r2, #0x50]     @ Store target screen in the struct
    ldrsh r3, [r1, #4]
    ldrsh r2, [r1, #2]
    ldrsh r1, [r1]
    add r0, r0, #4          @ Get rid of the formatting so we default to white text
    bl scene_renderDialogue
    ldr r0, =subtitle
    ldr r1, =xysizescreen
    ldrsh r3, [r1, #6]
    cmp r3, #1
    beq endSubs             @ skip rendering backdrop for top screen subs
    ldrsh r3, [r1, #4]
    ldrsh r2, [r1, #2]
    ldrsh r1, [r1]
    add r1, r1, #1          @ Increment x for drop shadow
    add r2, r2, #1          @ Increment y for drop shadow
    bl scene_renderDialogue
    ldr r0, =subtitle
    ldr r1, =xysizescreen
    ldrsh r3, [r1, #4]
    ldrsh r2, [r1, #2]
    ldrsh r1, [r1]
    add r2, r2, #1          @ Increment just y for enhanced drop shadow
    bl scene_renderDialogue
endSubs:
    pop {r0-r13}
    mov r0, r4              @ instruction we were replacing
    pop {pc}

@ Change z-coord of subtitles so they draw above cutscene frames
ahook_0202D944:
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