import sys
import subprocess
import os

def read_matrix_from_input():
    matrix = []
    for line in sys.stdin:
        line = line.strip() 
        if not line:
            break
        row = list(line.split())
        lin = []
        for e in range(0, len(row[0]), 2):
            lin.append(row[0][e:e+2])
        matrix.append(lin)
    return matrix

def create_problem(matrix):
    with open ("problemLO.pddl", "w") as file:
        #Header
        file.write("(define\n\t(problem LIGHTSOUTRGB)\n\t(:domain LIGHTSOUTRGB)\n\t(:objects")
        
        #lines
        largest_length = 0
        for sublist in matrix:
            if len(sublist) > largest_length:
                largest_length = len(sublist)
        
        for i in range(largest_length):
            file.write(" x{}".format(i))
        
        file.write(" - line")

        #column
        for j, linha in enumerate(matrix):
            file.write(" y{}".format(j))
        file.write(" - column)")
        
        #init
        file.write("\n\t(:init\n\t")
        color_map = {
            'W': 'white',
            'R': 'red',
            'B': 'blue',
            'G': 'green'
        }

        for x, row in enumerate(matrix):
            for y, cell in enumerate(row):
                color = color_map[cell[1]]
                file.write(f"({color} x{x} y{y})\n\t")
        
        type_map = {
            '-': 'normal',
            '|': 'vertical',
            '_': 'horizontal',
            '*': 'on-click',
            '#': 'at-click'
        }

        for x, row in enumerate(matrix):
            for y, cell in enumerate(row):
                cell_type = type_map[cell[0]]
                file.write(f"({cell_type} x{x} y{y})\n\t")
        file.write(")\n\t")
 
        #goal
        file.write("(:goal (and\n\t\t")
        for x, row in enumerate(matrix):
            for y, cell in enumerate(row):
                file.write(f"(white x{x} y{y})\n\t\t")
        file.write(")\n\t)\n)")

def call_madagascar_planner(domain_file, problem_file):
    planner_path = '/tmp/dir/software/planners/madagascar/M'
    command = f'{planner_path} {domain_file} {problem_file}'
    try:
        result = subprocess.run(command, shell=True, capture_output=True, text=True, check=True)
        return result.stdout
    except subprocess.CalledProcessError as e:
        print(f"Erro ao chamar o planejador Madagascar: {e.stderr}")
        return None

def main():
    matrix = read_matrix_from_input()
    create_problem(matrix)
    domain_file = 'C:/Users/marce/Documents/Learning/Lighsout/FLIA/ligthtoutrgb/domain.pddl'
    problem_file = 'C:/Users/marce/Documents/Learning/Lighsout/FLIA/ligthtoutrgb/problem.pddl'
    # Chamando o planejador Madagascar
    result_madagascar = call_madagascar_planner(domain_file, problem_file)
    print("Resultado do planejador Madagascar:")
    print(result_madagascar)


if __name__ == "__main__":
    main()