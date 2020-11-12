% belongs(E: element, L: list)
% (i,i) - determinist (o,i) - nedeterminist
belongs(E,[E|_]):-!.
belongs(E,[_|L]):-
belongs(E,L).

% difference(L: list, B:list, Res: list)
% flow model: (i,i,o) (i,i,i)
    
difference([],_,[]).

difference(A,[],A).

difference([H|T],B,Res):-
	\+belongs(H,B),
	difference(T,B,Res1),	    
	Res=[H|Res1].

difference([H|T],B,Res):-
	belongs(H,B),
	difference(T,B,Res).


