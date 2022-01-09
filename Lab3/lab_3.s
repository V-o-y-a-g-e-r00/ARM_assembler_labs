.text
.global _start
_start: LDR R0, ADR
LDR R1,CNT
LDR R0, [R1]
ADR: .word 0x0F200020
CNT: .word 0xFFFFFFFF
.end
