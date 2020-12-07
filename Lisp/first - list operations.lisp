(defun fct(l)
    (cdr l))


; sum of atoms at the superficial level of a nonlinear list

(defun suma(l)
    ; COND - conditional form, allows ramification
    (cond 
        ((null l) 0)
        ; NUMBERP - returns T if the argument is a number
        ( (numberp(car l)) (+(car l)(suma (cdr l))))
        (t (suma (cdr l)))))
    


(defun sumadeux(l)
    (cond
        ((null l) 0)
        ( (numberp(car l)) (+ (car l) (sumadeux(cdr l))))
        ; ATOM - returns T if the argument is an atom
        ( (atom(car l)) (sumadeux(cdr l)))
        ; the last clause is for the first element from the list
        (t (+ (sumadeux(car l)) (sumadeux(cdr l))))))    
    


(DEFUN F(X Y)
    (COND
        ((< X Y) X)
        (T Y)))
    
    ;Y


; sumadeux simpler 
(defun suma2(L)
    (cond
        ((numberp L) L)
        ((atom L) 0)
        (T (+ (suma2(car L)) (suma2(cdr L))))))
    


(DEFUN INVERS_AUX(L Col)
    (COND 
        ((NULL L) Col)
        (T (INVERS_AUX(CDR L)(CONS (CAR L) Col))))) 
    


(DEFUN INVERS(L)
    (INVERS_AUX L ()))


(defun dublare(l)
    (cond
        ((numberp l) (* 2 l))
        ((atom l) l)
        (t (cons (dublare (car l)) (dublare (cdr l))))))
    
