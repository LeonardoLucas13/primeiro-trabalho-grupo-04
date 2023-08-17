/*GRUPO 4
---------------------------
1 - 21-Janielton Medeiros Tavares
2 - 30-Ricardo Castilho
3 - 32-Samara Carreiro
4 - 04-Bárbara Dêslandes da Silva de Oliveira
5 - 22-Leonardo Lucas da Silva Mendes
6 - 25-Manoel Vitor Laque Costa
7 - 05-Bernardo Bonifácio Duarte da Silva
testando branch*/

programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Util --> u
	inclua biblioteca Calendario --> c
	inclua biblioteca Texto --> txt

		
		cadeia produtos[6] = {"Parafuso           ", "Arruela            ", "Porca              ", "Chave de Fenda     ", "Broca              ", "Bucha              "}	
		inteiro codigosProdutos[6] = {1001,1002,1003,1004,1005,1006}
		inteiro quantidade[6] = {100, 100, 100, 100, 100, 100}
		real preco[6] = {1.0, 0.5, 0.25, 9.90, 13.0, 0.75}
		inteiro sacola[6] 
		real valorFinal = 0.0
		inteiro taxasOuBeneficios = 0
		cadeia cliente = ""
		inteiro opcao = 0,volume = 0
		cadeia tratamentoOpcao,volumeTratamento
		
	funcao inicio()
	{	
		cadastro()
		menu()
		
		//2-listaProdutos()
		//3-selecionarQuantidade()
		//4-formaDePagamento()
		//5-orcamento()		
	}
	funcao inteiro menu(){
		cadeia opcaoMenu
		escreva("\n_____________________________________")
		escreva("\n")
		escreva("\n      LOJA DE FERRAMENTAS G4       ")
		escreva("\n_____________________________________\n")
		escreva("\n")
		escreva("\n    1 - Listar Produtos")
		escreva("\n    2 - Forma de Pagamento")
		escreva("\n    3 - Alterar ou Excluir itens")
		escreva("\n    4 - Imprimir Orçamento")
		escreva("\n    5 - Sair")
		escreva("\n")
		escreva("\n_____________________________________\n")
        leia(opcaoMenu)
        limpa()
        se (tp.cadeia_e_inteiro(opcaoMenu, 10)){
			opcao = tp.cadeia_para_inteiro(opcaoMenu, 10)
			}senao{
				opcao=0
				menu()
			}
        escolha(opcao){
            caso 1:listaProdutos() pare
            caso 2:formaDePagamento() pare
            caso 3:alterarOuExcluir()pare
            caso 4:orcamento()pare
            caso 5:sair()pare
            caso contrario: escreva("Opção inválida!")
        }
        retorne(opcao)
    }
	funcao listaProdutos(){
		
		cadeia incluirMais
        	logico continua = verdadeiro
        	inteiro ordem = 1
	     faca {  		
	        	escreva("Produto               - Código  -   Estoque  -   Carrinho        Preço\n")
			para(inteiro i = 0;i<6;i++){			
			escreva(ordem+"-"+produtos[i]+" - " +codigosProdutos[i] +"        "+quantidade[i]+"           "+sacola[i]+"              R$"+preco[i]+"\n")
			ordem++
			}
			escreva("\n")
			escreva("\n")
	          continua=falso
	     }enquanto(continua == verdadeiro) 
	     carrinho() 
			
	}
	funcao formaDePagamento(){
		cadeia opcaoMenu = ""
		escreva("\n_____________________________________")
		escreva("\n")
		escreva("\n      Formas de pagamento        ")
		escreva("\n_____________________________________")
		escreva("\n")
		escreva("\n    1 - À vista")
		escreva("\n    2 - No cartão")
		escreva("\n    3 - A prazo")
		escreva("\n")
		escreva("\n___________________________________\n")
		escreva("Digite a forma de pagamento: \n")
		leia(opcaoMenu)
		limpa()
		se (tp.cadeia_e_inteiro(opcaoMenu, 10)){
			opcao = tp.cadeia_para_inteiro(opcaoMenu, 10)
			}senao{
				opcao=0
				formaDePagamento()
			}		
		limpa()
		menu()
	}	
	funcao orcamento(){
		inteiro ordem = 1	
		real total[6]
		real comDesconto,comAcrescimo
		valorFinal=0.0
		      				        			        	
		escreva("Produto               - Código  -   Quantidade               Preço\n")
		para(inteiro i = 0;i<6;i++){			
		escreva(ordem+"-"+produtos[i]+" - " +codigosProdutos[i] +"        "+sacola[i]+"                      R$"+preco[i]+"\n")		
		ordem++
		total[i]=sacola[i]*preco[i]
		valorFinal=valorFinal+total[i]
		}

		inteiro diaAtual = c.dia_mes_atual()
		
		inteiro mesAtual = c.mes_atual()
				
		inteiro anoAtual = c.ano_atual()
				
		escreva("\n")
		escreva("_________________________________________________________________________\n")
		
		comDesconto=valorFinal-valorFinal/100*5
		comAcrescimo=valorFinal+valorFinal/100*5
		escreva("\nValor no cartão sem desconto: R$"+valorFinal+"\n")
		escreva("Valor à vista com desconto de 5%: R$"+comDesconto+"\n")
		escreva("Valor a prazo com acréscimo de 5%: R$"+comAcrescimo+"\n")
		escreva("\n")
		escreva("_________________________________________________________________________\n")
		escreva("\n")
		escreva("Data:", diaAtual, "/", mesAtual, "/", anoAtual)
		escreva("\n")
		escreva("Nome do cliente: "+ cliente+"\n")		
		se(taxasOuBeneficios==1)
		escreva("Valor à vista escolhido: "+comDesconto+"\n")
		senao se(taxasOuBeneficios==3)
		escreva("Valor a prazo escolhido: "+comAcrescimo+"\n")
		senao
		escreva("Valor no cartão escolhido: R$"+valorFinal+"\n")
		escreva("Esse valor é válido durante 7 dias.\n")
		escreva("_________________________________________________________________________\n")
		escreva("\n")
		cadeia continuar
		escreva("Pressione enter para continuar:")
		leia(continuar)
		menu()		
	}	
	funcao alterarOuExcluir(){
		cadeia incluirMais		
		logico continua = verdadeiro
		listaCarrinho()
		enquanto(continua){
			
			escreva("Retirar do carrinho:\n")
			leia(tratamentoOpcao)
			opcaoTratadas()		
								
				escolha(opcao){
				caso 1:
				escreva(produtos[0])
				escreva("Quantidade: ")
				leia(volumeTratamento)
				tratamentoVolume()
				se(volume<=0 ou volume>sacola[0]){
					quantidade[0]=quantidade[0]
					sacola[0]=sacola[0]
					escreva("Quantidade inválida!!!\n")
					}
					senao{
					quantidade[0]=quantidade[0]+volume
					sacola[0]=sacola[0]-volume
					limpa()
					listaCarrinho()}pare
				
				caso 2:escreva(produtos[1])				
				escreva("Quantidade: ")
				leia(volumeTratamento)
				tratamentoVolume()
				se(volume<=0 ou volume>sacola[1]){
					quantidade[1]=quantidade[1]
					sacola[1]=sacola[1]
					escreva("Quantidade inválida!!!\n")
					}
					senao{
					quantidade[1]=quantidade[1]+volume
					sacola[1]=sacola[1]-volume
					limpa()
					listaCarrinho()}pare
				
				caso 3:escreva(produtos[2])				
				escreva("Quantidade: ")
				leia(volumeTratamento)
				tratamentoVolume()
				se(volume<=0 ou volume>sacola[2]){
					quantidade[2]=quantidade[2]
					sacola[2]=sacola[2]
					escreva("Quantidade inválida!!!\n")
					}
					senao{
					quantidade[2]=quantidade[2]+volume
					sacola[2]=sacola[2]-volume
					limpa()
					listaCarrinho()}pare
				
				caso 4:escreva(produtos[3])				
				escreva("Quantidade: ")
				leia(volumeTratamento)
				tratamentoVolume()
				se(volume<=0 ou volume>sacola[3]){
					quantidade[3]=quantidade[3]
					sacola[3]=sacola[3]
					escreva("Quantidade inválida!!!\n")
					}
					senao{
					quantidade[3]=quantidade[3]+volume
					sacola[3]=sacola[3]-volume
					limpa()
					listaCarrinho()}pare
				
				caso 5:escreva(produtos[4])				
				escreva("Quantidade: ")
				leia(volumeTratamento)
				tratamentoVolume()
				se(volume<=0 ou volume>sacola[4]){
					quantidade[4]=quantidade[4]
					sacola[4]=sacola[4]
					escreva("Quantidade inválida!!!\n")
					}
					senao{
					quantidade[4]=quantidade[4]+volume
					sacola[4]=sacola[4]-volume
					limpa()
					listaCarrinho()}pare
				
				caso 6:escreva(produtos[5])				
				escreva("Quantidade: ")
				leia(volumeTratamento)
				tratamentoVolume()
				se(volume<=0 ou volume>sacola[5]){
					quantidade[5]=quantidade[5]
					sacola[5]=sacola[5]
					escreva("Quantidade inválida!!!\n")
					}
					senao{
					quantidade[5]=quantidade[5]+volume
					sacola[5]=sacola[5]-volume
					limpa()
					listaCarrinho()}pare
				
				caso contrario: escreva("Opção inválida!!!\n")
				}
				escreva("Alterar ou excluir outro produto? S/N  ")
				leia(incluirMais)
				limpa()
				listaCarrinho()		
				se(txt.caixa_alta(incluirMais)!="S")	
				continua=falso
	     }
	     limpa()
		menu()		
	}	
	funcao sair(){
		escreva("                                                                     ___                  \n")
		escreva("                                   LOJA DE FERRAMENTAS G4           |   |                 \n")
		escreva("                                      VOLTEM SEMPRE!!!              |   |                 \n")
		escreva("                                                                     | |                  \n")
		escreva("                                         CRIADO POR:                 | |                  \n")
		escreva("                                                                     | |                  \n")
		escreva("                                      Bárbara Dêslandes              | |                 \n")
		escreva("                                      Bernardo Bonifácio            -   -                  \n")
		escreva("                                      Janielton Medeiros           |     |                \n")
		escreva("                                       Leonardo Lucas              |     |                \n")
		escreva("                                        Manoel Vitor               |     |                 \n")
		escreva("                                       Ricardo Castilho            |     |                 \n")
		escreva("                                       Samara Carreiro              -___-  \n")   
	}	
	funcao carrinho(){
			cadeia incluirMais		
			logico continua = verdadeiro				

			enquanto(continua){
			escreva("Colocar no carrinho:\n")
			leia(tratamentoOpcao)
			opcaoTratadas()	

				
				escolha(opcao){
				caso 1:
				escreva(produtos[0])
				escreva("Quantidade: ")
				leia(volumeTratamento)
				tratamentoVolume()
				se(volume<=0){
					quantidade[0]=quantidade[0]
					sacola[0]=sacola[0]
					escreva("Quantidade inválida!!!\n")
					}
					senao{
					quantidade[0]=quantidade[0]-volume
					sacola[0]=sacola[0]+volume
					limpa()
					listaProdutosPura()}pare
				
				caso 2:escreva(produtos[1])				
				escreva("Quantidade: ")
				leia(volumeTratamento)
				tratamentoVolume()
				se(volume<=0){
					quantidade[1]=quantidade[1]
					sacola[1]=sacola[1]
					escreva("Quantidade inválida!!!\n")
					}
					senao{
					quantidade[1]=quantidade[1]-volume
					sacola[1]=sacola[1]+volume
					limpa()
					listaProdutosPura()}pare
				
				caso 3:escreva(produtos[2])				
				escreva("Quantidade: ")
				leia(volumeTratamento)
				tratamentoVolume()
				se(volume<=0){
					quantidade[2]=quantidade[2]
					sacola[2]=sacola[2]
					escreva("Quantidade inválida!!!\n")
					}
					senao{
					quantidade[2]=quantidade[2]-volume
					sacola[2]=sacola[2]+volume
					limpa()
					listaProdutosPura()}pare
				
				caso 4:escreva(produtos[3])				
				escreva("Quantidade: ")
				leia(volumeTratamento)
				tratamentoVolume()
				se(volume<=0){
					quantidade[3]=quantidade[3]
					sacola[3]=sacola[3]
					escreva("Quantidade inválida!!!\n")
					}
					senao{
					quantidade[3]=quantidade[3]-volume
					sacola[3]=sacola[3]+volume
					limpa()
					listaProdutosPura()}pare
				
				caso 5:escreva(produtos[4])				
				escreva("Quantidade: ")
				leia(volumeTratamento)
				tratamentoVolume()
				se(volume<=0){
					quantidade[4]=quantidade[4]
					sacola[4]=sacola[4]
					escreva("Quantidade inválida!!!\n")
					}
					senao{
					quantidade[4]=quantidade[4]-volume
					sacola[4]=sacola[4]+volume
					limpa()
					listaProdutosPura()}pare
				
				caso 6:escreva(produtos[5])				
				escreva("Quantidade: ")
				leia(volumeTratamento)
				tratamentoVolume()
				se(volume<=0){
					quantidade[5]=quantidade[5]
					sacola[5]=sacola[5]
					escreva("Quantidade inválida!!!\n")
					}
					senao{
					quantidade[5]=quantidade[5]-volume
					sacola[5]=sacola[5]+volume
					limpa()
					listaProdutosPura()}pare	

				caso 0:
				limpa()
				listaProdutosPura()pare
											
				caso contrario: escreva("Opção inválida!!!\n")
				}
					escreva("Deseja outro produto? S/N  ")
					leia(incluirMais)
					limpa()
					listaProdutosPura()		
					se(txt.caixa_alta(incluirMais)!="S"){	
					continua=falso		     
					limpa()
					menu()	
					}
					senao {
						continua=falso
						carrinho()
					}
			}					     

	}			
	funcao listaProdutosPura(){				
        	inteiro ordem = 1			        			        	
		escreva("Produto               - Código  -   Estoque  -   Carrinho        Preço\n")
		para(inteiro i = 0;i<6;i++){			
		escreva(ordem+"-"+produtos[i]+" - " +codigosProdutos[i] +"        "+quantidade[i]+"           "+sacola[i]+"              R$"+preco[i]+"\n")
		ordem++
		}
		escreva("\n")
		escreva("0-SAIR")
		escreva("\n")
		escreva("__\n")
	
	}
	funcao cadastro(){
		escreva("\n_____________________________________")
		escreva("\n")
		escreva("\n")
		escreva("          Digite seu nome")
		escreva("\n")
		escreva("\n_____________________________________\n")
		escreva("Nome:")
		leia(cliente)
		limpa()
	}
	funcao listaCarrinho(){				
        	inteiro ordem = 1			        			        	
		escreva("Produto               - Código  -   Carrinho  -   Estoque          Preço\n")
			para(inteiro i = 0;i<6;i++){			
			escreva(ordem+"-"+produtos[i]+" - " +codigosProdutos[i] +"        "+sacola[i]+"             "+quantidade[i]+"              R$"+preco[i]+"\n")
			ordem++
			}
			escreva("\n")
			escreva("__\n")
	
	}
	funcao opcaoTratadas(){
			cadeia parafuso ="PARAFUSO",arruela = "ARRUELA",porca="PORCA",chaveDeFenda="CHAVE DE FENDA",broca = "BROCA",bucha ="BUCHA"
		
			se(txt.caixa_alta(tratamentoOpcao)==parafuso)
			opcao=1
			senao se(txt.caixa_alta(tratamentoOpcao)==arruela)
			opcao=2
			senao se(txt.caixa_alta(tratamentoOpcao)==porca)
			opcao=3
			senao se(txt.caixa_alta(tratamentoOpcao)==chaveDeFenda)
			opcao=4
			senao se(txt.caixa_alta(tratamentoOpcao)==broca)
			opcao=5
			senao se(txt.caixa_alta(tratamentoOpcao)==bucha)
			opcao=6
			senao se(txt.caixa_alta(tratamentoOpcao)!=parafuso ou txt.caixa_alta(tratamentoOpcao)!=arruela ou txt.caixa_alta(tratamentoOpcao)!=porca ou txt.caixa_alta(tratamentoOpcao)!=chaveDeFenda ou txt.caixa_alta(tratamentoOpcao)!=broca ou txt.caixa_alta(tratamentoOpcao)!=bucha)
			opcao=0
			senao
			escreva("Opção inválida!!!")
			se (tp.cadeia_e_inteiro(tratamentoOpcao, 10)){
			opcao = tp.cadeia_para_inteiro(tratamentoOpcao, 10)
			}
			
			se(opcao==1001)
			opcao=1
			senao se(opcao==1002)
			opcao=2
			senao se(opcao==1003)
			opcao=3
			senao se(opcao==1004)
			opcao=4
			senao se(opcao==1005)
			opcao=5
			senao se(opcao==1006)
			opcao=6
	}
	funcao tratamentoVolume(){
		se (tp.cadeia_e_inteiro(volumeTratamento, 10)){
			volume = tp.cadeia_para_inteiro(volumeTratamento, 10)
			}senao{
			volume=0
			}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 292; 
 * @DOBRAMENTO-CODIGO = [30, 40, 72, 90, 114, 162, 276, 291, 415, 428, 442, 439, 450, 486];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */