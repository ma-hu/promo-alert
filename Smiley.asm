;--------------------------------------------------------------------
;Modul - Smiley
;--------------------------------------------------------------------
ljmp INIT

ORG 00H

INIT:
mov R0,#10011001b
mov R1,#11111001b
mov R2,#10111101b
mov R3,#10000001b
call lachen

;Lachen
LACHEN:
mov P0,R0
mov P1,R1
;mov P1,#11111011b
mov P0,#11111111b
mov P1,#11011111b
mov P0,R2
mov P1,#10111111b
mov P0,R3

jmp zwinkern
;call traurig

ZWINKERN:
mov P0,R0
mov P1,R1
mov P1,#11111011b
mov P0,#11111111b
mov P1,#11011111b
mov P0,R2
mov P1,#10111111b
mov P0,R3
;jmp lachen
call lachen


end
;------- Smiley Ende------------------------------------------------

