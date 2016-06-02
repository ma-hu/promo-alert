;--------------------------------------------------------------------
;Modul - Komplett
;--------------------------------------------------------------------
ljmp INIT

ORG 00H


;-------------- Smiley ----------------------
INIT:
mov R0,#10011001b
mov R1,#11111001b
mov R2,#10111101b
mov R3,#10000001b
mov R4, #000b
call LACHEN

;Lachen
LACHEN:
mov P0,R0
mov P1,R1
;mov P1,#11111011b
mov P0,#11111111b
mov P0,R2
mov P1,#11011111b
mov P1,#10111111b
mov P0,R3

jmp ZWINKERN


ZWINKERN:
mov P0,R0
mov P1,R1
mov P1,#11111011b
mov P0,#11111111b
mov P0,R2
mov P1,#11011111b
mov P1,#10111111b
mov P0,R3

INC R4
;wenn 4 Mal durchgelaufen ist, jmp LACHEN
cjne R4, #100b, LACHEN
;jmp ZOOM
call ZOOM

;------- Smiley Ende------------------------------------------------

;------------ Zoom ---------------------------------
ZOOM:
mov R0,#01111110b
mov R1,#00000000b
mov R3,#11111111b
mov R4,#000b
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
inc R4
CJNE R4, #100b, RUN
jmp SCHLANGE

;------------------- Zoom Ende -------------------

;------------------- Schlange --------------------
SCHLANGE:
mov R0,#11111110b
mov R1,#11111110b
mov R3,#1b		; Flag - wenn 1 dann runter, wenn 0 dann hoch
mov R4,#1b		; Flag - wenn 1 dann rechts, wenn 0 dann runter
mov R5,#01111111b
mov R6,#11111110b
jmp RUNHochrunter

RUNHOCHRUNTER:
mov P0,R0
mov P1,R1
cjne R3,#0b,RUNTER ; Solange Punkt noch nicht ganz unten gehe RUNTER
jmp HOCH

RUNRECHTSLINKS:
mov P0,R0
mov P1,R1
cjne R4,#0b,RECHTS
jmp LINKS

RUNTER:
mov A,R1		  
rl A
mov R1,A
cjne A,05h,RUNHOCHRUNTER
mov R4,#1b
mov P0,R0
mov P1,R1
mov A,R0		  ; Punkt ganz unten >> eins nach rechts
rl A
mov R0,A
jmp RUNRECHTSLINKS

HOCH:
mov A,R1		  
rr A
mov R1,A
cjne A,06h,RUNHOCHRUNTER
mov R4,#0b
mov P0,R0
mov P1,R1
mov A,R0		  ; Punkt ganz unten >> eins nach rechts
rr A
mov R0,A
mov A, R6
rl A
mov R6, A
jmp RUNRECHTSLINKS

LINKS:
mov A,R0
rr A
mov R0,A
cjne A, 06h, RUNRECHTSLINKS
mov R3, #1b
mov P0, R0
mov P1, R1
mov A, R1
rl A
mov R1, A
jmp RUNHOCHRUNTER

RECHTS:
mov A, R5
XRL A, #11101111b
JZ SMILEY
mov A,R0
rl A
mov R0, A
cjne A,05h,RUNRECHTSLINKS
mov R3,#0b
mov P0, R0
mov P1, R1
mov A, R1
rr A
mov R1, A
mov A, R5
rr A
mov R5, A
jmp RUNHOCHRUNTER

;------------- Schlange Ende ------------------

;------------- Springe an den Anfang ----------
SMILEY:
ljmp INIT

end