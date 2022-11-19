# YASMIN
# Escreva um programa que leia um vetor de 10 posições (.word) da memória
# (começando na posição 0x10010000) e verifique se o vetor está ou não ordenado.
# Use o registrador $t0 como flag.
# Faça $t0 = 1 se o vetor estiver ordenado e $t0 = 0 caso contrário.

.data
	vetor: .word  1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
	li $t0, 1		# indica se esta ordenado ou não
	la $s1, vetor	# carrega endereco
	
	li $t1, 1		# contador
	li $t2, 10		# máximo de números no vetor
	
	lw $s5, 0($s1)	# anterior
	addi $s1, $s1, 4
	
	while:
		beq $t1, $t2, sair	# verifica se chegou no final do vetor
		lw $s2, 0($s1)			# carrega valor
		
		slt $t8, $s5, $s2
		beq $t8, $zero, desordenado
		
		move $s5, $s2		# atualiza valor anterior
		addi $s1, $s1, 4	# vai para o próximo endereço do veto
		addi $t1, $t1, 1	# incrementa mais um
	j while

	desordenado:
	li $t0, 0	# indica que não esta ordenado
	
	sair:
	li $v0, 1	# mostra na tela valor do registrador $t0
	move $a0, $t0
	
	syscall
	li $v0, 10
	syscall