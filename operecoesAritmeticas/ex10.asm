# YASMIN

# Fa�a um programa que calcule a �rea do tri�ngulo equil�tero abaixo e escreva o
# resultado em $t3.
# Armazene b em $t1 e h em $t2 utilizando as instru��es addi $t1, $zero, b e
# addi $t2, $zero, h, substituindo b e h pelos valores desejados, e sempre que precisar
# de b e h, utilize os valores armazenados nos registradores $t1 e $t2

addi $t1, $zero, 160
addi $t2, $zero, 120

addi $t4, $zero, 2

mult $t1, $t2	# b * h
mflo $t3 

div $t3, $t4
mflo $t3



