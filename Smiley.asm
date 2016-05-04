;--------------------------------------------------------------------
;Modul - Smiley
;--------------------------------------------------------------------
ljmp INIT

ORG 00H		; Ab da kommen die Variablen hin

INIT:
mov R0,#10011001b
mov R1,#11111001b
;mov R2,#
mov R3,#11011111b
mov R4,#10000001b
;jmp zwinkern
call lachen

;Lachen
LACHEN:
;mov P0,R0
;mov P1,R1
;mov P1,R3
mov P0,R0
mov P1,R1
mov P1,#11111011b
mov P0,#11111111b
mov P0,#10111101b
mov P1,#11011111b
mov P1,#10111111b
mov P0,R4

jmp zwinkern
;call traurig


TRAURIG:
mov P0,R0
mov P1,R1
mov P0,#11111111b
mov P1,R3
mov P0,R2
mov P0,#10111101b
mov P1,#10111111b
mov P0,#11111111b
mov P1,#11111111b
;jmp zwinkern
call zwinkern

ZWINKERN:
mov P0,#10011001b
mov P1,#11111001b
mov P1,#11111011b
mov P0,#11111111b
mov P0,#10111101b
mov P1,#11011111b
mov P1,#10111111b

mov P0,R4

;jmp lachen
ret


end
;------- Smiley Ende------------------------------------------------

