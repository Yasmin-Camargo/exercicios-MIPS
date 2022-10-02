# YASMIN

# Escreva um programa que calcule o produtório abaixo. O valor de n deve ser lido da
# posição 0x10010000 da memória no início do programa. O valor de A deve ser
# escrito na memória no fim do programa, na posição 0x10010004.
# OBS: considere a divisão inteira, i.e.:
# 1 / 2 = 0,
# 2 / 2 = 1,
# 3 / 2 = 1,
# 4 / 2 = 2, etc.

.data 
   a: .word 5
   y: .space 4
   
.text
   lui $t0, 0x1001
   lw $t1, 0($t0) 	# x
   
   ori $t2, $zero, 0	# i = 0
   ori $t5, $zero, 1 	
   
   add $t4, $zero, $t1 	# t4 = x
   addi $t4, $t4, 1 	# t4 = x + 1
    
   while: 
      slt $t3, $t2, $t4  # i < x
      beq $t3, $zero, fim
      
      srl $t3, $t2, 1  	# i / 2
      add $t3, $t1, $t3	# n + (i / 2)
      
      mult $t5, $t3
      mflo $t5
      
      addi $t2, $t2, 1	# i = i + 1
      j while
      
   fim:
      sw $t5, 4($t0)
      
   
   
   