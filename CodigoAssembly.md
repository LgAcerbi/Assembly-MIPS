# Assembly-MIPS
        
	.data
msg:    .asciiz "Insira um numero para listar todos os seus divisores naturais: "
msg2:   .asciiz " "
	.extern foobar 4
	num1: .word 1
	.text
	.globl main


main:   li $v0, 4  			        #Imprimindo a mensagem
      	la $a0, msg
      	syscall	
	
      	li $v0, 5			           #Recebendo um inteiro do usuário
      	syscall      
      	move $s0, $v0			       #Movendo o valor para o registrador $s0
	add $s1, $s0, $zero		   		#Tornando o registrador $s1, igual a $s0

for:    sgt $t0, $s1, $zero		   #Comparação do for (i > 0)
	beq $t0, $zero, forafor
	move $t2, $s0
	div $t3, $t2, $s1		     #Divindo $t2 por $s1 (Num / i)
	mfhi $t1			     #Jogando o resto da divisão no registrador $t1

if:	bne $t1, $zero, foraif	 	#Se o resto for diferente de 0, não entra no IF
	li $v0, 1	
	move $a0, $s1
	syscall				           #Imprimindo divisor natural
	li $v0, 4
      	la $a0, msg2
      	syscall				           #Colocando espaçamento entre eles

foraif:	lw $t5, num1			
	move $t6, $s1
	sub $s1, $t6, $t5		      #Subtraindo 1, do $s1 (i--)
	j for				              #Voltando para o looping

forafor:jr $ra
