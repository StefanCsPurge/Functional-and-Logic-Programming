; mergeLists(L1...Ln, K1...Km) = {
;           K1...Km if first list empty
;           L1...Ln if second list empty
;           L1 U mergeLists(L2...Ln,K1...Km) if L1 < K1
;           L1 U mergeLists(L2...Ln,K2...Km) if L1 = K1
;           K1 U mergeLists(L1...Ln,K2...Km) otherwise }

(defun mergeLists(L K)
    (cond
        ((null L) K)
        ((null K) L)
        ((< (car L)(car K)) (cons (car L) (mergeLists (cdr L) K)))
        ((= (car L) (car K)) (cons (car L) (mergeLists (cdr L) (cdr K))))
        (T (cons (car K) (mergeLists L (cdr K))))
    )
)

(print (mergeLists '(1 3 5 7 9) '(2 3 6 7 8 9)))


; Def a function to remove all the occurences of an element from a list
; removeAll(L1..Ln,elem) = {
;                  () if the list is empty
;                  removeAll(L2...Ln, elem) if L1 is atom and L1 = elem
;                  L1 U removeAll(L2...Ln, elem) if L1 atom and L1 != elem
;                  removeAll(L1, elem) U removeAll(L2...Ln, elem) otherwise }

(defun removeAll (L elem)
    (cond 
        ((null L) ())
        ((and (atom (car L)) (= (car L) elem)) (removeAll (cdr L) elem))
        ((atom (car L)) (cons (car L) (removeAll (cdr L) elem)))
        (T (cons (removeAll (car L) elem) (removeAll (cdr L) elem)))
    )
)

(print (removeAll '(2 43 1 3 19 1) 1))