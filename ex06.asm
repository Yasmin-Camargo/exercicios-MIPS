# YASMIN

# Inicialize o registrador $t7 com 0x1. Com apenas uma instru��o,
# multiplique o conte�do do registrador $t7 por 32. Utilize apenas instru��es
# j� vistas em aula at� agora. O programa deve funcionar para qualquer valor,
# n�o apenas para 0x1

ori $t7, $zero, 0x1
sll $t7, $t7, 5
