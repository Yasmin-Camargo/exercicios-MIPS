# Yasmin
# Escreva um programa que repetidamente pergunte ao usuário pelo número de
# quilômetros viajados e litros de gasolina consumidos e depois imprima o número de
# quilômetros por litro. Para sair do programa, o usuário deve digitar 0 como número
# de quilômetros.
# Armazene todos os números de quilômetros por litro na memória, iniciando pelo
# endereço 0x10010000. 

.data
	saida: .space 200
	quilometros: .asciiz "Digite a quantidade de quilometros viajados: "
	gasolina: .asciiz "Digite a quantidade de litros de gasolina consumidos: "

.text
	la $s7, saida
	
	while:
		li $v0, 4				# mostra mensagem perguntando os quilometros viajados
		la $a0, quilometros
		syscall
		
		li $v0, 5				# le os km
		syscall
		move $s1, $v0			# salva no registrador
		
		beq $s1, $zero, sair	# se o usuario digitou 0, sai
		
		li $v0, 4				# mostra mensagem perguntando os litros consumidos
		la $a0, gasolina
		syscall
		li $v0, 5				# le os litros
		syscall
		move $s2, $v0			# salva no registrador
		
		div $s1, $s2			# realiza o calulo
		mflo $t1
		sw $t1, 0($s7)			# armazena na memória
		addi $s7, $s7, 4
	j while
	

	sair:
	li $v0, 10
	syscall