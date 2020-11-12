% firstOf(L:List, X: element) , checks if X is the first element of L
% flowmodel(I,I)
firstOf([X|_],X):-!.

% appendNotRepeating(X: element, L: List, Res: ResultedList) , adds X to the sorted list L only if it is not already there
% flowmodel(I,I,O)

appendNotRepeating(X,L,Res):-
	\+firstOf(L,X),
	Res = [X|L].

appendNotRepeating(X,L,Res):-
	firstOf(L,X),
	Res = L.


%		             | ∅ if the lists are empty
%	                     | L1 ⊕ merge(l1...ln, L2...Ln) if l1...ln is empty or L1<l1 and  L1 not in merge(l1...ln, L2...Ln)
% merge(l1..ln, L1...Ln)  =  | l1 ⊕ merge(l2...ln, L1...Ln) if L1...Ln is empty or l1<L1  and  l1 not in merge(l2...ln, L1...Ln)
%	                     | L1 ⊕ merge(l2...ln, L2...Ln) if  L1 = l1 and  L1 not in merge(l2...ln, L2...Ln)
%
% merge(L: List, L2: List, Res: ResultedList), merges 2 sorted lists with removing the double values
% flowmodel(I,I,O)
merge([],[],[]).

merge([],[H|T],Res):-
	merge([],T,Res1),
	appendNotRepeating(H,Res1,Res).

merge([H|T],[],Res):-
	merge(T,[],Res1),
	appendNotRepeating(H,Res1,Res).

merge([H1|T1],[H2|T2],Res):-
	H1 < H2,
	L = [H2|T2],
	merge(T1,L,Res1),
	appendNotRepeating(H1,Res1,Res).


merge([H1|T1],[H2|T2],Res):-
	H1 > H2,
	L = [H1|T1],
	merge(L,T2,Res1),
	appendNotRepeating(H2,Res1,Res).

merge([H1|T1],[H2|T2],Res):-
	H1 = H2,
	merge(T1,T2,Res1),
	appendNotRepeating(H1,Res1,Res).


%		            |  ∅ if the heterogeneous list is empty
% mergeSublists(HL1...HLn) =| merge(HL1, mergeSublists(HL2...HLn) if HL1 is a list
%		            | mergeSublists(HL2...HLn) otherwise
%
% mergeSublists(L: HetList, L2: ResultedList) , for a heterogeneous list, 
% formed from integer numbers and list of numbers, 
% merges all sublists with removing the double values.
% flowmodel(I,O)
mergeSublists([],[]).

mergeSublists([[Hs|Ts]|T], Res):-
	mergeSublists(T,Res1),
	L = [Hs|Ts],
	merge(L,Res1,Res),!.

mergeSublists([H|T], Res):-
	mergeSublists(T,Res1),
	merge([],Res1,Res),!.


% call example:
% mergeSublists([1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5, [1, 1, 11], 8], X).
% X = [1, 2, 3, 4, 6, 7, 9, 10, 11]
