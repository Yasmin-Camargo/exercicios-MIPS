# YASMIN
# Leia dois vetores de 5 números inteiros (word) e armazene na memória iniciando na
# posição 0x10010000. Concatene os vetores e imprima o resultado na tela

.data
	vetor1: .word 1, 5, 4, 3, 5 
	vetor2: .word 2, 3, 4, 6, 8
	saida: .space 40
	
.text
	la $s0, vetor1		# carrega endereços
	la $s1, vetor2
	la $s2, saida
	
	li $t0, 5			# tamanho do vetor
	li $t1, 0			# cont
	
	while:
		beq $t1, $t0, print
		lw $t2, 0($s0)	# le valores
		lw $t3, 0($s1)
		
		sw $t2, 0($s2)	# armazena valores
		addi $s2, $s2, 4
		sw $t3, 0($s2)	
		
		addi $s2, $s2, 4
		addi $s0, $s0, 4	# vai para proxima posição do vetor
		addi $s1, $s1, 4
		addi $t1, $t1, 1	# cont++
	j while

	print:
		li $t0, 10			# tamanho do vetor
		li $t1, 0			# cont
		la $s2, saida 		# carrega endereco vetor
		while2:
			beq $t1, $t0, sair
			li $v0, 1		# mostra na tela
			lw $a0, 0($s2)
			syscall
			addi $s2, $s2, 4	# cont++
			addi $t1, $t1, 1	# cont++
		j while2
		
	sair:
	li $v0, 10	# encerra programa
	syscall