%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate streams of integers on backtracking.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% generate integers X that satisfy [A, B], starting with B.
bound_desc(X, A, B) :- lte(X, B), (X < A, !, fail ; true).

% generate integers X that satisfy [A, B], starting with A.
bound(X, A, B) :- gte(X, A), (X > B, !, fail ; true).

% generate integers X that are less than Y, or compare two integers
lt(X, Y) :- number(X), number(Y), !, X < Y.
lt(X, Y) :- posint(Z), X is Y - Z.

 % generate integers X that are less than or equal to Y, or compare two integers
lte(X, X).
lte(X, Y) :- lt(X, Y).

% generate integers X that are greater than Y, or compare two integers
gt(X, Y) :- number(X), number(Y), !, X > Y.
gt(X, Y) :- posint(Z), X is Y + Z.

% generate integers X that are greater than or equal to Y, or compare two integers
gte(X, X).
gte(X, Y) :- gt(X, Y).

% generate stream of positive integers
posint(1).
posint(X) :- posint(Y), X is Y + 1.
