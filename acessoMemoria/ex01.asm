# YASMIN

# Faça um programa que calcule a seguinte equação:
# y = 32ab - 3a + 7b - 13
# Utilize endereços de memória para armazenar o valore de a, b e o resultado y. Cada
# valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space
# 4). Utilize as três primeiras posições da memória .data para armazenar,
# consecutivamente, a, b e y, iniciando o código com:
# .data
# a: .word 3
# b: .word 5
# y: .space 4

.data
  a: .word 3
  b: .word 5
  y: .space 4
  
.text
  lui $t0, 0x1001
  lw $t1, 0($t0)	# a
  lw $t2, 4($t0)	# b

  mult $t1, $t2		# 32ab
  mflo $t3
  sll $t3, $t3, 5

  sll $t4, $t1, 1	# 3a
  add $t4, $t4, $t1

  sub $t3, $t3, $t4	# 32ab - 3a

  sll $t4, $t2, 3	# 7b
  sub $t4, $t4, $t2

  add $t3, $t3, $t4	# 32ab - 3a + 7b
  addi $t3, $t3, -13	# 32ab - 3a + 7b - 13

  sw $t3, 8($t0)

