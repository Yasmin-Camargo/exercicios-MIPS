# Yasmin
# Escreva um programa equivalente ao código C abaixo com o assembly do MIPS.
# Assim como no exemplo em C, utilize duas subrotinas (soma3n e soma). Armazene
# os valores em $t0, $t1, $t2 e $t3, para X, Y, Z e R, respectivamente.

.data
	x: .word 150
	y: .word 230
	z: .word 991
	r: .word 0
	
.text
	lw $t0, x	# carrega valores
	lw $t1, y
	lw $t2, z
	lw $t3, r
	
	move $a0, $t0	# passa argumentos
	move $a1, $t1
	move $a2, $t2
	
	jal soma3n		# chama subrotina
	sw $v0, r
	
	j sair


soma3n:				
	move $t1, $a2	# armazena valor passado como argumento
	
	# empilha
	addiu $sp, $sp, -4
	sw $t1, 0($sp)
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal soma			# chama subrotina
	move $t2, $v0	# pega retorno
	
	# desimpilha
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	lw $t1, 0($sp)
	addiu $sp, $sp, 4
	
	add $v0, $t2, $t1	# faz a soma e já coloca no registrador de retorno
	jr $ra

soma:
	add $v0, $a0, $a1
	jr $ra
	
sair:
	li $v0, 10	# sai do programa
	syscall