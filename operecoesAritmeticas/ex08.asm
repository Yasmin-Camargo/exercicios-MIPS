# YASMIN

# Faça um programa que calcule a seguinte equação:
# y = 3x^2 - 5x + 13
# Armazene x no registrador $t5 com a instrução addi $t5, $zero, x, substituindo x pelo
# valor desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
# registrador $t5.
# Armazene o resultado y no registrador $t6.
# Faça teste com diferentes valores positivos e negativos de x.
# Faça um teste substituindo a primeira instrução addi por uma instrução ori
# equivalente e responda, nos comentários, qual o resultado quando são usados números
# positivos e números negativos.

addi $t5, $zero, -2

mult $t5, $t5 		# x^2
mflo $t6	

sll $t3, $t6, 1		# 3(x^2)
add $t6, $t3, $t6

sll $t3, $t5, 2		#  5x
add $t3, $t3, $t5

sub $t6, $t6, $t3 	# 3x^2 - 5x

addi $t6, $t6, 13

# Se x = 2, y = 15
# Se x = -2, y = 35
# A instrução ori é uma instrução lógica e portanto não aceita números com sinal



