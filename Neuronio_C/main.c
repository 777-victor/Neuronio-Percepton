#include <stdio.h>
#include <stdlib.h>
int main()
{
    int i=0, n, interacoesEpoca = 0 ;
    float peso[2] = {0.000, 0.800};
    float erro = 0, somatorioSaidaNeuronio;
    float taxaDeAprendizado = 0.05, saidaDesejada = 2;

    while(somatorioSaidaNeuronio!=saidaDesejada && interacoesEpoca<5){

           for(i = 0; i < 2 ; i ++){
            printf("Digite um numero [%i] \n", i);
            scanf("%i", &n);
            saidaDesejada = n + n;
            somatorioSaidaNeuronio += n*peso[i];
            printf("Saida neuronio: %f \n", somatorioSaidaNeuronio);

        }
        if(somatorioSaidaNeuronio!=saidaDesejada) {
                       erro =  (saidaDesejada-somatorioSaidaNeuronio);
                        printf("Erro: %f\n", erro);
                     for(int j = 0; j<2; j++){
                        //printf("Peso[%i] antes: %f\n", j , peso[j]);
                        peso[j] +=   erro * taxaDeAprendizado * n;
                        printf("Peso[%i] atualizado: %f\n", j , peso[j]);
                    }
                    somatorioSaidaNeuronio = 0;
            }
            interacoesEpoca++;
    }

    float saida;
    //TESTANDO O ALGORITIMO TREINADO
    for(i = 1; i <7; i++){
            n = i + i;
            saida = (i*peso[0]) + (i*peso[1]);
            printf("Resultado esperado: %i, Saida[%i]: %f \n ", n , i , saida);
    }

    return 0;
}

// taxa de aprendizado = velocidade na qual o sistema está caminhando para encontrar
//o resultado, ou seja, tamanho do peso
//epoca = cada periodo de treinamento = 5 iterações cada epoca
//erro global = média dos erros paratodo conjunto de dados de teste
