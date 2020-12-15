.data

mensagem:	.asciiz "Digite um numero\n"
mensagemSaida:  .asciiz "\nSaida: "
peso:           .double 0.000
peso2:          .double 0.800
taxaAprendizado:  .double 0.05
count:           .double 1.000
iterador:	 .double 1.000

.text

main:
    li $t0, 0             # $t0 é o incrementador (o "i" da pergunta)
    li $t1, 5         # $t1 é o valor máximo (serão 5 loops)
    ldc1  $f16, peso
    ldc1 $f18, peso2
    ldc1 $f20, taxaAprendizado	
    

loop: 
  	 beq $t0, $t1, done    # se o $t0 for igual a $t1, vai para 'done' (acabou o loop)
  	 
   	 # imprime mensagem	
    	li $v0, 4
	la $a0, mensagem
	syscall
	
	#lê Dobule
	li $v0, 7
	syscall	
	add.d $f2, $f0, $f0
	#swc1 $f2, resultadoEsperado
		
	#calculando os pesos	
	mul.d $f8, $f0, $f16
	mul.d $f10, $f0, $f18
	add.d $f12, $f8, $f10
	#salvando no somatorio
	#swc1 $f12, somatorio
	
	#obtendo o erro
       sub.d $f22, $f2, $f12
       #swc1 $f12, erro
       
       #atualizando o peso1
       mul.d $f12, $f22, $f20
       mul.d $f12, $f12, $f0
       add.d $f16, $f12, $f16
       
       #atualizando o peso2
       mul.d $f12, $f22, $f20
       mul.d $f12, $f12, $f0
       add.d $f18, $f12, $f18
       
       #mov.d $f12, $f16
    	#li  $v0, 3
  	  #syscall	  
    addi $t0, $t0, 1      # incrementar $t0 em 1
    j loop                # pular para (goto) 'while'
done:    
  	 li $t0, 0          # $t0 é o incrementador (o "i" da pergunta)
   	 li $t1, 7          # $t1 é o valor máximo (serão 5 loops)
   	 ldc1  $f0, count
   	 ldc1 $f2, iterador
   	 
 LOOPP: 	 
  	 beq $t0, $t1, Exit      # se o $t0 for igual a $t1, vai para 'done' (acabou o loop)
  	 
  	 	##calcula a saida
  	 	mul.d $f8, $f0, $f16
  	 	mul.d $f6, $f0, $f18
  	 	add.d $f12, $f8, $f6
  	 
  	 	
  	 	add.d $f0, $f0, $f2
  	 	
  	 	li $v0, 4 
  	 	la $a0, mensagemSaida
		syscall
  	     	li  $v0, 3
  	 	 syscall	  
  	 	 
  	  addi $t0, $t0, 1     # incrementar $t0 em 1
  	  
	jal LOOPP
    	
Exit: