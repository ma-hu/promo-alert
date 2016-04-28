;--------------------------------------------------------------------
;Modul - Schlange
;--------------------------------------------------------------------
ljmp INIT

ORG 00H		; Ab da kommen die Variablen hin

INIT:
mov R0,#11111110b
mov R1,#11111110b
mov R3,#1b		; Flag - wenn 1 dann runter, wenn 0 dann hoch
jmp RUN

RUN:
mov P0,R0
mov P1,R1
cjne R3,#0b,RUNTER ; Solange Punkt noch nicht ganz unten gehe RUNTER
jmp HOCH

RUNTER:
mov A,R1		  
rl A
mov R1,A
cjne R1,#01111111b,RUN
mov R3,#0b
mov P0,R0
mov P1,R1
mov A,R0		  ; Punkt ganz unten >> eins nach rechts
rl A
mov R0,A
jmp RUN

HOCH:
mov A,R1		  
rr A
mov R1,A
cjne R1,#11111110b,RUN
mov R3,#1b
mov P0,R0
mov P1,R1
mov A,R0		  ; Punkt ganz unten >> eins nach rechts
rl A
mov R0,A
jmp RUN

end
;-------Schlange Ende------------------------------------------------