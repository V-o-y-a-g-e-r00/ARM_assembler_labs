.text

.global _start

_start:
// R0, R1 адреса индикаторов; R2 - для задержки R5 - для значения индикатора.
LDR R0, ADRIND0
LDR R1, ADRIND4

// Вывод на 0 индикаторе
MOVW R5, 0x2
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP0:
SUBS R2, #1
BNE LOOP0

LSL R5, #1
STR R5, [R0]
LDR R2, DEL
LOOP1:
SUBS R2, #1
BNE LOOP1

LSL R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP2:
SUBS R2, #1
BNE LOOP2
// 

// Вывод на 1 индикаторе=========================
LSL R5, #8
LSR R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP3:
SUBS R2, #1
BNE LOOP3
// /Задержка

LSR R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP4:
SUBS R2, #1
BNE LOOP4
// /Задержка

LSR R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP5:
SUBS R2, #1
BNE LOOP5
// /Задержка

// Вывод на 2 индикаторе=========================
LSL R5, #8
LSL R5, #1

STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP6:
SUBS R2, #1
BNE LOOP6
// /Задержка

LSL R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP7:
SUBS R2, #1
BNE LOOP7
// /Задержка

LSL R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP8:
SUBS R2, #1
BNE LOOP8
// /Задержка

// Вывод на 3 индикаторе=========================
LSL R5, #8
LSR R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP9:
SUBS R2, #1
BNE LOOP9
// /Задержка

LSR R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP10:
SUBS R2, #1
BNE LOOP10
// /Задержка

LSR R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP11:
SUBS R2, #1
BNE LOOP11
// /Задержка

// очистка 3 индикатора
MOVW R5, 0x0
STR R5, [R0]
// Вывод на 4 индикаторе=========================
MOVW R5, 0x2
STR R5, [R1]
//Задержка
LDR R2, DEL
LOOP4IND0:
SUBS R2, #1
BNE LOOP4IND0

LSL R5, #1
STR R5, [R1]
LDR R2, DEL
LOOP4IND1:
SUBS R2, #1
BNE LOOP4IND1

LSL R5, #1
STR R5, [R1]
//Задержка
LDR R2, DEL
LOOP4IND2:
SUBS R2, #1
BNE LOOP4IND2
// 

// Вывод на 5 индикаторе=========================
LSL R5, #8
LSR R5, #1
STR R5, [R1]
//Задержка
LDR R2, DEL
LOOP4IND3:
SUBS R2, #1
BNE LOOP4IND3
// /Задержка

LSR R5, #1
STR R5, [R1]
//Задержка
LDR R2, DEL
LOOP4IND4:
SUBS R2, #1
BNE LOOP4IND4
// /Задержка

LSR R5, #1
STR R5, [R1]
//Задержка
LDR R2, DEL
LOOP4IND5:
SUBS R2, #1
BNE LOOP4IND5
// /Задержка
// очистка 5 индикатора
MOVW R5, 0x0
STR R5, [R1]
//======================================================================
// Тоже самое, только в о6ратном орядке=================================
//======================================================================
// Вывод на 5 индикаторе
MOVW R5, 0x100
STR R5, [R1]
//Задержка
LDR R2, DEL
LOOPBACK0:
SUBS R2, #1
BNE LOOPBACK0

LSL R5, #1
STR R5, [R1]
LDR R2, DEL
LOOPBACK1:
SUBS R2, #1
BNE LOOPBACK1

LSL R5, #1
STR R5, [R1]
//Задержка
LDR R2, DEL
LOOPBACK2:
SUBS R2, #1
BNE LOOPBACK2

// Вывод на 4 индикаторе=========================
LSR R5, #8
LSL R5, #1
STR R5, [R1]
//Задержка
LDR R2, DEL
LOOPBACK3:
SUBS R2, #1
BNE LOOPBACK3

LSR R5, #1
STR R5, [R1]
LDR R2, DEL
LOOPBACK4:
SUBS R2, #1
BNE LOOPBACK4

LSR R5, #1
STR R5, [R1]
//Задержка
LDR R2, DEL
LOOPBACK5:
SUBS R2, #1
BNE LOOPBACK5
// очистка 4 семента
MOVW R5, 0x0
STR R5, [R1]

// Вывод на 3 индикаторе
MOVW R5, 0x0
MOVT R5, 0x100
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOPBACK6:
SUBS R2, #1
BNE LOOPBACK6

LSL R5, #1
STR R5, [R0]
LDR R2, DEL
LOOPBACK7:
SUBS R2, #1
BNE LOOPBACK7

LSL R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOPBACK8:
SUBS R2, #1
BNE LOOPBACK8

// Вывод на 2 индикаторе=========================
LSR R5, #8
LSL R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOPBACK9:
SUBS R2, #1
BNE LOOPBACK9

LSR R5, #1
STR R5, [R0]
LDR R2, DEL
LOOPBACK10:
SUBS R2, #1
BNE LOOPBACK10

LSR R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOPBACK11:
SUBS R2, #1
BNE LOOPBACK11

// Вывод на 1 индикаторе===============================
LSR R5, #8
LSR R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOPBACK12:
SUBS R2, #1
BNE LOOPBACK12

LSL R5, #1
STR R5, [R0]
LDR R2, DEL
LOOPBACK13:
SUBS R2, #1
BNE LOOPBACK13

LSL R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOPBACK14:
SUBS R2, #1
BNE LOOPBACK14

// Вывод на 0 индикаторе=========================
LSR R5, #8
LSL R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOPBACK15:
SUBS R2, #1
BNE LOOPBACK15

LSR R5, #1
STR R5, [R0]
LDR R2, DEL
LOOPBACK16:
SUBS R2, #1
BNE LOOPBACK16

LSR R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOPBACK17:
SUBS R2, #1
BNE LOOPBACK17
// очистка 0 семента
MOVW R5, 0x0
STR R5, [R0]


fin: B fin
ADRIND0: .word 0xFF200020
ADRIND4: .word 0xFF200030
DEL: .word 0x30000000
.end
