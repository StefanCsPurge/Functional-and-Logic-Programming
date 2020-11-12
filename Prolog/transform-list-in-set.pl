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


	
% Transform a list in a set, in the order of the last occurrences of elements

% remove(A: list, R: list)
% flow model (I,O)

remove([],[]).

remove([H|T],R):-
	count(T,H,0),
	remove(T,R1),
	R = [H|R1].

remove([H|T],R):-
	count(T,H,C), 
	C \= 0,
	remove(T,R).

% run example:
% remove([1,2,3,1,2],X).
% X = [3,1,2]
