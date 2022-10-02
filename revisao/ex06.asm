# YASMIN

# Escreva um programa que calcule o n�mero de bits significativos de um n�mero
# inteiro positivo. Inicie o programa com a instru��o ori $t1, $0, x, substituindo x pelo
# valor desejado. Armazene o resultado final no registrador $t2.

ori $t1, $0, 5	# valor
ori $t2, $zero, 0 # numero de bits significativos

while: 
   beq $t1, $zero, fim  # Teste se o n�mero � igual a zero (porque se for, significa que n�o h� mais uns)
   srl $t1, $t1, 1 	# Desloca a direita 
   addi $t2, $t2, 1 	# numero de bits + 1
   j while
    
fim: