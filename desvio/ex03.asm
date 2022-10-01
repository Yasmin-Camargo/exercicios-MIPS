# YASMIN

# Escreva um programa que leia um valor x > 0 da memória (posição 0x10010000) e
# calcule o x-ésimo termo da série de Fibonacci:
# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
# Escreva o x-ésimo termo da série (y) em uma palavra (4 bytes) de memória. O
# resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
# memória .data. Inicie o código com:
# .data
# x: .word 7
# y: .space 4

.data 
   x: .word 7
   y: .space 4
   
.text

   lui $t0, 0x1001
   lw $t1, 0($t0)
   
   addiu $t2, $zero, 1 # i
   addiu $t3, $zero, 1 # sequencia
   addiu $t4, $zero, 0 # sequencia - 1
   addiu $t5, $zero, 0 # sequencia - 2
   
   while: 
      slt $t6, $t2, $t1     # i <= x
      beq $t6, $zero, fim
      
      addu $t5, $zero, $t4  # sequencia - 2 = sequencia - 1
      addu $t4, $zero, $t3  # sequencia - 1 = sequencia
      addu $t3, $t5, $t4    # sequencia = sequencia - 2 + sequencia - 1
      
      addiu $t2, $t2, 1     # i = i + 1
      j while
  
   fim:
      sw $t3, 4($t0)
   