.text
.global _start
_start:
PUSH {LR}
MOV R0, #101 //сохраняем ID запроса в R0
MOV R1, #1 //СОХРАНЯЕМ В R1 МАСКУ НАПРАВЛЕНИЯ НА CPU (CPU0)
BL CONFIG_INTERRUPT //ПУТЬ В РАСПРЕДЕЛИТЕЛЬ
LDR R0, =0xFFFEC100 //НАЧАЛЬНЫЙ АДРЕС РАГИСТРОВ CPU - ИНТЕРФЕЙСА
MOV R1, R6 //КОПИРУЕМ ПРИОРИТЕТ В R1
STRB R1, [R0, #0x04] //УСТАНОВКА МАСКИ ПРИОРИТЕТА
LDRSB R2, [R0, #0x04] //ЧТЕНИЕ МАСКИ ПРИОРИТЕТА В РЕГИСТРЕ CPU-ИНТЕРФЕЙСА
MOV R1, #1 //УСТАНОВКА УРОВНЯ ВКЛЮЧЕНИЯ БЛОКОВ
STR R1, [R0] //ВКЛЮЧЕНИЕ БЛОКА CPU-ИНТЕРФЕЙСА
LDR R0, =0xFFFED000 //АДРЕС РЕГИСТРА ВКЛЮЧЕНИЯ РАСПРЕДЕЛИТЕЛЯ
STR R1, [R0] //ВКЛЮЧЕНИЕ БЛОКА РАСПРЕДЕЛИТЕЛЯ
POP {PC}

CONFIG_INTERRUPT: //НАСТРОЙКА РЕГИСТРОВ РАСПРЕДЕЛИТЕЛЯ
PUSH {R4-R5, LR}
LSR R4, R0, #3 //ОПРЕДЕЛИМ БАЙТ, СОДЕРЖАЩИЙ БИТ 101
BIC R4, R4, #3 //ОПРЕД АДРЕС РЕГИСТРА, СОДЕРЖАЩЕГО ЭТОТ БАЙТ
LDR R2, =0xFFFED100 //НАЧАЛЬНЫЙ АДРЕС РЕГИСТРА РАЗРЕШЕНИЯ
ADD R4, R2, R4 //ПОЛНЫЙ АДРЕС РЕГИСТРА РАЗРЕШЕНИЯ ДЛЯ ID 101
AND R2, R0, #0x1F //ВЫДЕЛИМ КОЛИЧЕСТВО БИТ СМЕЩЕНИЯ
MOV R5, #1 //МАСКА РАЗРЕШЕНИЯ
LSL R2, R5, R2 //УСТАНОВКА МАСКИ
LDR R3, [R4]
ORR R3, R3, R2
STR R3, [R4]
BIC R4, R0, #3
LDR R2, =0xFFFED400
ADD R4, R2, R4
AND R2, R0, #3
ADD R4, R2, R4
MOV R5, #8
STRB R5, [R4]
LDRSB R6,[R4]
BIC R4, R0, #3
LDR R2, =0xFFFED800
ADD R4, R2, R4
AND R2, R0, #3
ADD R4, R2, R4
STRB R1, [R4]
POP {R4-R5, PC}
.end