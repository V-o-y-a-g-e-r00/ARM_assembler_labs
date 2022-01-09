.text
.global _start
B _start
B SERVISE_UND
B SERVISE_SVC
B SERVISE_ABT_INST
B SERVISE_ABT_DATA
.word 0
B SERVISE_IRQ
B SERVISE_FIQ
_start:
MOV R1, #0b11010010
MSR CPSR_c, R1
LDR SP, =0xFFFFFFFF-3
MOV R1, #0b11010011
MSR CPSR_c, R1
LDR SP, =0x3FFFFFFF-3
BL CONFIG_GIC
LDR R0, =0xFF200050
MOV R1, #0xF
STR R1, [R0, #0x8]
MOV R0, #0b01010011
MSR CPSR_c, R0

IDLE:
////////////////////////////////
// R0, R1 адреса индикаторов; R2 - для задержки R5 - для значения индикатора. R9 - вспомогательный.
LDR R0, ADRIND0
LDR R1, ADRIND4

MOVEFORWARD:
//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ MOVEBACK

// Вывод на 0 индикаторе
MOVW R5, 0x2
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP0:
SUBS R2, #1
BNE LOOP0

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK17

LSL R5, #1
STR R5, [R0]
LDR R2, DEL
LOOP1:
SUBS R2, #1
BNE LOOP1

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK16

LSL R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP2:
SUBS R2, #1
BNE LOOP2

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK15

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

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK14

LSR R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP4:
SUBS R2, #1
BNE LOOP4
// /Задержка

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK13

LSR R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP5:
SUBS R2, #1
BNE LOOP5
// /Задержка

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK12

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

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK11

LSL R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP7:
SUBS R2, #1
BNE LOOP7
// /Задержка

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK10

LSL R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP8:
SUBS R2, #1
BNE LOOP8
// /Задержка

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK9

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

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK8

LSR R5, #1
STR R5, [R0]
//Задержка
LDR R2, DEL
LOOP10:
SUBS R2, #1
BNE LOOP10
// /Задержка

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK7

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

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK6

// Вывод на 4 индикаторе=========================
MOVW R5, 0x2
STR R5, [R1]
//Задержка
LDR R2, DEL
LOOP4IND0:
SUBS R2, #1
BNE LOOP4IND0

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK5

LSL R5, #1
STR R5, [R1]
LDR R2, DEL
LOOP4IND1:
SUBS R2, #1
BNE LOOP4IND1

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK4

LSL R5, #1
STR R5, [R1]
//Задержка
LDR R2, DEL
LOOP4IND2:
SUBS R2, #1
BNE LOOP4IND2
// 
//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK3


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

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK2

LSR R5, #1
STR R5, [R1]
//Задержка
LDR R2, DEL
LOOP4IND4:
SUBS R2, #1
BNE LOOP4IND4
// /Задержка

//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK1

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
//
//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x1
CMP R3, R9
BEQ LOOPBACK0

B MOVEFORWARD

MOVEBACK:
//Проверка, какая кнопка нажата
LDR R3, MOVEDIRECTION
LDR R9, =0x0
CMP R3, R9
BEQ MOVEFORWARD

//движение назад
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

B MOVEBACK

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
B IDLE
SERVISE_UND:
B SERVISE_UND
SERVISE_SVC:
B SERVISE_SVC
SERVISE_ABT_INST:
B SERVISE_ABT_INST
SERVISE_ABT_DATA:
B SERVISE_ABT_DATA
SERVISE_IRQ:
PUSH {R0-R7, LR}
LDR R4, =0xFFFEC100
LDR R5, [R4, #0x0C]
FPGA_IRQ1_HANDLER:
CMP R5, #73

UNEXPECTED:
BNE UNEXPECTED
BL KEY_ISR
EXIT_IRQ:
STR R5, [R4, #0x10]
POP {R0-R7, LR}
SUBS PC, LR, #4
SERVISE_FIQ:
B SERVISE_FIQ

CONFIG_GIC:
PUSH {LR}
MOV R0, #73
MOV R1, #1
BL CONFIG_INTERRUPT
LDR R0, =0xFFFEC100
LDR R1, =0xFFFF
STR R1, [R0, #0x04]
MOV R1, #1
STR R1, [R0]
LDR R0, =0xFFFED000
STR R1, [R0]
POP {PC}

CONFIG_INTERRUPT:
PUSH {R4-R5, LR}
LSR R4, R0, #3
BIC R4, R4, #3
LDR R2, =0xFFFED100
ADD R4, R2, R4
AND R2, R0, #0x1F
MOV R5, #1
LSL R2, R5, R2
LDR R3, [R4]
ORR R3, R3, R2
STR R3, [R4]
BIC R4, R0, #3

///////СТРАНИЦА 4//////////
LDR R2, =0xFFFED800
ADD R4, R2, R4
AND R2, R0, #3
ADD R4, R2, R4
STRB R1, [R4]
POP {R4-R5, PC}
KEY_ISR:
LDR R0, =0xFF200050
LDR R1, [R0, #0xC]
MOV R2, #0xF
STR R2, [R0,#0xC]
LDR R0, =0xFF200020
//прямое движение змейки
CHECK_KEY0:
MOV R3, #0x1
ANDS R3, R3, R1
BEQ CHECK_KEY1
//код, выполняющийся при нажатии кнопки
MOV R2, #0b0
STR R2, MOVEDIRECTION
B END_KEY_ISR
//обратное движение змейки
CHECK_KEY1:
MOV R3, #0x2
ANDS R3, R3, R1
BEQ CHECK_KEY2
MOV R2, #0b1
STR R2, MOVEDIRECTION
B END_KEY_ISR


CHECK_KEY2:
MOV R3, #0x4
ANDS R3, R3, R1
BEQ IS_KEY3
MOV R2, #0b01011011
STR R2, [R0]
B END_KEY_ISR
IS_KEY3:
MOV R2, #0b01001111

////////////СТРАНИЦА 5/////////////
STR R2, [R0]
END_KEY_ISR:
LDR R9, =0x40000000 //можно будет убрать
DL:SUBS R9, R9, #1
BNE DL
MOV R2, #0
STR R2, [R0]
BX LR

//////////////////////////
ADRIND0: .word 0xFF200020
ADRIND4: .word 0xFF200030
DEL: .word 0x30000000
//Для организации условных переходов по кнопкам
MOVEDIRECTION: .word 0x0 //направление змейки


.end
