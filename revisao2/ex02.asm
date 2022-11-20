# YASMIN
# Crie um programa para calcular a soma S de todos os números pares dentre os N
# números informados pelo usuário. Inicialmente, o número N deverá ser lido pelo
# teclado e, logo depois, serão lidos os N valores. Os N valores lidos devem ser
# armazenados na memória. O resultado S da soma de pares deverá ser apresentado na
# tela, assim como a quantidade Q de valores pares.
# Você deve criar uma sub-rotina para a leitura dos valores e uma sub-rotina para
# encontrar e somar os pares.

.data
	string1: .asciiz "\nDigite a quantidade de numeros: "
	string2: .asciiz "\nDigite um numero: "
	string3: .asciiz "\nSoma: "
	string4: .asciiz "\nQuantidade: "
	numeros: .space 200
	
.text
	li $v0, 4				# pergunta quantidade de numeros
	la $a0, string1
	syscall
	li $v0, 5				# lê quantidade
	syscall
	
	move $s1, $v0			# guarda a quantidade de numeros
	
	move $a0, $s1			# passa argumentos
	la $a1, numeros
	jal leituraValores
	
	move $a0, $s1			# passa argumentos
	la $a1, numeros
	jal pares
	move $s2, $v0			# recebendo argumentos
	move $s3, $v1
	
	# mostra resultados
	li $v0, 4				
	la $a0, string3
	syscall
	li $v0, 1				
	move $a0, $s2
	syscall
	
	li $v0, 4				
	la $a0, string4
	syscall
	li $v0, 1				
	move $a0, $s3
	syscall
	
	j sair
	
			
	leituraValores:
		move $t0, $a0
		move $t1, $a1
		li $t2, 0
		while: 
			beq $t2, $t0, continua
			
			li $v0, 4				# mensagem
			la $a0, string2
			syscall
			li $v0, 5				# lê num
			syscall
			sw $v0, 0($t1)			# armazena na memória
			
			addi $t2, $t2, 1		# cont++
			addi $t1, $t1, 4		# anda para a próxima posição
		j while
		continua:
		jr $ra
		
	pares:
		move $t0, $a0	# quantidade de numeros
		move $t1, $a1	# endereço vetor
		li $t2, 0		#	cont
		
		li $t4, 0		#	quantidade de numero pares
		li $t5, 0		#	soma dos pares
		
		while2: 
			beq $t2, $t0, continua3
			
			lw $t3, 0($t1)	# pega valor do vetor
			li $t8, 2		
			div $t3, $t8		# vê se é par
			mfhi $t8
			bne $t8, $zero, continua2
				# se for par
				add $t5, $t5, $t3		# soma valor com o total
				addi $t4, $t4, 1		# mais um valor encontrado
			
			continua2:
			addi $t2, $t2, 1		# cont++
			addi $t1, $t1, 4		# anda para a próxima posição
		j while2
		
		continua3:
		move $v0, $t4
		move $v1, $t5
		jr $ra
	
	sair:
	li $v0, 10
	syscall
