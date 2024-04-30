;Domain

(define 
    (domain LIGHTSOUTRGB)
    (:requirements)
    (:types 
        position)
    (:predicates
        (white ?x ?y - position)
        (red ?x ?y - position)
        (green ?x ?y - position)
        (blue ?x ?y - position))
    (:action CLICK
        :parameters(?x ?y - position)
        :precondition(and)
        :effect(and
            (when (white ?x ?y) (and (not(white ?x ?y)) (red ?x ?y)))
            (when (red ?x ?y) (and (not(red ?x ?y)) (green ?x ?y)))
            (when (green ?x ?y) (and (not(green ?x ?y)) (blue ?x ?y)))
            (when (blue ?x ?y) (and (not(blue ?x ?y)) (white ?x ?y)))
            (forall (?w - position)(and
                (when(= ?w ?x) (and
                    (when (white ?x ?y) (and (not(white ?x ?y)) (red ?x ?y)))
                    (when (red ?x ?y) (and (not(red ?x ?y)) (green ?x ?y)))
                    (when (green ?x ?y) (and (not(green ?x ?y)) (blue ?x ?y)))
                    (when (blue ?x ?y) (and (not(blue ?x ?y)) (white ?x ?y)))))
                    (forall (?q - position)
                        (when(= ?q ?y) (and
                        (when (white ?x ?y) (and (not(white ?x ?y)) (red ?x ?y)))
                        (when (red ?x ?y) (and (not(red ?x ?y)) (green ?x ?y)))
                        (when (green ?x ?y) (and (not(green ?x ?y)) (blue ?x ?y)))
                        (when (blue ?x ?y) (and (not(blue ?x ?y)) (white ?x ?y)))
                        ))
                    )
                )
            )
        )
    )
)
