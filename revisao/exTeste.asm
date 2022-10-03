# YASMIN

# Se OP = 0 calcular o valor do cubo (A * B * C), se OP = 1 cálcular a seguinte expressão: F = 6A - 2B + C 
# e se OP = 2 deve-se inverter os bits ímpares de C
# Armazenar o resultado na memória

.data
   OP: .word 2
   A: .word 2
   B: .word 3
   C: .word 0x00001101 
   y: .space 1

.text
   lui $t0, 0x1001
   lw $t1, 0($t0)	# OP
   lw $t2, 4($t0)	# A
   lw $t3, 8($t0)	# B
   lw $t4, 12($t0)	# C
   
   ori $t5, $zero, 0		# Inicializa t5 = 0
   beq $t1, $t5, volumeCubo	# OP = 0, cálculo do volume
   ori $t5, $t5, 1
   beq $t1, $t5, valorF		# OP = 1, cálculo da expressão
   				# Se nenhuma dos dois, inverte os bits impares
   inverterBits:
      ori $t5, $zero, 0x0101	# Valor 1 nas posições ímpares para inverter
      sll $t5, $t5, 16		
      ori $t5, $t5, 0x0101
      xor $t5, $t4, $t5		# Inverte com o xor
      j fim
      
      # Ex.: 		0x00001101
      #			0x01010101	XOR
      # Resultado:	0x01011000
      
   volumeCubo:
      mult $t2, $t3	# A * B
      mflo $t5
      mult $t5, $t4	# A * B * C
      mflo $t5
      j fim
   
   valorF:
      sll $t5, $t2, 3	# 6A
      sll $t2, $t2, 1
      sub $t5, $t5, $t2
      
      sll $t3, $t3, 1 	# 2B
      sub $t5, $t5, $t3	# 6A - 2B
      add $t5, $t5, $t4	# 6A - 2B + C
      j fim
      
   fim:
     sw $t5, 16($t0)
      