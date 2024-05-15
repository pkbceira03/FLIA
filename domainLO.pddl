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
