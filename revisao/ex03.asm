# YASMIN

# Escreva um programa que encontre a mediana de três valores lidos da memória. A
# mediana deve ser salva na posição 0x1001000C da memória.
# Exemplos:
# .data
# a: .word 3	| 19
# b: .word 2	| 9
# c: .word 6	| 6
# Mediana = 3	| 9

.data
  a: .word 3
  b: .word 2
  c: .word 6
  y: .space 4
  
.text
   lui $t0, 0x1001
   lw $t1, 0($t0)	# a
   lw $t2, 4($t0)	# b
   lw $t3, 8($t0)	# c
   
   # OBSERVAÇAO: t5 menor, t6 mediana, t7 maior
   # incia com: t1 < t2 < t3
   or $t5, $zero, $t1
   or $t6, $zero, $t2
   or $t7, $zero, $t3
   
  
  
   caso0: 		# t1 < t2 ?
     slt $t4, $t5, $t6 	
     bne $t4, $zero, caso1 	# se sim vai para o caso 1
     or $t4, $zero, $t5		# aux
     or $t5, $zero, $t2		# se não o menor agora é t2
     or $t6, $zero, $t4
     
    caso1: 		# t1 < t3 ?
      slt $t4, $t5, $t7 	
      bne $t4, $zero, caso2 	# se sim vai para caso 2
      or $t4, $zero, $t5	# aux
      or $t5, $zero, $t7	# se não o maior agora é t3
      or $t7, $zero, $t4
     
   caso2: 		# t2 < t3 ?
      slt $t4, $t6, $t7 	
      bne $t4, $zero, fim 	# se sim vai para fim
      or $t4, $zero, $t6	# aux
      or $t6, $zero, $t7	# se não o maior agora é t3
      or $t7, $zero, $t4
      
   fim:
      sw $t6, 0xc($t0) 		
      
   
   
   
   




