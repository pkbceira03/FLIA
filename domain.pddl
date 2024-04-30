;Domain

(define 
    (domain LIGHTSOUTRGB)
    (:requirements)
    (:types 
        line cloumn - position)
    (:predicates
        (white ?x -line ?y - column)
        (red ?x -line ?y - column)
        (green ?x -line ?y - column)
        (blue ?x -line ?y - column))
    (:action CLICK
        :parameters(?x -line ?y - column)
        :precondition(and)
        :effect(and
            (forall (?w - line)(and
                (forall (?q - column)(and
                    (when (= ?w ?x)(and
                        (when (white ?w ?q) (and (not(white ?w ?q)) (red ?w ?q)))
                        (when (red ?w ?q) (and (not(red ?w ?q)) (green ?w ?q)))
                        (when (green ?w ?q) (and (not(green ?w ?q)) (blue ?w ?q)))
                        (when (blue ?w ?q) (and (not(blue ?w ?q)) (white ?w ?q)))
                    ))
                    (when (= ?q ?y)(and
                        (when (white ?w ?q) (and (not(white ?w ?q)) (red ?w ?q)))
                        (when (red ?w ?q) (and (not(red ?w ?q)) (green ?w ?q)))
                        (when (green ?w ?q) (and (not(green ?w ?q)) (blue ?w ?q)))
                        (when (blue ?w ?q) (and (not(blue ?w ?q)) (white ?w ?q)))
                    ))
                        
                )))
            )
        )
    )
)

