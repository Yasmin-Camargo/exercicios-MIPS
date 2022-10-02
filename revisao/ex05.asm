# YASMIN

# Escreva um programa que receba dois números em complemento de dois
# (armazenados em $s0 e $s1). Procure em um vetor (com início endereçado em $s3 e
# tamanho armazenado em $s4) quantos números existem com valores dentro do
# intervalo fechado definido por $s0 e $s1. Assuma que $s0 ? $s1.
# Utilize os registradores $s3 e $s4 apenas para armazenar o início e o tamanho do
# vetor

.data 
   n1: .word -2
   n2: .word 5
   in: .space 4
   tam: .word 8
   
   a: .word 3
   b: .word -2
   c: .word 5
   
.text
   lui $t0, 0x1001
   lw $s0, 0($t0)	# n1
   lw $s1, 4($t0)	# n2
   addi $s3, $t0, 8	# endereço inicial do vetor
   lw $s4, 12($t0)	# tamanho
   
   addi $t1, $zero, 1 	# i = 1
   addi $t3, $zero, 0 	# quantas vezes achou
   addi $s1, $s1, 1	# limite superior + 1  (para dar certo o <=)
   addi $s4, $s4, 1	# tamanho + 1  (para dar certo o <=)
   
   while:
      slt $t2, $t1, $s4 	# i <= tam
      beq $t2, $zero, fim
      lw $t4, 0($s3)		# vetor[i]
      
      if:
         slt $t2, $t4, $s0	# vetor < limite inferior ?
         bne $t2, $zero, else 	# se sim, sai
         slt $t2, $t4, $s1	# senão: vetor <= limite superior ?
         beq $t2, $zero, else	# se sim continua, se não sai
         addi $t3, $t3, 1	# quantas vezes achou + 1
      
      else:
      	 addi $t1, $t1, 1 	# i = i + 1
      	 addi $s3, $s3, 4 	# vetor vai para a proxima posição
         j while
         
   fim: