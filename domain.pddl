(define (domian LIGHTSOUTRGB)
    (:requirements)
    (:types 
        posicao
    )

    (:predicates
        (branco ?x ?y - posicao)
        (vermelho ?x ?y - posicao)
        (verde ?x ?y - posicao)
        (azul ?x ?y - posicao)
    )
    (:action CLICK
        :paramenters(?x ?y - position)
        :precondition(and)
        :effect(or
                (when (branco ?x ?y) and (not(branco ?x ?y)) (vermelho ?x ?y))
                (when (vermelho ?x ?y) and (not(vermelho ?x ?y)) (verde ?x ?y))
                (when (verde ?x ?y) and (not(verde ?x ?y)) (azul ?x ?y))
                (when (azul ?x ?y) and (not(azul ?x ?y)) (branco ?x ?y))
                (forall (?w - position)
                    when((= ?w ?x) or
                        (when (branco ?x ?y) and (not(branco ?x ?y)) (vermelho ?x ?y))
                        (when (vermelho ?x ?y) and (not(vermelho ?x ?y)) (verde ?x ?y))
                        (when (verde ?x ?y) and (not(verde ?x ?y)) (azul ?x ?y))
                        (when (azul ?x ?y) and (not(azul ?x ?y)) (branco ?x ?y))
                    )
                    (forall (?y - position)
                        when((= ?w ?y) or
                        (when (branco ?x ?y) and (not(branco ?x ?y)) (vermelho ?x ?y))
                        (when (vermelho ?x ?y) and (not(vermelho ?x ?y)) (verde ?x ?y))
                        (when (verde ?x ?y) and (not(verde ?x ?y)) (azul ?x ?y))
                        (when (azul ?x ?y) and (not(azul ?x ?y)) (branco ?x ?y))
                        )
                ))

        )
    )



)