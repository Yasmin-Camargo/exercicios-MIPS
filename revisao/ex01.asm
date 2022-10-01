# YASMIN
# Reescreva o seguinte c�digo C em MIPS Assembly:
# int i;
# int vetor[8];
# for(i=0; i<8; i++) {
# if(i%2==0)
# vetor[i] = i * 2;
# else
# vetor[i] = vetor[i] + vetor[i-1];
# }
# Cada posi��o do vetor deve ter 4 bytes e deve ser armazenada, em sequ�ncia, a
# partir da posi��o 0x1001000 da mem�ria

.data 
   vet: .space 32
   
.text

   lui $t0, 0x1001     # Posi��o inicial do vetor
   ori $t1, $zero, 0  # i
   
while: 
   slti $t2, $t1, 8 	# i < 8
   beq $t2, $zero, fim
   
   ori $t2, $zero, 2 	# t2 = 2
   div $t1, $t2		# t1 / 2
   mfhi $t2		# t2 = resto da divisao
   bne $t2, $zero, else
   
   sll $t3, $t1, 1  	# i * 2
   sw $t3, 0($t0)	# vetor[i] = i * 2
   j continua
   
   else: 
      lw $t3, -4($t0)	   # armazena resultado de vet da posi��o anterior
      lw $t4, 0($t0)	   # armazena resultado de vet da posi��o anterior
      add $t3, $t3, $t4    # vetor[i] - vetor[i-1]
      sw $t3, 0($t0)	   # vetor[i] = vetor[i] - vetor[i-1]
      
   continua: 
      addi $t1, $t1, 1 	   # i = i + 1
      addi $t0, $t0, 4      # vet anda para a proxima posi��o 
      j while
   
fim:
   
   