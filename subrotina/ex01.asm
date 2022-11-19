# Yasmin

# Escreva uma subrotina que retorne a média entre três valores. A subrotina deve
# receber como argumentos três inteiros e retornar a média entre eles. Escreva um
# programa para testar a subrotina que leia três valores do usuário e imprima o
# resultado. Importante: Utilize os registradores convencionados para a passagem de
# argumentos e valor de retorno! Armazene o retorno da subrotina (média entre os três
# valores) no registrador $t5

.data
	string: .asciiz "Digite tres valores: "
	
.text
	li $v0, 4			# mostra frase na tela
	la $a0, string
	syscall
	
	li $v0, 5			# le o primeiro num
	syscall
	move $s1, $v0
	
	li $v0, 5			# le o segundo num
	syscall
	move $s2, $v0
	
	li $v0, 5			# le o terceiro num
	syscall
	move $s3, $v0
	
	# passa argumentos
	move $a0, $s1
	move $a1, $s2
	move $a2, $s3
	jal media		# chama subrotina
	move $t5, $v0	# recebe valores de retorno
	
	li $v0, 1		# print do numero
	move $a0, $t5
	syscall
	j fim

	
	fim:			# encerra programa
	li $v0, 10
	syscall
	
	
	media: 		# faz calculo da média
	add $t1, $a0, $a1
	add $t1, $t1, $a2
	li $t2, 3
	div $t1, $t2
	mflo $v0
	jr $ra