%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate combinations of Half-dollars, Quarters, Dimes, Nickels, and Pennies
% that can comprise total value V.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- include(bound).

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
  V >= M, Q is V//M,
  bound_desc(X, 1, Q),
  V1 is V - M*X.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Flattens results from change/6 into a list, [H, Q, D, N, P]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
change(V, R) :-
  change(V, H, Q, D, N, P),
  R = [H, Q, D, N, P].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Returns results from change as a list of coins
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
change_set(V, R) :-
  change(V, H, Q, D, N, P),
  build_list(half_dollar, H, H1),
  build_list(quarter, Q, Q1),
  build_list(dime, D, D1),
  build_list(nickel, N, N1),
  build_list(penny, P, P1),
  flatten([H1, Q1, D1, N1, P1], R).

% generate a list with element X, repeating N times.
build_list(X, N, List) :-
  findall(X, between(1, N, _), List).





