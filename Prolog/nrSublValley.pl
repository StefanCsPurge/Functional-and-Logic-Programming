
% getOne(list, element)
% Flow model: (I,O), (I,I)

getOne([H|_], H).

getOne([_|T], E):-
	getOne(T, E).

% getOne2(list,element,list)
% flow model: (I,O,O)

getOne2([H|T],H,T).
getOne2([H|T],E,[H|R]):-
	getOne2(T,E,R).

% we will use getOne2
% Generate the solutions
% Parameters for function to generate the solution
% Directions, input list, collector list, result list (only in Prolog)

% generator(L,Dir,c1...cn): { c1...cn, Dir=0
%			      generator(L,Dir,e U c1...cn),(e,list)=getOne2(L),Dir=1, e<c1
%			      generator(L,0,e U c1...cn), (e,list)=getOne2(L), e>c1, n>1
% 

% generator(list,int,list,list)
% flow model (I,I,I,O)

generator(L,0,H,H).
generator(L,1,[H|T],R):-
	getOne2(L,H1,T1),
	H1<H,
	generator(T1,1,[H1,H|T],R).

generator(L,Dir,[H,H2|T],R):-
	getOne2(L,H1,T1),
	H1>H,
	generator(T1,0,[H1,H,H2|T],R).

% this needs a wrapper function
% bc generator([1,2,3,4],1,[],R). will be False.

% generate(L) = generator(list,1,[e]), (e,list) = getOne2(L)
% generate(list,list)
% flow(I,O), (I,I)

generate(L,R):- getOne2(L,E,R1), generator(R1,1,[E],R).


% to show all backtracking solutions at once
% gen(l1...ln) = U generate(l1...ln)

% gen(list,list)
% flow(I,O), (I,I)
gen(L,R):- findall(Output, generate(L,Output), R).
                      
