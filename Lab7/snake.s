.text
.
global _start

_start:
// R0, R1 адреса индикаторов; R2 - для задержки R5 - для значения идникатора. 
LDR R0, ADRIND0
LDR R1, ADRIND4

// вывод на 0 иникаторе===========================
MOVW R5, 0x1
STR R5, [R0]
// задержка
LDR R2, DEL
LOOP0:
SUBS R2, #1
BNE LOOP0
// /задержка

LSL R5, #1
STR R5, [R0]
// задержка
LDR R2, DEL
LOOP1:
SUBS R2, #1
BNE LOOP1
// /задержка

LSL R5, #1
STR R5, [R0]
// задержка
LDR R2, DEL
LOOP2:
SUBS R2, #1
BNE LOOP2
// /задержка

// вывод на 1 иникаторе===========================
LSL R5, #8
LSR R5, #1
STR R5, [R0]
// задержка
LDR R2, DEL
LOOP3:
SUBS R2, #1
BNE LOOP3
// /задержка


LSR R5, #1
STR R5, [R0]
// задержка
LDR R2, DEL
LOOP4:
SUBS R2, #1
BNE LOOP4
// /задержка

LSR R5, #1
STR R5, [R0]
// задержка
LDR R2, DEL
LOOP5:
SUBS R2, #1
BNE LOOP5
// /задержка



fin: B fin
ADRIND0: .word 0xFF200020
ADRIND4: .word 0xFF200030
DEL: .word 0x30000000
.end