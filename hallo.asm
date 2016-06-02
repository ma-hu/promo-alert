;--------------------------------------------------------------------
;Modul - HALLO
;--------------------------------------------------------------------
ljmp INIT

ORG 00H		; Ab da kommen die Variablen hin

INIT:
mov R0,#00111100b
mov R1,#00000000b
mov R2,#11000011b
mov R3,#11100111b
;mov R3,#11011111b
;mov R4,#10000001b
;jmp zwinkern
call buchstabe_h


Buchstabe_H:
mov P0,R0
mov P1,R1
mov P1,R3
mov P0,R2
call buchstabe_a
ret 

Buchstabe_A:
mov P0,R0
mov P1,R1
mov P1,#11111100b
mov P0,R2
mov P1,R3
mov P0,R2
call buchstabe_l
call buchstabe_l

Buchstabe_l:
mov P0,#11111100b
mov P1,R1
mov P1,#00111111b
mov P0,R2
call buchstabe_o

Buchstabe_o:
mov P0,R0
mov P1,R1
mov P1,#11111100b
mov P0,R2
mov P1,#00111111b
mov P0,R2
ret


end
;-------Hallo Ende------------------------------------------------


