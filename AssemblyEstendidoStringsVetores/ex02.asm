# YASMIN
# Escreva um programa que altere uma string para “capitalizar” a primeira letra de cada
# palavra. Por exemplo, a entrada
# .data
# string: .asciiz "meu professor é muito bom"
# deve produzir a string "Meu Professor É Muito Bom"
# Assuma que a entrada possui apenas espaços e letras minúsculas. Pode haver mais de
# um espaço entre as palavras.
# A resposta deve ser a string de entrada modificada, e não uma nova string na
# memória, ou seja, iniciando no endereço de memória 0x10010000

.data
	string: .asciiz "meu professor é muito      bom"
	
.text 
	la $s1, string	# carrega endereço da string
	li $s7, 0x20	# código do espaco
	li $s6, 1		# váriavel booleana para indicar que tem que capitalizar
	
	while:
		lb $s2, 0($s1)						# carrega caracter
		beq $s2, $zero, sair				# testa se é o final da string
		beq $s2, $s7, espaco				# testa se é um espaço
		bne $s6, $zero, capitalizar	# testa se tem que capitalizar
		
		volta:
		addi $s1, $s1, 1					# vai para o próximo endereço da string
	j while
	
	
	espaco:						# se é um espaco a proxima letra tem que ser capitalizada
		li $s6, 1
		j volta
		
	capitalizar:				# capitaliza a letra e coloca na memória
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