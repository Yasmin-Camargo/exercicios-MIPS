# Yasmin

# Declare três vetores do mesmo tamanho:
# .data
# tamanho: .word 7
# vetor1: .word -30, -23, 56, -43, 72, -18, 71
# vetor2: .word 45, 23, 21, -23, -82, 0, 69
# soma: .word 0, 0, 0, 0, 0, 0, 0
# Inicialize um ponteiro para cada vetor (pseudo-instrução la) e faça a soma dos
# elementos dos vetores 2 a 2.
# O vetor resultante deve ser armazenado depois dos elementos do segundo vetor.
# Exemplo: soma[i] = vetor1[i]+vetor2[i]

.data
	tamanho: .word 7
	vetor1: .word -30, -23, 56, -43, 72, -18, 71
	vetor2: .word 45, 23, 21, -23, -82, 0, 69
	soma: .word 0, 0, 0, 0, 0, 0, 0
	separar: .asciiz "  "

.text
	la $s0, vetor1		# carrega enderecos
	la $s1, vetor2
	la $s2, soma
	
	lw $t1, tamanho	# n
	la $t2, 1			# contador
	
	while:
		beq $t2, $t1, print	# testa se chegou no final
		
		lw $t3, 0($s0)			# carrega valores
		lw $t4, 0($s1)
		add $t8, $t3, $t4		# realiza a soma
		sw $t8, 0($s2)			# armazena resultado
	
		addi $s0, $s0, 4		# avança para as proximas posições do vetor
		addi $s1, $s1, 4
		addi $s2, $s2, 4
		addi $t2, $t2, 1	# i++
	j while
		
	print:
		lw $t1, tamanho	# n
		la $t2, 1			# contador
		la $s2, soma
		while2:
			beq $t2, $t1, sair	# testa se chegou no final
			lw $t3, 0($s2)	
			li $v0, 1
			move $a0, $t3			# mostra numeros na tela
			syscall
			li $v0, 4				# coloca um espaço entre os números
			la $a0, separar
			syscall
			
			addi $s2, $s2, 4		# avança no vetor
			addi $t2, $t2, 1		# i++
		j while2
		
	sair:
	li $v0, 10		# encerra programa
	syscall



