import subprocess
import sys
import os

def read_matrix_from_input():
    matrix = []
    while True:
        try:
            line = input()
            row = [line[i:i+2] for i in range(0, len(line), 2)]
            matrix.append(row)
        except EOFError:
            break
    return matrix

def create_domain():
    domain_text = """
;Domain

(define 
    (domain LIGHTSOUTRGB)
    (:requirements)
    (:types 
        line column - position)
    (:predicates
        (white ?x - line ?y - column)
        (red ?x - line ?y - column)
        (green ?x - line ?y - column)
        (blue ?x - line ?y - column)
        (on-click ?x - line ?y - column)
        (at-click ?x - line ?y - column)
        (vertical ?x - line ?y - column)
        (horizontal ?x - line ?y - column)
        (normal ?x - line ?y - column)
    )
    (:action CLICK
        :parameters(?x - line ?y - column)
        :precondition(and)
        :effect(and
            (forall (?w - line)(and
                (forall (?q - column)(and
                    (when (and (= ?x ?w) (= ?y ?q) (not(on-click ?x ?y)))(and
                        (when (white ?w ?q) (and (not(white ?w ?q)) (red ?w ?q) ))
                        (when (red ?w ?q) (and (not(red ?w ?q)) (green ?w ?q) ))
                        (when (green ?w ?q) (and (not(green ?w ?q)) (blue ?w ?q) ))
                        (when (blue ?w ?q) (and (not(blue ?w ?q)) (white ?w ?q) ))
                    ))
                    (when (and (= ?w ?x) (not(= ?q ?y))) (and
                        (when(or (normal ?w ?q) (vertical ?w ?q) (on-click ?w ?q))(and
                            (when (white ?w ?q) (and (not(white ?w ?q)) (red ?w ?q) ))
                            (when (red ?w ?q) (and (not(red ?w ?q)) (green ?w ?q) ))
                            (when (green ?w ?q) (and (not(green ?w ?q)) (blue ?w ?q) ))
                            (when (blue ?w ?q) (and (not(blue ?w ?q)) (white ?w ?q) ))
                        ))
                    ))
                    (when (and (= ?q ?y) (not(= ?w ?x)))(and
                        (when(or (normal ?w ?q) (horizontal ?w ?q) (on-click ?w ?q))(and
                            (when (white ?w ?q) (and (not(white ?w ?q)) (red ?w ?q) ))
                            (when (red ?w ?q) (and (not(red ?w ?q)) (green ?w ?q) ))
                            (when (green ?w ?q) (and (not(green ?w ?q)) (blue ?w ?q) ))
                            (when (blue ?w ?q) (and (not(blue ?w ?q)) (white ?w ?q) ))
                        ))
                        
                    ))
                ))
            ))
        )
    )

)            
"""

    with open ("domainLO.pddl", "w") as file:
        file.write(domain_text)

def create_problem(matrix):
    with open ("problemLO.pddl", "w") as file:
        #Header
        file.write("; Problem\n\n")
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
        file.write("\n\t(:init")
        color_map = {
            'W': 'white',
            'R': 'red',
            'B': 'blue',
            'G': 'green'
        }

        for x, row in enumerate(matrix):
            for y, cell in enumerate(row):
                color = color_map[cell[1]]
                file.write(f"\n\t\t({color} x{x} y{y})")
        
        type_map = {
            '-': 'normal',
            '|': 'horizontal',
            '_': 'vertical',
            '*': 'on-click',
            '#': 'at-click'
        }

        for x, row in enumerate(matrix):
            for y, cell in enumerate(row):
                cell_type = type_map[cell[0]]
                file.write(f"\n\t\t({cell_type} x{x} y{y})")
        file.write("\n\t)\n\t")
 
        #goal
        goal_text="""
	(:goal (forall (?w - line)(and
                (forall (?q - column)(and
                    (white ?w ?q)
                ))
            ))
	)
)
"""
        file.write(goal_text.strip())

def call_planner():
    #MOJ
    #planner_path = '/tmp/dir/software/planners/madagascar/M'
    
    #Chococino
    planner_path = '/home/software/planners/madagascar/M'
    
    command = f'{planner_path} -S 1 -Q -o out domainLO.pddl problemLO.pddl > /dev/null 2>&1'
    try:
        subprocess.run(command, shell=True, check=True, timeout=30)
    except subprocess.TimeoutExpired as e:
        sys.exit(1)
    except subprocess.CalledProcessError as e:
        print(f"Erro ao chamar o planejador: {e.stderr}")
        return None

def process_output():
    try:
        with open ("out",  "r") as file:
            lines = file.readlines()
            click= []
            for line in lines:
                parts = line.split()
                if len(parts) == 5 and parts[2] == '(click':
                    x = parts[3].replace("x", "")
                    y = parts[4].replace("y", "")
                    y = y.replace(")", "")
                    click.append(f"(click {x} {y})")
            formatted_output = ";".join(click)
        print(formatted_output)
    except FileNotFoundError:
        sys.exit(1)

def main():
    matrix = read_matrix_from_input()
    create_domain()
    create_problem(matrix)
    call_planner()
    process_output()

if __name__ == "__main__":
    main()