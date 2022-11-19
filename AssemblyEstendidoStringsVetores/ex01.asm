# YASMIN
# Escreva um programa que remova os espa�os de uma string. Por exemplo, a entrada
# .data
# string: .asciiz �Gosto muito do meu professor de AOC-I."
# deve produzir a string " GostomuitodomeuprofessordeAOC-I.�
# Use apenas uma string (n�o use uma string de sa�da ou uma string auxiliar no seu programa). N�o esque�a de terminar sua string com nulo (ver tabela ASCII para
# c�digo do espa�o e do \0 (null)). A resposta deve ser a string de entrada modificada, e n�o uma nova string na mem�ria, ou seja, iniciando no endere�o de mem�ria 0x10010000

.data
	string: .asciiz "Gosto muito do meu professor de AOC-I"
	
.text
	la $s0, string		# controla string original
	la $s5, string		# controla string sem espaco
	li $s2, 0x20		# c�digo do espaco
	
	while:
		lb $s1, 0($s0)				# carrega caracter
		beq $s1, $zero, sair		# testa  se chegou no final da string
		beq $s1, $s2, espaco		# testa se o caracter lido � um espaco
		
		sb $s1, 0($s5)				# armazena letra lida (ignorando os epa�os)
		
		volta:
		addi $s0, $s0, 1			# vai para o pr�ximo endere�o do caracter
		addi $s5, $s5, 1
	j while
		
	espaco:					# se � um espa�o n�o incrementa contador
	addi $s5, $s5, -1
	j volta
	
	sair:
	addi $s5, $s5, 1	# coloca um /0 no final da string
	li $s1, 0
	sb $s1, 0($s5)

	li $v0, 4			# mostra string na tela
	la $a0, string
	syscall

	li $v0, 10			# encerra o programa
	syscall

	
	
	