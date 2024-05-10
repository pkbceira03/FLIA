# LIGHTSOUT RGB*

## Apague todas as lâmpadas

Autores: Bruno Ribas, Bruno Ribeiro, Igor Penha, Lucas Bergholz e Wagner Cunha

### Descrição do jogo

O jogo LightsOut é um quebra-cabeça eletrônico lançado pela Tiger Electronics em 1995. No jogo físico, há uma matriz de luzes que podem estar ligadas ou desligadas. O objetivo é desligar todas as luzes, porém, ao pressionar uma luz, seu estado e o estado das luzes adjacentes são invertidos.

A história por trás do jogo é que, em uma noite escura, todas as luzes da cidade de Lightsville apagaram repentinamente. Para restaurar a luz na cidade, o jogador assume o papel de um engenheiro elétrico encarregado de restaurar a energia nas ruas iluminadas. O desafio está em encontrar a sequência correta de cliques para trazer a luz de volta a todas as ruas.

Com a popularização dos dispositivos eletrônicos e a evolução dos jogos digitais, o LightsOut foi adaptado para várias plataformas, como computadores, smartphones e tablets. A essência do jogo permanece a mesma: resolver o quebra-cabeça desligando todas as luzes da matriz.

Nesta versão modificada do jogo LightsOut, introduzimos a versão LightsOut RGB, aqui as luzes do jogo não estão restritas à apenas dois estados (ON/OFF) mas sim, quatro estados possíveis (RED, GREEN, BLUE e OFF). Outrossim, não só as luzes adjacentes são invertidos, mas todas as luzes que estiverem na mesma linha e coluna da luz inicialmente clicada. Todavia, foi introduzido também a característica de botões quebrados. Essa modificação foi inspirada em jogos físicos que foram muito usados, desse modo, alguns botões podem apresentar diferentes comportamentos em resposta as ações executadas. Exitem quatro tipos de botões quebrados:

1. Os que não mudam de estado quando clicados. No entanto, as luzes adjacentes, mesma linha e coluna, ainda são afetadas e trocariam de estado.
2. Os que não mudam de estado como consequência do clique de um botão em mesma coluna. No entanto, mudam de estado quando clicados ou como conseqência do clique de um botão em mesma linha.
3. Os que não mudam de estado como consequência do clique de um botão em mesma linha. No entanto, mudam de estado quando clicados ou como conseqência do clique de um botão em mesma coluna.
4. Os que não mudam de estado como consequência nem do clique de um botão em mesma linha nem em mesma coluna. No entando, mudam de estado quando clicados.

### Descrição do problema

Você desenvolver um programa que leia a especificação do desafio, gere o modelo PDDL do jogo LightsOut RGB, crie os arquivos de domínio e problema PDDL correspondentes, chame o planejador selecionado com os parâmetros corretos, obtenha o plano retornado pelo planejador e gere uma saída no formato especificado na descrição do trabalho.

### Descrição dos planejadores

Existem vários planejadores disponíveis para resolver o problema do jogo LightsOut. A localização e a forma de chamada dos planejadores são as seguintes:

- **Planejadores Madagascar (M, Mp, MpC):**
  - Localização: `/tmp/dir/software/planners/madagascar/{M,Mp,MpC}`.
- **Fast Downward:**
  - Localização: `/tmp/dir/software/planners/downward/fast-downward.py`.
  - Localização: `/tmp/dir/software/planners/downward-fdss23/fast-downward.py`.
  - Localização: `/tmp/dir/software/planners/scorpion-maidu/fast-downward.py`.
- **Planejador em Julia:**
  - Localização: `/tmp/dir/software/planners/julia/planner.jl`.

### Como classificar nesta modalidade

Nesta modalidade de classificação, o problema é dividido em três categorias: AGILE, SATISFICING e OPTIMAL. A pontuação é computada da seguinte forma:

- **Categoria AGILE:**
  - A pontuação é obtida pela fórmula 
    ```
    log(TEMPPODEEXECUCAO) / log(150)
    ```
    Se o tempo de execução for menor ou igual a 1 segundo, a pontuação é 1.
  - A track tem um time limit de 30s.

- **Categoria SATISFICING:**
  - A pontuação é calculada pela fórmula 
    ```
    C* / C
    ```
    onde `C*` é a quantidade de passos do plano de referência e `C` é a quantidade de passos do plano encontrado.
  - Quanto menor for a quantidade de passos do plano encontrado em relação ao plano de referência, melhor será a pontuação.
  - A track tem um time limit de 180s.

- **Categoria OPTIMAL:**
  - O objetivo é responder o plano ótimo.
  - O desempenho é avaliado pela corretude do plano e não pela pontuação.
  - A track tem um time limit de 180s.

O vencedor será determinado com base na soma dos pontos obtidos em todas as categorias.

### Entrada

A entrada é composta com um conjunto de linhas, e deverão ser lidas da entrada padrão. As linhas, da entrada, representam a matriz do jogo, você descobrirá as dimensões conforme faz a leitura. A entrada termina em EOF.

Cada lâmpada/botão é representado por dois caracteres, um representando a condição (tipo que quebra) do botão e outro o estado atual da luz, nessa ordem, conforme a descrição abaixo:

- `W` representa uma luz desligada;
- `R` representa uma luz ligada na cor vermelha;
- `G` representa uma luz ligada na cor verde;
- `B` representa uma luz ligada na cor azul;
- `-` representa a condição de um botão não quebrado;
- `*` representa a condição de um botão com o tipo de quebra 1;
- `_` representa a condição de um botão com o tipo de quebra 2;
- `|` representa a condição de um botão com o tipo de quebra 3;
- `#` representa a condição de um botão com o tipo de quebra 4;

### Saída

A saída é composta por uma única linha contendo as coordenadas dos botões apertados, em ordem, a fim de obter todas as lâmpadas apagadas. Cada clique é
