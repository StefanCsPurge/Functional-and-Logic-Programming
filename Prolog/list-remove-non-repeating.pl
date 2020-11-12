%count the no of occurencies of an element in a list
%count(L: list, X: elem, Res: int)
%flow model (I,I,O), (I,I,I)

count(L,_,Res):-
	L = [], Res = 0.

% sau varianta simpla:
% count([],_,0).

count([H|T],X,Res):-
	H = X,
	count(T,X,R1),
	Res is R1+1.

count([H|T],X,Res):-
	H \= X,
	count(T,X,Res).


	
% Write a predicate to remove from a list all the elements that appear only once. For example:
% [1,2,1,4,1,3,4] => [1,1,4,1,4].

%remove(A: list, B: list, R: list) - we need the list twice bc count needs the whole list to ret the correct result
% flow model (I,I,o), (I,I,I)

remove(_,[],[]).

remove(A,[H|T],R):-
	count(A,H,1),  % here is the in operation, continues only if True
	remove(A,T,R).

remove(A,[H|T],R):-
	count(A,H,C), % here is the out operation (it gets the C variable)
	C \= 1,
	remove(A,T,R1),
	R = [H|R1].

