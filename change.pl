%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate combinations of Half-dollars, Quarters, Dimes, Nickels, and Pennies
% that can comprise total value V.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

change(V, H, Q, D, N, P) :-
  change_bound_helper(V, 50, H, V1),
  change(V1, 0, Q, D, N, P).

change(V, 0, Q, D, N, P) :-
  change_bound_helper(V, 25, Q, V1),
  change(V1, 0, 0, D, N, P).

change(V, 0, 0, D, N, P) :-
  change_bound_helper(V, 10, D, V1),
  change(V1, 0, 0, 0, N, P).

change(V, 0, 0, 0, N, P) :-
  change_bound_helper(V, 5, N, V1),
  change(V1, 0, 0, 0, 0, P).

change(V, 0, 0, 0, 0, P) :-
  P is V.

change_bound_helper(V, M, X, V1) :-
  V >= M,
  Q is V//M,
  bound_desc(X, 1, Q),
  V1 is V - M*X.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Library code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% generate integers X that satisfy [A, B], starting with B.
bound_desc(X, A, B) :-
  lte(X, B), (X < A, !, fail ; true).

% generate integers X that satisfy [A, B], starting with A.
bound(X, A, B) :-
  gte(X, A), (X > B, !, fail ; true).


% generate integers X that are less than Y, or compare two integers
lt(X, Y) :-
  number(X), number(Y), !,
  X < Y.

lt(X, Y) :-
  posint(Z),
  X is Y - Z.

 % generate integers X that are less than or equal to Y, or compare two integers
lte(X, X).
lte(X, Y) :-
  lt(X, Y).

% generate integers X that are greater than Y, or compare two integers
gt(X, Y) :-
  number(X), number(Y), !,
  X > Y.

gt(X, Y) :-
  posint(Z),
  X is Y + Z.

% generate integers X that are greater than or equal to Y, or compare two integers
gte(X, X).
gte(X, Y) :-
  gt(X, Y).

% generate stream of positive integers
posint(1).
posint(X) :- posint(Y), X is Y + 1.
