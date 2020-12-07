; this splits the given list L according to k, and inverts the left hand side elements
; [2]> (parcurg '(1 2 3) 1)                                                                 
; ((1) (2 3))                                                                               
; [3]> (parcurg '(1 2 3) 3)                                                                 
; NIL                                                                                       
; [4]> (parcurg '(1 2 3) 2)                                                                 
; ((2 1) (3))  

(defun lista (l) 
    (cond
        ((null l) nil)
        ((numberp (car l)) 
        (cons (car l) (lista (cdr l))))
        (t (lista (cdr l)))
    )
)

(defun dublare(l)
    (cond
        ((numberp l) (* 2 l))
        ((atom l) l)
        (t (cons (dublare (car l)) (dublare (cdr l))) )
    )
)

(defun parcurg_aux(L k col)
    (cond
        ((null L) nil)
        ((= k 0) (list col L))
        (t (parcurg_aux (cdr L) (- k 1) (cons (car L) col)))
    )
)

(defun parcurg (L k)
    (parcurg_aux L k nil)
)