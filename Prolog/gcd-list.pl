
% Define a predicate to determine the greatest common divisor of all numbers in a list

% Flow model cmmdc(I,I,O)
% X is the first number, Y the second, Res the result variable
cmmdc(X,0,Res):-
	Res is X.

cmmdc(X,Y,Res):-
	R is mod(X,Y),
	cmmdc(Y,R,Res).

% Flow model cmmdcArray(I,O)
% 1st param is the list, R is the result
cmmdcArray([],R).

cmmdcArray([H|T],R):-
	cmmdcArray(T,R1),
	cmmdc(H,R1,R).

% run example:
% cmmdcArray([2,4,8],X).
% X = 2