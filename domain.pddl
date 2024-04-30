;Domain

(define (domain LIGHTSOUTRGB)
    (:requirements)
    (:types 
        position)

    (:predicates
        (branco ?x ?y - position)
        (vermelho ?x ?y - position)
        (verde ?x ?y - position)
        (azul ?x ?y - position))
    (:action CLICK
        :parameters(?x ?y - position)
        :precondition(and)
        :effect(and
                (when (branco ?x ?y) (and (not(branco ?x ?y)) (vermelho ?x ?y)))
                (when (vermelho ?x ?y) (and (not(vermelho ?x ?y)) (verde ?x ?y)))
                (when (verde ?x ?y) (and (not(verde ?x ?y)) (azul ?x ?y)))
                (when (azul ?x ?y) (and (not(azul ?x ?y)) (branco ?x ?y)))
                (forall (?w - position)(and
                    (when(= ?w ?x) (and
                        (when (branco ?x ?y) (and (not(branco ?x ?y)) (vermelho ?x ?y)))
                        (when (vermelho ?x ?y) (and (not(vermelho ?x ?y)) (verde ?x ?y)))
                        (when (verde ?x ?y) (and (not(verde ?x ?y)) (azul ?x ?y)))
                        (when (azul ?x ?y) (and (not(azul ?x ?y)) (branco ?x ?y)))))
                    (forall (?q - position)
                        (when(= ?q ?y) (and
                        (when (branco ?x ?y) (and (not(branco ?x ?y)) (vermelho ?x ?y)))
                        (when (vermelho ?x ?y) (and (not(vermelho ?x ?y)) (verde ?x ?y)))
                        (when (verde ?x ?y) (and (not(verde ?x ?y)) (azul ?x ?y)))
                        (when (azul ?x ?y) (and (not(azul ?x ?y)) (branco ?x ?y)))
                        )))))

        )
    )



)
