# YASMIN
# Escreva um programa que conte com tr�s subrotinas capazes de calcular a �rea da
# circunfer�ncia (?*r^2), do tri�ngulo (b*a/2) e do ret�ngulo (b*a). Inicialmente,
# pergunte ao usu�rio (use syscall) qual forma geom�trica ele deseja (armazenando no
# registrador $t0) e depois solicite as medidas necess�rias para calcular a �rea de cada
# forma (armazenar para circunfer�ncia o valor r em $t0, tri�ngulo e ret�ngulo
# armazenar valor de a e b em $t0 e $t1, respectivamente). Ao final, imprima a �rea
# desejada. Respeite as conven��es de uso dos registradores

.data
	menu: .asciiz "1) Circufer�ncia\n2) Triangulo\n3) Retangulo\nEcolha uma area para calcular: "
	frasecircufer�ncia: .asciiz "\nDigite o raio: \n"
	frasetrinaguloretangulo: .asciiz "\nDigite a base e a altura: \n"
	
.text
	li $v0, 4		# mostra menu
	la $a0, menu
	syscall
	
	li $v0, 5		# le op��o do menu
	syscall
	move $t0, $v0
	
	# testa op��o digitada
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
		la $a0, frasecircufer�ncia
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