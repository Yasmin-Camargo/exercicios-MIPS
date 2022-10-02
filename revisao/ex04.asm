# YASMIN

# Escreva um programa que calcule o fatorial de n.
# O valor de n deve ser lido da memória na posição 0x10010000 e o valor de n! deve
# ser escrito na posição seguinte na memória (0x10010004).

.data 
   n: .word 10
   y: .space 4
   
.text 
   lui $t0, 0x1001	
   lw $t1, 0($t0)	
   or $t2, $zero, $t1	# i = n
   ori $t3, $zero, 1 	# resultado
   
    while:
       beq $t2, $zero, fim
       mult $t3, $t2 		# n * i
       mflo $t3
       addi $t2, $t2, -1	# i = i - 1
       j while
       
    fim: 
      sw $t3, 4($t0)  
