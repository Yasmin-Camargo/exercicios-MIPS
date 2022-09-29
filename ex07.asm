# YASMIN

# Escreva um programa que calcule o valor de
# 4x - 2y + 3z (armazene os valores de x, y e z em $t1, $t2 e $t3,
# respectivamente) e coloque o resultado em $t7. Faça testes com alguns
# valores diferentes de x, y e z. Utilize apenas instruções já vistas na
# disciplina.

ori $t1, $zero, 5
ori $t2, $zero, 7
ori $t3, $zero, 3

sll $t1, $t1, 2
sll $t2, $t2, 1

sll $t4, $t3, 1
add $t3, $zero, $t3
add $t3, $t3, $t4

sub $t7, $t1, $t2
add $t7, $t7, $t3