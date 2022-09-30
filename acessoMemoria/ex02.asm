# YASMIN

# Faça um programa que calcule o seguinte polinômio usando o método de Horner:
# y = 9a^3 - 5a^2 + 7a + 15
# Utilize endereços de memória para armazenar o valor de a e o resultado y. Cada
# valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space
# 4). Utilize as duas primeiras posições da memória .data para armazenar,
# consecutivamente, a e y, iniciando o código com:
# .data
# a: .word 3
# y: .space 4
# Observe como o método de Horner é mais eficiente (faz menos operações) que
# calcular o polinômio de forma sequencial.

.data
   a: .word 3
   y: .space 4

.text
   lui $t0, 0x1001
   lw $t1, 0($t0) # a
   
   addi $t2, $zero, 9 	# repete primeiro constante que multiplica a
   
   mult $t2, $t1	# Multiplica o que tem por b
   mflo $t2
   addi $t2, $t2, -5	# Soma com a proxima constante
   
   mult $t2, $t1
   mflo $t2
   addi $t2, $t2, 7
   
   mult $t2, $t1
   mflo $t2
   addi $t2, $t2, 15
   
   sw $t2, 4($t0)
   

# Resolução
#  	3 | 9   -5   7   15
#    	  | 9    22  73  234
   