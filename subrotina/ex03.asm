# YASMIN
# Escreva um programa que conte com três subrotinas capazes de calcular a área da
# circunferência (?*r^2), do triângulo (b*a/2) e do retângulo (b*a). Inicialmente,
# pergunte ao usuário (use syscall) qual forma geométrica ele deseja (armazenando no
# registrador $t0) e depois solicite as medidas necessárias para calcular a área de cada
# forma (armazenar para circunferência o valor r em $t0, triângulo e retângulo
# armazenar valor de a e b em $t0 e $t1, respectivamente). Ao final, imprima a área
# desejada. Respeite as convenções de uso dos registradores

.data
	menu: .asciiz "1) Circuferência\n2) Triangulo\n3) Retangulo\nEcolha uma area para calcular: "
	frasecircuferência: .asciiz "\nDigite o raio: \n"
	frasetrinaguloretangulo: .asciiz "\nDigite a base e a altura: \n"
	
.text
	li $v0, 4		# mostra menu
	la $a0, menu
	syscall
	
	li $v0, 5		# le opção do menu
	syscall
	move $t0, $v0
	
	# testa opção digitada
	li $t8, 1
	beq $t0, $t8, circuferencia
	li $t8, 2
	beq $t0, $t8, triangulo
	j retangulo
	
	circuferencia:
	jal funcaocircuferencia
	move $t0, $v0
	j sair
	
	triangulo:
	jal funcaotriangulo
	move $t0, $v0
	j sair
	
	retangulo: 
	jal funcaoretandulo
	move $t0, $v0
	j sair
	
	funcaocircuferencia:
		li $v0, 4		# mostra frase
		la $a0, frasecircuferência
		syscall
		li $v0, 5		# le dado
		syscall
		move $t0, $v0
		
		mult $t0, $t0	# ?*r^2
		mflo $t0
		li $t1, 3
		mult $t0, $t1
		mflo $t0
		
		move $v0, $t0 
		jr $ra
		
	funcaotriangulo:
		li $v0, 4		# mostra frase
		la $a0, frasetrinaguloretangulo
		syscall
		li $v0, 5		# le dado
		syscall
		move $t0, $v0
		li $v0, 5		# le dado
		syscall
		move $t1, $v0
		
		mult $t0, $t1	# b . h / 2
		mflo $t0
		li $t1, 2
		div $t0, $t1
		mflo $v0
		jr $ra
		
	funcaoretandulo:
		li $v0, 4		# mostra frase
		la $a0, frasetrinaguloretangulo
		syscall
		li $v0, 5		# le dado
		syscall
		move $t0, $v0
		li $v0, 5		# le dado
		syscall
		move $t1, $v0
		
		mult $t0, $t1	# b . h
		mflo $v0
		jr $ra
		jr $ra
	
	sair:
	li $v0, 1		# print do resultado
	move $a0, $t0
	syscall
	
	li $v0, 10		# encerra programa
	syscall