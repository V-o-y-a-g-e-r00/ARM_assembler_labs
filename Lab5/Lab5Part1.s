.text
.global _start
_start:

LDR R0, ADR
MET1: LDR R1, [R0, #0x50]
TST R1, #1
BNE progA
TST R1, #2
BNE progHI
MOVW R2, #0x4949
STR R2, [R0,  #0x20]
MOVW R2, #0x00
STR R2, [R0,  #0x30]
LDR R3, =0x0A000000
DL: SUBS R3, R3, #1
BNE DL
B MET1

progA:
LDR R1, CNT

MOVW R5, #0x7777

MET: //

STR R5, [R0, #0x20]

LSL R5, #16
LDR R2, DEL
LOOP: SUBS R2, #1
BNE LOOP
SUBS R1, #1
BNE MET

MOVT R4, 0x0
MOVW R4, 0x0

STR R4, [R0, #0x20]
MOVW R5, #0x7777
STR R5, [R0, #0x30]

LDR R2, DEL
LOOP1: SUBS R2, #1
BNE LOOP1

LDR R2, DEL
LOOP2: SUBS R2, #1

BNE LOOP2
STR R4, [R0, #0x30]

B MET1

progHI:

MOVW R4, #0b111011000000110
MOVT R4, #0b111011000000110
MOVW R5, #0b111011000000110
MOVT R5, #0b111011000000110

STR R4, [R0, #0x20]
STR R5, [R0, #0x30]

//LDR R1,  ADR     //кнопки
//LDR R2, [R1, #0x50]
//TST R2, #2
//BEQ MET1
B MET1

//данные===============
HEX0: .word 0xFF200020
HEX5: .word 0xFF200030

CNT: .word 2 

DEL: .word 0x30000000
//DEL: .word 0x00000001

ADR: .word 0xFF200000
.end