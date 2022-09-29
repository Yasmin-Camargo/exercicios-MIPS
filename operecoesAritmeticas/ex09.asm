# YASMIN

# Fa�a um programa que calcule a seguinte equa��o:
# (9X + 7) / (2X + 8)
# Armazene x em $t1, com a instru��o addi $t1, $zero, x, substituindo x pelo valor
# desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
# registrador $t1.
# Armazene o quociente da divis�o em $t2 e o resto em $t3.
# Responda o que acontece quando x = -4.

addi $t1, $zero, -4

ori $t5, $zero, 9

mult $t1, $t5		# 9X
mflo $t2
addi $t2, $t2, 7	# 9X + 7

sll $t3, $t1, 1		# 2X
addi $t3, $t3, 8	# 2X + 8

div $t2, $t3		# (9X + 7) / (2X + 8)
mflo $t2
mfhi $t3

# Quando o valor de � x = -4, acontece uma divis�o por zero e n�o s�o armazenados valores em hi e lo. 
# Portanto, � utilizado os valores do que estava armazenado antes em hi e lo
