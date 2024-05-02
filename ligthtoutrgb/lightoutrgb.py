import sys
import os

def read_matrix_from_input():
    matrix = []
    for line in sys.stdin:  # Lê cada linha da entrada padrão
        line = line.strip()  # Remove espaços em branco do início e do fim da linha
        if not line:  # Se a linha estiver vazia, significa que alcançamos o EOF
            break
        row = list(line.split())
        # print(row[0][0:2])
        # print(row[0][2:4])
        lin = []
        for e in range(0, len(row[0]), 2):
            lin.append(row[0][e:e+2])
        matrix.append(lin)
        # row = line.split()  # Divide a linha nos elementos da matriz
        # matrix.append(row)  # Adiciona a linha à matriz
    return matrix

# Exemplo de uso
# print("Digite a matriz (termine com EOF):")
matriz = read_matrix_from_input()
# print("Matriz recebida:")


# for row in matrix:
#     print(row)

# abrir o arquivo de problema 

with open ("arquivoProblem", "w") as file:
    file.write("(define\n\t(problem LIGHTSOUTRGB)\n\t(:domain LIGHTSOUTRGB)")
    file.write("(:init")
    for i, linha in enumerate(matriz):
        file.write(f"\t\tX{i} - column ", end="")

        # #não esta contando o j porque a gente recebe só uma linha 
        # porque as entradas não tem espaço 
        #temos que conseguir dividir
        for j, elemento in enumerate(linha):
            file.write(f"\ttY{j} - line ", end="")
        
    #fecha init
    file.write(")")
    
    
    #fecha define
    file.write(")")