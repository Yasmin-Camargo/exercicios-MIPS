# YASMIN
# Escreva um programa que inverta a ordem dos elementos de um vetor (.word)  
# Por exemplo, a entrada: 1, 2, 3, 4, 5 deve produzir 5, 4, 3, 2, 1.
# A resposta deve ser o vetor de entrada modificado, e não um novo vetor na memória,
# ou seja, iniciando no endereço de memória 0x10010000.

.data
	num: .word 6
	vetor: .word 6, 5, 4, 3, 2, 1 

.text
	lw $t1, num
	addi $t1, $t1, -1 	
	li $t8, 4
	mult $t1, $t8
	mflo $t1
	
	la $s1, vetor 			# endereço inicio do vetor
	add $s2, $s1, $t1		# endereço fim do vetor
	
	while: 
		slt $t8, $s1, $s2
		beq $t8, $zero, fim
		
		lw $t1, 0($s1)			# inverte valores
		lw $t2, 0($s2)			
		sw $t2, 0($s1)
		sw $t1, 0($s2)

		addi $s2, $s2, -4		# anda mais uma posição
		addi $s1, $s1, 4		
	j while

fim:
	li $v0, 10
	syscall
	