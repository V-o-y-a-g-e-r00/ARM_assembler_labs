.text
.global _start
_start:

MET1:
//выводим begin
LDR R0, HEX0
LDR R1, BEGINTXT1
STR R1, [R0]

LDR R0, HEX5
LDR R1, BEGINTXT2
STR R1, [R0]


//цикл для нажатия кнопки 3 работает
LOOP1:
LDR R0, ADR
LDR R1, [R0, #0x50]
TST R1, #8
BEQ LOOP1

//пишем в r4 начальное значение
LDR R0, ADR
LDR R4, [R0, #0x40] //тумблеры
STR R4, [R0]


//вычитаем==========

LOOP3:
//задержка
LDR R3, DEL
LOOP2:
SUBS R3, #1
BNE LOOP2

SUBS R4, #1
STR R4, [R0]
CMP R4, #0
BNE LOOP3

LDR R0, HEX0
LDR R1, FINTXT
STR R1, [R0]

LDR R0, HEX5
LDR R1, =0
STR R1, [R0]

stop: B stop

//данные===============
HEX0: .word 0xFF200020
HEX5: .word 0xFF200030
BEGINTXT1: .word 0b01111001011111010000010001010100
BEGINTXT2: .word 0b01111100
//BEGINTXT1: .word 0b11100010000010001010100

FINTXT: .word 0b11100010000010001010100


CNT: .word 2 

DEL: .word 0x10000000
.word 0xFF200000

ADR: .word 0xFF200000
.end