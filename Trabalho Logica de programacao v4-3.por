programa
{
    // Declarações globais
    inclua biblioteca Texto --> texto
    inclua biblioteca Tipos
    const inteiro totalDeCadastros = 10

    cadeia nome[totalDeCadastros]
    cadeia cpfs[totalDeCadastros]
    real salario[totalDeCadastros]
    real salarioB, salarioL
    inteiro totalHorasTrab[totalDeCadastros]
    inteiro totalMinutosTrab[totalDeCadastros]
    inteiro totalHTrab = 0
    inteiro totalMinTrab = 0
    inteiro colaboradores = 0
    inteiro opcao
    inteiro indice = 0
    inteiro tamanho
    cadeia buscaCpf
    logico continuar = verdadeiro 

    funcao inicio()
    {
        enquanto (continuar)
        {
            // Menu inicial
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
            
            escolha(opcao)
            {
                caso 1:
                    se (colaboradores < totalDeCadastros) {
                        cadastrar(indice)
                        indice = indice + 1
                    } senao {
                        escreva("Limite de cadastros atingido.\n")
                    }
                    pare

                caso 2:
                    editarCadastro()
                    pare

                caso 3:
                    registroPonto()
                    pare

                caso 4:
                    folhaPagamento()
                    pare

                caso 5:
                    gerarelatorio()
                    pare

                caso 0:
                    sair()
                    pare

                caso contrario:
                    escreva("Opção inválida. Tente novamente.\n")
            }
        }
    }

    funcao sair()
    {
        escreva("Encerrando o programa...\n")
        continuar = falso 
    }

    funcao cadastrar(inteiro i)
    {
        escreva("-------------------------------")
        escreva("\nCadastro de colaboradores: ")
        escreva("\n-------------------------------")

        escreva("\nDigite o nome: ")
        leia(nome[i])

        enquanto (verdadeiro)
        {
            escreva("Digite o CPF (11 dígitos): ")
            leia(cpfs[i])
            tamanho = texto.numero_caracteres(cpfs[i])

            se (tamanho == 11)
            {
                escreva("CPF correto\n")
                pare
            }
            senao
            {
                escreva("CPF inválido. Certifique-se de digitar exatamente 11 números.\n")
            }
        }

        escreva("Digite o salário bruto: ")
        leia(salario[i])

        colaboradores = colaboradores + 1
    }

    funcao editarCadastro()
    {
        escreva("\n--------------------------------------------")
        escreva("\nEditando as informações do colaborador:")
        escreva("\n--------------------------------------------")
        escreva("\nDigite o CPF do cadastro a ser alterado: ")
        leia(buscaCpf)

        logico encontrado = falso
        para (inteiro i = 0; i < colaboradores; i++)
        {
            se (cpfs[i] == buscaCpf)
            {
                encontrado = verdadeiro

                escreva("\nAltere o nome: ")
                leia(nome[i])

                escreva("\nAltere o salário bruto: ")
                leia(salario[i])

                pare
            }
        }

        se (encontrado == falso)
        {
            escreva("CPF não encontrado.\n")
        }
    }

    funcao registroPonto()
    {
        cadeia horarioEntrada, horarioSaida
        escreva("Digite o CPF do colaborador para registrar o ponto: ")
        leia(buscaCpf)

        logico encontrado = falso
        para (inteiro i = 0; i < colaboradores; i++)
        {
            se (cpfs[i] == buscaCpf)
            {
                encontrado = verdadeiro

                escreva("Digite o horário de entrada no formato (HH:MM): ")
                leia(horarioEntrada)
                escreva("Digite o horário de saída no formato (HH:MM): ")
                leia(horarioSaida)

                cadeia horaEntrada = Texto.extrair_subtexto(horarioEntrada, 0, 2)
                cadeia minutoEntrada = Texto.extrair_subtexto(horarioEntrada, 3, 5)
                cadeia horaSaida = Texto.extrair_subtexto(horarioSaida, 0, 2)
                cadeia minutoSaida = Texto.extrair_subtexto(horarioSaida, 3, 5)

                inteiro horaEntradaInteiro = Tipos.cadeia_para_inteiro(horaEntrada, 10)
                inteiro minutoEntradaInteiro = Tipos.cadeia_para_inteiro(minutoEntrada, 10)
                inteiro horaSaidaInteiro = Tipos.cadeia_para_inteiro(horaSaida, 10)
                inteiro minutoSaidaInteiro = Tipos.cadeia_para_inteiro(minutoSaida, 10)

                totalHTrab = horaSaidaInteiro - horaEntradaInteiro
                totalMinTrab = minutoSaidaInteiro - minutoEntradaInteiro

                se (totalMinTrab < 0)
                {
                    totalHTrab = totalHTrab - 1
                    totalMinTrab = totalMinTrab + 60
                }

                totalHorasTrab[i] = totalHTrab
                totalMinutosTrab[i] = totalMinTrab

                escreva("\n****** Relatório de ponto ******\n")
                escreva("Nome: ", nome[i], ".\n")
                escreva("CPF: ", cpfs[i], ".\n")
                escreva("Horas Trabalhadas: ", totalHorasTrab[i], ":", totalMinutosTrab[i], "\n")

                pare
            }
        }

        se (encontrado == falso)
        {
            escreva("CPF não encontrado.\n")
        }
    }

    funcao real retornimpost(real inss)
    {
        se (inss <= 1412)
        {
            retorne inss * (7.5 / 100)
        }
        senao se (inss <= 2666.68)
        {
            retorne inss * (9.0 / 100)
        }
        senao se (inss <= 4000.03)
        {
            retorne inss * (12.0 / 100)
        }
        senao
        {
            retorne inss * (14.0 / 100)
        }
    }

    funcao real retornimpost2(real irrf)
    {
        se (irrf <= 2112.00)
        {
            retorne 0.0
        }
        senao se (irrf <= 2826.65)
        {
            retorne irrf * (7.5 / 100)
        }
        senao se (irrf <= 3751.05)
        {
            retorne irrf * (15.0 / 100)
        }
        senao se (irrf <= 4664.68)
        {
            retorne irrf * (22.5 / 100)
        }
        senao
        {
            retorne irrf * (27.5 / 100)
        }
    }

    funcao folhaPagamento()
    {
        para (inteiro i = 0; i < colaboradores; i++)
        {
            escreva("\nColaboradores: ", nome[i], " e o salário é: ", salario[i], "\n")
        }
    }

    funcao gerarelatorio()
    {
        para (inteiro i = 0; i < colaboradores; i++)
        {
            salarioL = (salario[i] - (retornimpost(salario[i]) + retornimpost2(salario[i])))
            escreva("*******************************************************")
            escreva("\n**** Segue os valores do holerite do colaborador ****\n")
            escreva("*******************************************************")
            escreva("\nNome colaborador :", nome[i])
            escreva("\nO salário bruto é: R$", salario[i])
            escreva("\nO valor descontado de INSS: R$", retornimpost(salario[i]))
            escreva("\nO valor descontado de IRRF é: R$", retornimpost2(salario[i]))
            escreva("\nO salário líquido é: R$", salarioL)
            escreva("\nTotal horas trabalhadas foram: ", totalHorasTrab[i], " horas e ", totalMinutosTrab[i], " minutos\n")
            escreva("*****************************************************\n")
        }
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2220; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */