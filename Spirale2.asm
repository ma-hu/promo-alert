;--------------------------------------------------------------------
;Modul - Spirale
;--------------------------------------------------------------------
ljmp INIT

ORG 00H		; Ab da kommen die Variablen hin

INIT:
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
JZ INIT
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



end
;-------Spirale Ende------------------------------------------------
