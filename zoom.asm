;--------------------------------------------------------------------
; Modul - Zoom
;--------------------------------------------------------------------
ljmp INIT

ORG 00H

INIT:
mov R0,#01111110b
mov R1,#00000000b
mov R3,#11111111b
jmp RUN

RUN:
mov P0,R0
mov P1,R1
mov P0,#10111101b
mov P0,#11011011b
mov P0,#11100111b
mov P0,#11011011b
mov P0,#10111101b
mov P0,R0
mov P0,R1
mov P1,R0
mov P1,#10111101b
mov P1,#11011011b
mov P1,#11100111b
mov P1,#11011011b
mov P1,#10111101b
mov P1,R0
jmp Run


end