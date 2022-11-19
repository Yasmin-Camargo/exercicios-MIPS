# YASMIN SOUZA CAMARGO
# Prova prática 1

.data 
   n: .word 4
   
   # Valores teste do vetor
   vet1: .word -4 
   vet2: .word 4
   vet3: .word 0
   vet4: .word 8
   
   a: .space 4 	# valores positvos
   b: .space 4	# média
   c: .space 4	# quantidade de valores acimada média
   
.text
   lui $t0, 0x1001
   lw $t1, 0($t0)
   
   add $t7, $zero, $t0  # copia endereço de t0 para usar depois para saber valores que estão acima da média
   
   addi $t1, $t1, 1 	# n = n + 1 (para ler todos valores)
   addi $t2, $zero, 1 	# i = 1 (inicializa váriavel para percorrer while)
  
   addi $t5, $zero, 0 	# a = 0 (inicializa váriavel que conta números positivos)
   addi $t6, $zero, 0 	# b = 0 (inicializa váriavel que faz a média)
   
   while: 
      slt $t4, $t2, $t1  # Enquanto i <= n percorre o while
      beq $t4, $zero, sair
    
      addi $t0, $t0, 4	# t0 + 4 (Vetor anda para próxima posição)
      lw $t3, 0($t0)	# coloca no registrador valor que esta na memória
      
      add $t6, $t6, $t3 # soma valor lido para fazer a média
      
      slt $t4, $t3, $zero # vet[i] < 0 ?
      bne $t4, $zero, continua
      
      if: 
        addi $t5, $t5, 1 # incrementa váriavel que conta números positivos
      
      continua:
        addi $t2, $t2, 1 # i = i + 1 (incrementa contador)
        j while
      
   sair: 
      addi $t0, $t0, 4	# t0 + 4 (Vetor anda para próxima posição, para armazenar dado na posição correta)
      sw $t5, 0($t0)	# armazena quantidade de valores positivos 
      
      addi $t1, $t1, -1	# diminui um pois antes ele foi incrementado
      div $t6, $t1	# calculo da média
      mflo $t6
      addi $t0, $t0, 4	# t0 + 4 (Vetor anda para próxima posição, para armazenar dado na posição correta)
      sw $t6, 0($t0)	# armazena a média
      
      # reinicialização dos dados (percorrer novamente o while para saber quais valores estão acima da média):
      addi $t1, $t1, 1 	 # n = n + 1 (para ler todos valores)
      addi $t2, $zero, 1 # inicializa  i
      addi $t5, $zero, 0 # c = 0 (inicializa váriavel agora para contar os mumeros acima da média)
      
      while2:
         slt $t4, $t2, $t1  	# Enquanto i <= n percorre o while
         beq $t4, $zero, sair2
         
         addi $t7, $t7, 4	# t7 + 4 (Vetor anda para próxima posição)
         lw $t3, 0($t7)		# coloca registrador da memória no registrador
         slt $t4, $t6, $t3 	# vet[i] > media ?
         bne $t4, $zero, continua2 # se esta abaixo da média continua
         
         if2: 
            addi $t5, $t5, 1 	# incrementa váriavel que conta valores acima da média
         continua2:
            addi $t2, $t2, 1	 # i = i + 1 (incrementa contador)
            j while2
            
      sair2:
         addi $t7, $t7, 12	# Vetor anda para próxima posição, para armazenar dado na posição correta + 2 valores que já foram armazenados)
         sw $t5, 0($t7)		# armazena quantidade de valores positivos 
     
      
     
        
      
