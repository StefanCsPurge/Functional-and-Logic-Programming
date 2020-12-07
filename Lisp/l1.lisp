
; a) Function to return the product of two vectors
; (dotproduct '(1 2 3) '(4 5 6))
; Mathematical model
;                               | 0 if both lists empty
; dotproduct(l1...ln,L1...Ln) = | l1*L1 + dotproduct(l2...ln,L2...Ln) otherwise
;                              

(defun dotproduct(v1 v2)
    (cond
        ((and (null v1) (null v2)) 0)
        (t (+ (* (car v1) (car v2)) (dotproduct (cdr v1) (cdr v2))))))
    

(format t "Dot product:")
(print (dotproduct '(1 2 3) '(4 5 6)))
(print (dotproduct '(1 2 3) '(1 1 1)))


; b) Function to return the depth of a list. Example: the depth of a linear list is 1
; Mathematical model
;                      | 1 if the list is empty
; get_depth(L1...Ln) = | max(get_depth(L1) + 1, get_depth(L2...Ln)) if L1 is a list
;                      | get_depth(L2...Ln) otherwise

(defun mymax (a b)
    (cond 
        ((> a b) a)
        (t b)))
    


(defun get_depth(L)
    (cond
        ((null L) 1)
        ((listp (car L)) (mymax (+ 1 (get_depth(car L))) (get_depth(cdr L))))
        (T (get_depth(cdr L)))))
    


(format t "~%List depth:")
(print (get_depth '(1 2 3 (1 2 ((3) 10)) ((4) 5))))


; c) Function to sort a linear list without keeping the double values
; Mathematical model
;                        | (elem) if the list is empty
; insert(L1...Ln,elem) = | L1...Ln if L1 = elem
;                        | elem U L1...Ln if L1 > elem 
;                        | L1 U insert(L2...Ln,elem) otherwise
;
;                 | ∅ if the list is empty
; sort(L1...Ln) = | insert(sort(L2...Ln), L1) otherwise
; 

(defun insert(L elem)
    (cond
        ((null L) (list elem))
        ((equal (car L) elem) L)
        ((> (car L) elem) (cons elem L))
        (T (cons (car L) (insert (cdr L) elem))))) 
    


(defun double_kill_sort(L)
    (cond
        ((null L) ())
        (T (insert (double_kill_sort(cdr L)) (car L)))))
    


(format t "~%Sorted list:")
(print (double_kill_sort '(100 4 3 4 1 6 7 10 0 10)))


; d) Function to return the intersection of 2 sets
; Mathematical model
;                       | false if the set is empty
; found(elem,L1...Ln) = | true if elem = L1
;                       | found(elem,L2...Ln) otherwise
;
;                                 | ∅ if a set is empty
; intersection(l1...ln,L1...Ln) = | l1 U intersection(l2...ln,L1...Ln) if found(l1,L1...Ln)
;                                 | intersection(l2...ln, L1...Ln) otherwise

(defun found(elem L)
    (cond
        ((null L) nil)
        ((equal elem (car L)) T)
        (T (found elem (cdr L)))))
    


(defun my_intersection(S1 S2)
    (cond
        ((or (null S1) (null S2)) ())
        ((found (car S1) S2) (cons (car S1) (my_intersection (cdr S1) S2)))
        (T (my_intersection (cdr S1) S2))))
    


(format t "~%Intersection of sets:")
(print (my_intersection '(1 9 2 3 4) '(3 2 10 11 0)))





;                   | 1 if the list is empty
; nrSubl(L1...Ln) = | nrSubl(L1) + nrSubl(L2...Ln) if L1 is a list
;                   | nrSubl(L2...Ln) otherwise