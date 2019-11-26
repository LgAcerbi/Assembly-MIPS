        .data
msg:   .asciiz "Insira um numero para listar todos os seus divisores naturais: "
msg2:  .asciiz " "
	.extern foobar 4
	num1: .word 1
	.text
	.globl main

main:   li $v0, 4		
      	la $a0, msg
      	syscall
      	li $v0, 5
      	syscall      
      	move $s0, $v0
	add $s1, $s0, $zero
for:    sgt $t0, $s1, $zero
	beq $t0, $zero, forafor
	move $t2, $s0
	div $t3, $t2, $s1
	mfhi $t1
if:	bne $t1, $zero, foraif
	li $v0, 1
	move $a0, $s1
	syscall
	li $v0, 4
      	la $a0, msg2
      	syscall
foraif:	lw $t5, num1
	move $t6, $s1
	sub $s1, $t6, $t5
	j for
forafor:jr $ra