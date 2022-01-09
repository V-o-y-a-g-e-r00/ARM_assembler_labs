.text


SNAKE:
LDR R0, =0xFF200000
LDR R10, [R0,#0x40]
MOV R11, #409600
MUL R9, R10, R11
MOVW R2,#0x0
MOVW R7,#0x0
LDR R0, =0xFF200020
STR R2, [R0]
STR R7,[R0,#0x10]
// R0, R0,#0x10 адреса индикаторов; R2 - для задержки R7 - для значения индикатора.

// Вывод на 0 индикаторе
MOVW R7, 0x2
STR R7, [R0]
//Задержка
MOV R2, R9
LOOP0:
SUBS R2,R2,#1
BNE LOOP0

LSL R7, #1
STR R7, [R0]
MOV R2, R9
LOOP1:
SUBS R2,R2,#1
BNE LOOP1

LSL R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOP2:
SUBS R2,R2,#1
BNE LOOP2
// 

// Вывод на 1 индикаторе=========================
LSL R7, #8
LSR R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOP3:
SUBS R2,R2,#1
BNE LOOP3
// /Задержка

LSR R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOP4:
SUBS R2,R2,#1
BNE LOOP4
// /Задержка

LSR R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOP5:
SUBS R2,R2,#1
BNE LOOP5
// /Задержка

// Вывод на 2 индикаторе=========================
LSL R7, #8
LSL R7, #1

STR R7, [R0]
//Задержка
MOV R2, R9
LOOP6:
SUBS R2,R2,#1
BNE LOOP6
// /Задержка

LSL R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOP7:
SUBS R2,R2,#1
BNE LOOP7
// /Задержка

LSL R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOP8:
SUBS R2,R2,#1
BNE LOOP8
// /Задержка

// Вывод на 3 индикаторе=========================
LSL R7, #8
LSR R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOP9:
SUBS R2,R2,#1
BNE LOOP9
// /Задержка

LSR R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOP10:
SUBS R2,R2,#1
BNE LOOP10
// /Задержка

LSR R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOP11:
SUBS R2,R2,#1
BNE LOOP11
// /Задержка

// очистка 3 индикатора
MOVW R7, 0x0
STR R7, [R0]
// Вывод на 4 индикаторе=========================
MOVW R7, 0x2
STR R7, [R0,#0x10]
//Задержка
MOV R2, R9
LOOP4IND0:
SUBS R2,R2,#1
BNE LOOP4IND0

LSL R7, #1
STR R7, [R0,#0x10]
MOV R2, R9
LOOP4IND1:
SUBS R2,R2,#1
BNE LOOP4IND1

LSL R7, #1
STR R7, [R0,#0x10]
//Задержка
MOV R2, R9
LOOP4IND2:
SUBS R2,R2,#1
BNE LOOP4IND2
// 

// Вывод на 5 индикаторе=========================
LSL R7, #8
LSR R7, #1
STR R7, [R0,#0x10]
//Задержка
MOV R2, R9
LOOP4IND3:
SUBS R2,R2,#1
BNE LOOP4IND3
// /Задержка

LSR R7, #1
STR R7, [R0,#0x10]
//Задержка
MOV R2, R9
LOOP4IND4:
SUBS R2,R2,#1
BNE LOOP4IND4
// /Задержка

LSR R7, #1
STR R7, [R0,#0x10]
//Задержка
MOV R2, R9
LOOP4IND5:
SUBS R2,R2,#1
BNE LOOP4IND5
// /Задержка
// очистка 5 индикатора
MOVW R7, 0x0
STR R7, [R0,#0x10]
bx          lr
//======================================================================
// Тоже самое, только в о6ратном орядке=================================
//======================================================================
// Вывод на 5 индикаторе
BACKSNAKE:
LDR R0, =0xFF200000
LDR R10, [R0,#0x40]
MOV R11, #409600
MUL R9, R10, R11
MOVW R2,#0x0
MOVW R7,#0x0
LDR R0, =0xFF200020
STR R2, [R0]
STR R7,[R0,#0x10]
MOVW R7, 0x100
STR R7, [R0,#0x10]
//Задержка
MOV R2, R9
LOOPBACK0:
SUBS R2,R2,#1
BNE LOOPBACK0

LSL R7, #1
STR R7, [R0,#0x10]
MOV R2, R9
LOOPBACK1:
SUBS R2,R2,#1
BNE LOOPBACK1

LSL R7, #1
STR R7, [R0,#0x10]
//Задержка
MOV R2, R9
LOOPBACK2:
SUBS R2,R2,#1
BNE LOOPBACK2

// Вывод на 4 индикаторе=========================
LSR R7, #8
LSL R7, #1
STR R7, [R0,#0x10]
//Задержка
MOV R2, R9
LOOPBACK3:
SUBS R2,R2,#1
BNE LOOPBACK3

LSR R7, #1
STR R7, [R0,#0x10]
MOV R2, R9
LOOPBACK4:
SUBS R2,R2,#1
BNE LOOPBACK4

LSR R7, #1
STR R7, [R0,#0x10]
//Задержка
MOV R2, R9
LOOPBACK5:
SUBS R2,R2,#1
BNE LOOPBACK5
// очистка 4 семента
MOVW R7, 0x0
STR R7, [R0,#0x10]

// Вывод на 3 индикаторе
MOVW R7, 0x0
MOVT R7, 0x100
STR R7, [R0]
//Задержка
MOV R2, R9
LOOPBACK6:
SUBS R2,R2,#1
BNE LOOPBACK6

LSL R7, #1
STR R7, [R0]
MOV R2, R9
LOOPBACK7:
SUBS R2,R2,#1
BNE LOOPBACK7

LSL R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOPBACK8:
SUBS R2,R2,#1
BNE LOOPBACK8

// Вывод на 2 индикаторе=========================
LSR R7, #8
LSL R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOPBACK9:
SUBS R2,R2,#1
BNE LOOPBACK9

LSR R7, #1
STR R7, [R0]
MOV R2, R9
LOOPBACK10:
SUBS R2,R2,#1
BNE LOOPBACK10

LSR R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOPBACK11:
SUBS R2,R2,#1
BNE LOOPBACK11

// Вывод на 1 индикаторе===============================
LSR R7, #8
LSR R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOPBACK12:
SUBS R2,R2,#1
BNE LOOPBACK12

LSL R7, #1
STR R7, [R0]
MOV R2, R9
LOOPBACK13:
SUBS R2,R2,#1
BNE LOOPBACK13

LSL R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOPBACK14:
SUBS R2,R2,#1
BNE LOOPBACK14

// Вывод на 0 индикаторе=========================
LSR R7, #8
LSL R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOPBACK15:
SUBS R2,R2,#1
BNE LOOPBACK15

LSR R7, #1
STR R7, [R0]
MOV R2, R9
LOOPBACK16:
SUBS R2,R2,#1
BNE LOOPBACK16

LSR R7, #1
STR R7, [R0]
//Задержка
MOV R2, R9
LOOPBACK17:
SUBS R2,R2,#1
BNE LOOPBACK17
// очистка 0 семента
MOVW R7, 0x0
STR R7, [R0]
bx          lr


