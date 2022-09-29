# YASMIN

# Escreva a sequência 0x12345678 em $t1. A seguir, escreva um código
# que inverta a sequência, escrevendo 0x87654321 em $t2. Obviamente o
# código deve inverter os bits de $t1 e não simplesmente
# escrever 0x87654321 diretamente em $t2.

ori $t1, $zero, 0x1234
sll $t1, $t1, 16
ori $t1, $t1, 0x5678

srl $t2, $t1, 28

srl $t3, $t1, 24 # Pega o numero que quer e coloca na ponta direita 	t3 = 0x0012
sll $t3, $t3, 28 # Como tem todos os outros numeros juntos, empurra para outra ponta para "limpar" 	t3 = 0x2000
srl $t3, $t3, 24 # Posiciona onde tu quer adicionar 	t3 = 0x0020
or $t2, $t3, $t2 # Coloca na variavel t1 = 0x0021

srl $t3, $t1, 20
sll $t3, $t3, 28
srl $t3, $t3, 20
or $t2, $t3, $t2

srl $t3, $t1, 16
sll $t3, $t3, 28
srl $t3, $t3, 16
or $t2, $t3, $t2

srl $t3, $t1, 12
sll $t3, $t3, 28
srl $t3, $t3, 12
or $t2, $t3, $t2

srl $t3, $t1, 8
sll $t3, $t3, 28
srl $t3, $t3, 8
or $t2, $t3, $t2

srl $t3, $t1, 4
sll $t3, $t3, 28
srl $t3, $t3, 4
or $t2, $t3, $t2

srl $t3, $t1, 0
sll $t3, $t3, 28
or $t2, $t3, $t2