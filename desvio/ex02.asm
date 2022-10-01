# YASMIN

# Escreva um programa que calcule:
# 1 + 2 + 3 + … + 333
# Escreva o resultado (y) em uma palavra (4 bytes) de memória. O resultado deve ser
# armazenado, obrigatoriamente, na posição 0x10010000 da memória .data. Inicie o
# código com:
# .data
# y: .space 4

.data
   y: .space 4
   
.text

main: 
   lui $t0, 0x1001
   
   ori $t1, $zero, 1  # i
   ori $t2, $zero, 0  # Resultado
   ori $t3, $zero, 0  # flag


while:
   slti $t3, $t1, 334  # flag = i <= 333
   beq $t3, $zero, fim # se for maior pula
   
   add $t2, $t2, $t1  # resultado = resultado + i
   addi $t1, $t1, 1   # i = i + 1
   
   j while
   
fim:
sw $t2, 0($t0)
