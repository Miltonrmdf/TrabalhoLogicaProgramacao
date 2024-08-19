programa
{	//declarações globais
	inclua biblioteca Texto --> texto
	inclua biblioteca Tipos
	     const inteiro totalDeCadastros =10
					
		cadeia nome [totalDeCadastros]	
		cadeia nomes
		cadeia cpfs [totalDeCadastros]
		cadeia cpf
		real salario [totalDeCadastros]
		real salarioB, salarioL, minutosT
		inteiro totalHorasTrab[totalDeCadastros]
		inteiro totalMinutosTrab[totalDeCadastros]
		inteiro totalHTrab = 0
		inteiro totalMinTrab = 0
		caracter resposta
		cadeia linha
		inteiro colaboradores = 0
		inteiro opcao
		inteiro indice = 0
		cadeia um, dois
		inteiro tamanhoCPF = 0
		inteiro tamanho,buscaNome
		cadeia buscaCpf
		
		
	funcao inicio()
	{	
		//Opções que aparecem no console do menu inicial
		 escreva("\n------------------------")
		 escreva("\n Departamento Pessoal\n")
		 escreva("--------------------------")
		 escreva("\nEscolha uma opção: ")
		 escreva("\n1. Adicionar colaborador\n")
		 escreva("2. Editar colaborador\n")
		 escreva("3. Registrar ponto\n")
		 escreva("4. Calcular folha do pagamento\n")
		 escreva("5. Relatório geral\n")
		 escreva("0. Sair\n")
		 escreva("\n BNC™ Systems SA\n")
		 
		 leia(opcao)
		//Bloco do backend do menu inicial
		 escolha(opcao) 
		 {	

		 	caso 1:  para(inteiro i = 0; i<totalDeCadastros + 1; i++)
					{
					cadastrar(indice)
					}
		 	pare 
			
			caso 2: para(inteiro i = 0; i<totalDeCadastros; i--)
					{
					editarCadastro(indice)
					}
			pare
			
			caso 3: para(inteiro i = 0; i<totalDeCadastros; i++)
					{
					registroPonto(indice)
					}
			pare
			
			caso 4:  para(inteiro i = 0; i<totalDeCadastros; i++)
					{
					folhaPagamento(indice)
					}
			pare 
			
			caso 5:  para(inteiro i = 0; i<totalDeCadastros; i++)
					{
					gerarelatorio(nome[i], salario[i], cpfs[i],totalHorasTrab[i])
					}
			pare 
						
			caso 0: 	para(inteiro i = 0; i < i; i++)
					sair(indice)
		 	pare
		 } 
	}
	
	//Função que edita o cadastro
	funcao editarCadastro(inteiro i){

				escreva("\n--------------------------------------------")
				escreva("\n","Editando as informações do colaborador: ")
				escreva("\n--------------------------------------------")
				//Busca feita pelo cpf cadastrado				
				escreva("\n","Digite o cpf do cadastro a ser alterado: ")
				leia(buscaCpf)
				cpfs[i]=buscaCpf
				
				escreva("\n","Altere o CPF: ")
				leia(cpf)
				cpfs[i]=cpf
				
				 se (cpfs[i] == buscaCpf) 
					{cpfs[i] = buscaCpf}
				
				escreva("\n","Altere o nome: ")
				leia(nomes)
				nome[i]=nomes
				
				escreva("\n","Altere o salário bruto: ")
				leia(salarioB)
				salario[i]=salarioB
				//bloco do escolha 
				escreva("\nDigite (1) se deseja cadastrar outro colaborador\n")
				escreva("\nDigite (2) se deseja voltar ao menu\n")
				escreva("\nDigite (3) se deseja sair\n")
				leia(opcao)

				escolha(opcao) 
				{ caso 1: cadastrar(i)
				  caso 2: inicio()
				  caso 0: 	
					sair(indice)
		 		pare
				} 
			} 
	//Função que faz o cadastro do funcionário
	funcao cadastrar(inteiro i)
	{
				escreva("-------------------------------")
				escreva("\n","Cadastro de colaboradores: ")
				escreva("\n-------------------------------")
				
				escreva("\n","Digite o nome: ")
				leia(nomes)
				nome[indice]=nomes
				
				enquanto (verdadeiro)
        			{
            		escreva("Digite o CPF (11 dígitos): ")
           		 leia(cpf)
            		tamanho = texto.numero_caracteres(cpf)
            		cpfs[indice]=cpf

            // Verifica se o CPF tem exatamente 11 caracteres
            		se (tamanho == 11 )
            		{
                		escreva("CPF correto \n")
                		pare
            		}
            		senao
            		{	
                		escreva("CPF inválido. Certifique-se de digitar exatamente 11 números.\n")
            		}
	  			}
				escreva("Digite o salário Bruto: ")
				leia(salarioB)
				salario[indice]=salarioB

				colaboradores = colaboradores + 1

				escreva("\nDigite (1) se deseja cadastrar um novo colaborador\n")
				escreva("\nDigite (2) se deseja editar um colaborador \n")
				escreva("\nDigite (0) se quiser voltar ao inicio\n" )
				
				leia(opcao)

				escolha(opcao) 
				{ caso 1: cadastrar(indice=indice+1)
				  caso 2: editarCadastro(indice)
				  caso contrario: inicio()
				} 
			}
	//Função que retorna o calculo do INSS
	funcao real retornimpost(real inss)
	
		{
			
		se(inss<=1412)
		
		{
		real sal = inss * (7.5/100)
		inss = sal
		}
		senao se(inss>1412 e inss<=2666.68)
		
		{
		real sal = inss * (9.0/100)
		inss = sal
		}
		
		senao se(inss> 2666.68 e inss<=4000.03)
		
		{
		real sal = inss * (12.0/100)
		inss = sal
		}
		
		senao se(inss>4004.03)
		
		{
		 real sal = inss * (14.0/100)
		 inss = sal
		}
		retorne inss
		}
	//Função que retorna o calculo do IRRF
	funcao real retornimpost2(real irrf)
	
		{
			
		se(irrf<=2112.00)
		
		{
		real sal = 0.0
		irrf = sal
		}
		senao se(irrf>2112 e irrf<=2826.65)
		
		{
		real sal = irrf * (7.5/100)
		irrf = sal
		}
		
		senao se(irrf> 2826.65 e irrf<=3751.05)
		
		{
		real sal = irrf * (15.0/100)
		irrf = sal
		}
		
		senao se(irrf>3751.05 e irrf<=4664.68)
		
		{
		 real sal = irrf * (22.5/100)
		 irrf = sal
		}

		senao se(irrf>4664.68)
		
		{
		 real sal = irrf * (27.5/100)
		 irrf = sal
		}
		
		retorne irrf
		}
	//Função do relatório geral
    	funcao gerarelatorio(cadeia nome1, real salario1, cadeia cpf1,inteiro totalHorasTrab1)
		{ 
			para(inteiro i = 0;i<totalDeCadastros;i++){
				//condição para não imprimir posições vazias do vetor
				se (nome[i]!="" e totalHorasTrab[i]!=0){
				
				salarioL = (salarioB - (retornimpost(salarioB) + retornimpost2(salarioB)))
				escreva("*******************************************************")
				escreva("\n**** Segue os valores do holerite do colaborador ****","\n")
				escreva("*******************************************************")
				escreva("\nNome colaborador :", nomes)
				escreva("\n","O salário bruto é: R$",salarioB,"\n","O valor descontado de INSS: R$", retornimpost(salarioB), "\n","O valor descontado de IRRF é: R$",retornimpost2(salarioB))
				escreva("\n","O salário líquido é: R$", salarioL, "\n")
				escreva("\n","Total horas trabalhadas foram: ",totalHTrab, " horas\n")
				escreva("*****************************************************\n") 
				// opções que vão aparece caso o vetor esteja vazio
				}senao{
									//bloco do escolha 
				escreva("\nE necessario o cadastro do coloaborador e ter marcação de ponto.\nPara ser gerado o relatório \n")
				escreva("\nEscolha a opção\n") 
				escreva("\nDigite (1) para cadastrar um colaboarador\n")
				escreva("\nDigite (2) para marcar ponto\n")
				escreva("\nDigite (3) voltar para inicio do programa\n")
				
				leia(opcao)

				escolha(opcao) 
				{ caso 1: cadastrar(i)
				  caso 2: registroPonto(i)
				  caso 3: inicio()
				  caso contrario:  
				
				} 
		      }
		}
	}
	//Função resistro do ponto
	funcao registroPonto(inteiro i){
		//isso daqui é pra converter de cadeia para inteiro (cadeia -> real -> inteiro)
		cadeia horarioEntrada, horarioSaida
		escreva("Registre o ponto do funcionário: ",nome[i],"\n")
		escreva("Digite o horário de entrada no seguinte formato (00:00): ")
		leia(horarioEntrada)
		escreva("Digite o horário de saída no seguinte formato (00:00): ")
		leia(horarioSaida)
		
		cadeia horaEntrada = Texto.extrair_subtexto(horarioEntrada, 0, 2)
		cadeia minutoEntrada = Texto.extrair_subtexto(horarioEntrada, 3, 5)
		cadeia horaSaida = Texto.extrair_subtexto(horarioSaida, 0, 2)
		cadeia minutoSaida = Texto.extrair_subtexto(horarioSaida, 3, 5)

		real horaEntradaReal = Tipos.cadeia_para_real(horaEntrada)
		real minutoEntradaReal = Tipos.cadeia_para_real(minutoEntrada)
		real horaSaidaReal = Tipos.cadeia_para_real(horaSaida)
		real minutoSaidaReal = Tipos.cadeia_para_real(minutoSaida)
		inteiro horaEntradaInteiro = Tipos.real_para_inteiro(horaEntradaReal)
		inteiro minutoEntradaInteiro = Tipos.real_para_inteiro(minutoEntradaReal)
		inteiro horaSaidaInteiro = Tipos.real_para_inteiro(horaSaidaReal)
		inteiro minutoSaidaInteiro = Tipos.real_para_inteiro(minutoSaidaReal)
		
		inteiro decisao
		//essa conta aqui é o que a gente vai estar trabalhando
			totalHTrab=horaSaidaInteiro - horaEntradaInteiro
			totalMinTrab=minutoSaidaInteiro - minutoEntradaInteiro
		//isso daqui é o tratamento pra caso resultados de minutos negativos	
			se (totalMinTrab<0){
				totalHTrab=totalHTrab-1
			}
			se (totalMinTrab<0){
				totalMinTrab=totalMinTrab*-1
			}
		//aqui a gente vai estar atribuindo os valores lá de cima pros vetores	
			totalHorasTrab[i]=totalHTrab
			totalMinutosTrab[i]=totalMinTrab
				
				escreva("\nPara relatório de horas trabalhadas digite (1) ")
				escreva("\nPara voltar ao menu inicial digite (2) ")
			leia(decisao)
		//aqui é o resultado da decisão	
				se(decisao == 1){
					
					escreva("\n****** Relatório de ponto ******\n")	
					escreva("Nome: ", nome[i], ".\n")	
					escreva("CPF: ", cpfs[i], ".\n")	
					//escreva("Horário de Entrada: ", entradasHr, ".\n")	
					//escreva("Horário de Saída: ", saidasHr, ".\n")	
					escreva("Horas Trabalhadas: ",totalHorasTrab[i] , ":", totalMinutosTrab[i], "\n")						
				}senao{
					inicio()
					}	
				}
	//Função do cadastro da folha de pagamento
	funcao folhaPagamento(inteiro i){

				escreva("\nColaboradores: ", nome[i] , " e o salario é: ",  salario[i] , "\n" ) 
				
			}
} 

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 11; 
 * @DOBRAMENTO-CODIGO = [27, 84, 123, 170, 203, 244, 281, 336];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */