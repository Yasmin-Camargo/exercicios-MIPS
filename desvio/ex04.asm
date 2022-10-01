# YASMIN

# Uma temperatura, armazenada em $t0, pode ficar em dois intervalos:
# 20 <= temp <= 40 e
# 60 <= temp <= 80.
# Escreva um programa que coloque uma flag (registrador $t1) para 1 se a
# temperatura está entre os valores permitidos e para 0 caso contrário.
# Inicie o código com a instrução: ori $t0, $zero, temperatura, substituindo
# temperatura por um valor qualquer.

ori $t0, $zero, 81

main: 			 # Teste 1
   slti $t1, $t0, 20     # t0 > 20
   bne $t1, $zero, teste2
   
   slti $t1, $t0, 41     # t0 < 40
   beq $t1, $zero, teste2
   
   j fim
   
 teste2:  		# Teste 2
   slti $t1, $t0, 60     # t0 > 60
   bne $t1, $zero, nao
   
   slti $t1, $t0, 81     # t0 < 80
   beq $t1, $zero, nao
   
   j fim
  
nao:
   ori $t0, $zero, 999
   
fim: 