.data
	msg1: .asciiz"\nDigite um numero entre 1 e 10000: "
	msg2: .asciiz" EH um numero palindromo!"
	msg3: .asciiz" NAO eh palindromo!"
	msg4: .asciiz"\nO palindromo mais proximo posterior a ele eh: "
	msg5: .asciiz"\n"
	msg6: .asciiz"\nProgramador: Gabriel da Rocha Souza"
	msg7: .asciiz"\nRA: 1110481912031"
	msg8: .asciiz"-----------------------------------------"
.text
main:
	#t0 = N
	#t1 = palindromo
	#t2 = resto
	#t3 = (11 - resto)
	#t4 = (N / 100) --> Div100
	#t5 = ((Div100 * 101) - 10) ou ((Div1000 * 1001) - 110) --> Cont
	#t6 = (N / 1000) --> Div1000
	#t7 = (Cont + 100) --> Limite
	
	li $v0, 4
	la $a0, msg8
	syscall
	
	li $v0, 4
	la $a0, msg6
	syscall
	
	li $v0, 4
	la $a0, msg7
	syscall
	
	li $v0, 4
	la $a0, msg5
	syscall
	
	li $v0, 4
	la $a0, msg8
	syscall
	
	li $v0, 4
	la $a0, msg5
	syscall

	ler:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	ble $t0, 1, ler
	bge $t0, 10000, ler
	
	blt $t0, 10, simdireto
	
	blt $t0, 100, menor100
	
	blt $t0, 1000, menor1000
	
	blt $t0, 10000, menor10000
	
	menor100:
	
		rem $t2, $t0, 11
		beq $t2, $zero, simdireto
	
	j nao100
	
	restonaozero:
	
		sub $t3, $t2, 11
		mul $t3, $t3, -1
		add $t1, $t0, $t3
	
	j maisproximo
	
	menor1000:
		
		div $t4, $t0, 100
		mul $t5, $t4, 101
		sub $t5, $t5, 10
		add $t7, $t5, 100
		
	j enquanto1000
	
	enquanto1000:
		
		add $t5, $t5, 10
		beq $t5, $t0, simdireto
		bgt $t5, $t7, nao1000l
		bgt $t5, $t0, nao1000n
	
	j enquanto1000
	
	nao1000n:
		
		add $t1, $t5, $zero
		
		li $v0, 4
		la $a0, msg5
		syscall
		
		li $v0, 1
		add $a0, $t0, $zero
		syscall
	
		li $v0, 4
		la $a0, msg3
		syscall
	
		li $v0, 4
		la $a0, msg5
		syscall
	
	j maisproximo
	
	nao1000l:
		
		add $t1, $t4, 1
		mul $t1, $t1, 101
		
		li $v0, 4
		la $a0, msg5
		syscall
		
		li $v0, 1
		add $a0, $t0, $zero
		syscall
	
		li $v0, 4
		la $a0, msg3
		syscall
	
		li $v0, 4
		la $a0, msg5
		syscall
		
	j maisproximo
	
	menor10000:
		
		div $t6, $t0, 1000
		mul $t5, $t6, 1001
		sub $t5, $t5, 110
		add $t7, $t5, 1100
	
	j enquanto10000
	
	enquanto10000:
		
		add $t5, $t5, 110
		beq $t5, $t0, simdireto
		bgt $t5, $t7, nao10000l
		bgt $t5, $t0, nao10000n
		
	j enquanto10000
	
	nao10000n:
		
		add $t1, $t5, $zero
		
		li $v0, 4
		la $a0, msg5
		syscall
		
		li $v0, 1
		add $a0, $t0, $zero
		syscall
	
		li $v0, 4
		la $a0, msg3
		syscall
	
		li $v0, 4
		la $a0, msg5
		syscall
		
	j maisproximo
	
	nao10000l:
		
		add $t1, $t6, 1
		mul $t1, $t1, 1001
		
		li $v0, 4
		la $a0, msg5
		syscall
		
		li $v0, 1
		add $a0, $t0, $zero
		syscall
	
		li $v0, 4
		la $a0, msg3
		syscall
	
		li $v0, 4
		la $a0, msg5
		syscall
		
	j maisproximo
	
	simdireto:
	
		li $v0, 4
		la $a0, msg5
		syscall
		
		li $v0, 1
		add $a0, $t0, $zero
		syscall
	
		li $v0, 4
		la $a0, msg2
		syscall
	
		li $v0, 4
		la $a0, msg5
		syscall
		
		li $v0, 4
		la $a0, msg5
		syscall
	
	j ler
	
	nao100:
	
		li $v0, 4
		la $a0, msg5
		syscall
		
		li $v0, 1
		add $a0, $t0, $zero
		syscall
	
		li $v0, 4
		la $a0, msg3
		syscall
	
		li $v0, 4
		la $a0, msg5
		syscall
	
	j restonaozero
	
	maisproximo:
	
		li $v0, 4
		la $a0, msg4
		syscall
		
		li $v0, 1
		add $a0, $t1, $zero
		syscall
		
		li $v0, 4
		la $a0, msg5
		syscall
	
		li $v0, 4
		la $a0, msg5
		syscall
		
	j ler