; Problem

(define 
    (problem LIGHTSOUTRGB)
    (:domain LIGHTSOUTRGB)
    (:objects x1 x2 x3 y1 y2 y3 - position)
    (:init
        (white x1 y1)
        (blue x1 y2)
        (white x1 y3)
        (blue x2 y1)
        (blue x2 y2)
        (blue x2 y3)
        (white x3 y1)
        (blue x3 y2)
        (white x3 y3)
    )
    (:goal (and
        (white x1 y1)
        (white x1 y2)
        (white x1 y3)
        (white x2 y1)
        (white x2 y2)
        (white x2 y3)
        (white x3 y1)
        (white x3 y2)
        (white x3 y3))
    )
)
