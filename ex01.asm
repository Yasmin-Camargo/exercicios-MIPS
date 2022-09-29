# YASMIN

# Faça um programa que escreva o valor 0xDECADA70 no registrador
# $t7, incluindo um dígito hexadecimal por vez (isto é, insira letra por
# letra, individualmente) no registrador.

ori $t7, $zero, 0x000D
sll $t7, $t7, 4
ori $t7, $t7, 0x000E
sll $t7, $t7, 4
ori $t7, $t7, 0x000C
sll $t7, $t7, 4
ori $t7, $t7, 0x000A
sll $t7, $t7, 4
ori $t7, $t7, 0x000D
sll $t7, $t7, 4
ori $t7, $t7, 0x000A
sll $t7, $t7, 4
ori $t7, $t7, 0x0007
sll $t7, $t7, 4
ori $t7, $t7, 0x0000