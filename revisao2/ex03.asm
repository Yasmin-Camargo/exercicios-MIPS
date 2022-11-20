# YASMIN

# Escreva um programa que leia uma string de entrada e armazene na mem�ria
# iniciando na posi��o 0x10010000. Transforme os caracteres mai�sculos de uma
# string em min�sculos e os caracteres min�sculos em mai�sculos.
# Por exemplo, a entrada:
# �ONE RING to rule Them aLL�
# Deve produzir:
# �one ring TO RULE tHEM All�.
# OBS: Use apenas uma string (n�o use uma string de sa�da ou uma string auxiliar no
# seu programa). N�o esque�a de terminar a string com nulo. Mantenha a string de
# sa�da na mesma posi��o da string de entrada.

.data
	frase: .asciiz "Digite uma string: "
	string: .space 100
	
.text
	li $v0, 4			# mostra frase
	la $a0, frase
	syscall
	
	li $v0, 8			# le a string
	la $a0, string
	li $a1, 100
	syscall
	
	la $s1, string		# carrega endere�o da string
	while:
		lb $s2, 0($s1)
		beq $s2, $zero, sair		# testa se chegou no fim da string
		
		li $t8, 32					# codigo espaco
		beq $s2, $t8, continua	# se for um espaco ignora
		
		li $t8, 10					# codigo enter
		beq $s2, $t8, continua	# se for um enter ignora
		
		slti $t1, $s2, 91			# testa se � minusculo
		bne $t1, $zero, maiusculo
			
		minusculo:
			addi $s2, $s2, -32
			sb $s2, 0($s1)
			j continua
			
		maiusculo:
			addi $s2, $s2, 32
			sb $s2, 0($s1)
		
		continua:
		addi $s1, $s1, 1
	j while
	
	sair:
	li $v0, 4		# mostra string
	la $a0, string
	syscall
	
	li $v0, 10		# encerra programa
	syscall
		