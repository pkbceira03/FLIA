; Problem

(define
	(problem LIGHTSOUTRGB)
	(:domain LIGHTSOUTRGB)
	(:objects - line - column)
	(:init
	)
	(:goal (forall (?w - line)(and
                (forall (?q - column)(and
                    (white ?w ?q)
                ))
            ))
	)
)