# YASMIN
# Escreva um programa que altere uma string para �capitalizar� a primeira letra de cada
# palavra. Por exemplo, a entrada
# .data
# string: .asciiz "meu professor � muito bom"
# deve produzir a string "Meu Professor � Muito Bom"
# Assuma que a entrada possui apenas espa�os e letras min�sculas. Pode haver mais de
# um espa�o entre as palavras.
# A resposta deve ser a string de entrada modificada, e n�o uma nova string na
# mem�ria, ou seja, iniciando no endere�o de mem�ria 0x10010000

.data
	string: .asciiz "meu professor � muito      bom"
	
.text 
	la $s1, string	# carrega endere�o da string
	li $s7, 0x20	# c�digo do espaco
	li $s6, 1		# v�riavel booleana para indicar que tem que capitalizar
	
	while:
		lb $s2, 0($s1)						# carrega caracter
		beq $s2, $zero, sair				# testa se � o final da string
		beq $s2, $s7, espaco				# testa se � um espa�o
		bne $s6, $zero, capitalizar	# testa se tem que capitalizar
		
		volta:
		addi $s1, $s1, 1					# vai para o pr�ximo endere�o da string
	j while
	
	
	espaco:						# se � um espaco a proxima letra tem que ser capitalizada
		li $s6, 1
		j volta
		
	capitalizar:				# capitaliza a letra e coloca na mem�ria
		addi $s2, $s2, -32
		sb $s2, 0($s1)
		li $s6, 0
		j volta
		
	sair:
	li $v0, 4		# mostra string na tela
	la $a0, string
	syscall	
			
	li $v0, 10		# encerra programa
	syscall