% The list a1, ..., an is given and it consists of distinct integers. 
% Write a predicate to determine all subsets with aspect of "mountain".

% getOne(l1...ln): { l1               n>0
		     getOne(l2...ln)
% getOne(list,element,list), takes 1 elem out of the list for each elem
% flow model: (I,O,O)

getOne([H|T],H,T).
getOne([H|T],E,[H|R]):-
	getOne(T,E,R).

% Direction shows which part of the mountain we are currently on (0 ascending, 1 descending)
% Parameters for function to generate the solution:
% Direction, input list, collector list, result list (in Prolog)

% generator(L,Dir,c1...cn): { c1...cn if Dir=0
%			      generator(sublist,0,e U c1...cn), (e,sublist)=getOne(L), e<c1, n>1
%			      generator(sublist,Dir,e U c1...cn), (e,sublist)=getOne(L), Dir=1, e>c1



% generator(list,int,list,list)
% flow model (I,I,I,O)

generator(L,0,H,H).

generator(L,Dir,[H,H2|T],R):-
	getOne(L,H1,T1),
	H1<H,
	generator(T1,0,[H1,H,H2|T],R).

generator(L,1,[H|T],R):-
	getOne(L,H1,T1),
	H1>H,
	generator(T1,1,[H1,H|T],R).


% wrapper function
% bc generator([1,2,3,4],1,[],R). will be False.

% generate(L) = generator(list,1,[e]), (e,list) = getOne(L)
% generate(list,list)
% flow(I,O)

generate(L,R):- getOne(L,E,R1), generator(R1,1,[E],R).


% to show all backtracking solutions at once
% gen(l1...ln) = U generate(l1...ln)

% gen(list,list)
% flow(I,O)
gen(L,R):- findall(Output, generate(L,Output), R).
                      
