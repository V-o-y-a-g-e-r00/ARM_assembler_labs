.text
.
global _start

_start:
// R0, R1 ������ �����������; R2 - ��� �������� R5 - ��� �������� ����������. 
LDR R0, ADRIND0
LDR R1, ADRIND4

// ����� �� 0 ���������===========================
MOVW R5, 0x1
STR R5, [R0]
// ��������
LDR R2, DEL
LOOP0:
SUBS R2, #1
BNE LOOP0
// /��������

LSL R5, #1
STR R5, [R0]
// ��������
LDR R2, DEL
LOOP1:
SUBS R2, #1
BNE LOOP1
// /��������

LSL R5, #1
STR R5, [R0]
// ��������
LDR R2, DEL
LOOP2:
SUBS R2, #1
BNE LOOP2
// /��������

// ����� �� 1 ���������===========================
LSL R5, #8
LSR R5, #1
STR R5, [R0]
// ��������
LDR R2, DEL
LOOP3:
SUBS R2, #1
BNE LOOP3
// /��������


LSR R5, #1
STR R5, [R0]
// ��������
LDR R2, DEL
LOOP4:
SUBS R2, #1
BNE LOOP4
// /��������

LSR R5, #1
STR R5, [R0]
// ��������
LDR R2, DEL
LOOP5:
SUBS R2, #1
BNE LOOP5
// /��������



fin: B fin
ADRIND0: .word 0xFF200020
ADRIND4: .word 0xFF200030
DEL: .word 0x30000000
.end