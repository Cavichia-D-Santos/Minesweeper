programa
{
	inclua biblioteca Util --> u
	caracter tabuleiro[10][10]
	cadeia jogadas[10][10]
	inteiro linhas, colunas
	
	funcao inicio()
	{
		inteiro opcao, minas, quantMinas, tamanhoMax
		faca {
			escreva("CAMPO MINADO\n")
			escreva("1. Iniciar jogo 5x5\n")
			escreva("2. Iniciar jogo 10x10\n")
			escreva("3. Exibir regras\n")
			escreva("4. Instruções para jogar\n")
			escreva("9. Sair\n")
			leia(opcao)
			limpa()

			escolha (opcao){
				caso 1:
				zeraMatriz()
				linhas = 5
				colunas = 5
				tamanhoMax = 4
				
				quantMinas = u.sorteia(10, 20)
				minas = (25 * quantMinas) / 100
				distribuir(minas, tamanhoMax)
				jogo(linhas, colunas, tamanhoMax)
				pare

				caso 2:
				zeraMatriz()
				linhas = 10
				colunas = 10
				tamanhoMax = 9
				
				quantMinas = u.sorteia(10, 20)
				minas = quantMinas
				distribuir(minas, tamanhoMax)
				jogo(linhas, colunas, tamanhoMax)
				pare

				caso 3:
				limpa()
				escreva("REGRAS\n O objetivo do jogo é evitar as bombas, marcando uma posição vazia.\n- Escolha uma coordenada para jogar em sua vez;\n- Se houver uma bomba, você perderá o jogo.\n- Não é possível marcar uma posição já jogada anteriormente.\n\n")
				pare

				caso 4:
				limpa()
				escreva("INSTRUÇÕES\n1. Escolha o tamanho do tabuleiro (5x5 ou 10x10);\n2. Cada jogador escolhe uma posição alternadamente;\n3. As casas com o símbolo '[ ]' são disponíveis para jogar;\n4. Uma casa com o símbolo '#' já foi jogada anteriormente e está indisponível;\n5. O jogo continua até que uma bomba seja encontrada.\n\n")
				pare
			}
			
		} enquanto (opcao != 9)
	}

	funcao zeraMatriz(){
		para (inteiro i = 0; i < 10; i++) {
			para (inteiro j = 0; j < 10; j++) {
				tabuleiro[i][j] = '0'
				jogadas[i][j] = "| |"
			}
		}
	}

	funcao distribuir(inteiro minas, inteiro max){
		inteiro quant = 0

		enquanto (quant < minas) {
			inteiro coluna = u.sorteia(0, max)
			inteiro linha = u.sorteia(0, max)

			se (tabuleiro[linha][coluna] == '0') {
				tabuleiro[linha][coluna] = '1'
				quant++
			}
		
		}
	}

	funcao jogo(inteiro L, inteiro C, inteiro max){
		cadeia nome[2], return
		logico fimJogada = falso, fimDeJogo = falso
		inteiro jogador = 0, linhaJog, colunaJog
		escreva("Nome do jogador 1: ")
		leia(nome[0])
		escreva("Nome do jogador 2: ")
		leia(nome[1])
		limpa()

		enquanto (fimDeJogo == falso) {
			printTabl(max)
			escreva(nome[jogador], ", escolha a linha da jogada: ")
			leia(linhaJog)
			escreva(nome[jogador], ", escolha a coluna da jogada: ")
			leia(colunaJog)

			limpa()
			se (tabuleiro[linhaJog][colunaJog] == '2') {
				escreva ("jogada inválida. Tente novamente: \n")
			} senao se (tabuleiro[linhaJog][colunaJog] == '1') {
				escreva("Derrota! ", nome[jogador], " acertou uma bomba.\n")
				jogadas[linhaJog][colunaJog] = "|*|"
				printTabl(max)
				fimDeJogo = verdadeiro
				escreva("Digite qualquer tecla para voltar: ")
				leia(return)
				limpa()
			} senao {
				jogadas[linhaJog][colunaJog] = "|#|"
				tabuleiro[linhaJog][colunaJog] = '2'
					se (jogador == 0) {
						jogador = 1
					} senao se (jogador == 1) {
						jogador = 0
					}
				}
			}
		}

	funcao printTabl(inteiro max){
		inteiro i, lin = 0, col = 0
		escreva("   ")
		para (i = 0; i <= max; i++) {
			escreva(lin, "   ")
			lin++
		}
		escreva("\n")
		para (i = 0; i <= max; i++) {
			escreva (col, " ")
			col++
			para (inteiro j = 0; j <= max; j++) {
				escreva(jogadas[i][j], " ")
			}
			escreva("\n")
		}
		escreva ("\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3012; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */