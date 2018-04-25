## Dependancies
Requires `gprolog`, which is available through a few different providers:
* On OSX, recommend Homebrew – `brew install gnu-prolog`

## Demonstrations

### Generating sets of change
Prolog will continue to generate solutions as long as `;` is entered.
```
% gprolog --consult-file change.pl
| ?- change(100, H, Q, D, N, P).

H = 2
Q = 0
D = 0
N = 0
P = 0 ? ;

H = 1
Q = 2
D = 0
N = 0
P = 0 ? ;

H = 2
Q = 1
D = 2
N = 1
P = 0 ? ;

H = 1
Q = 1
D = 2
N = 0
P = 5 ?

yes
```

### Counting number of solutions
Predicate `bagof/3` accumulates results of the given predicate into a list, which can then be counted.  Note that this is not particularly memory-efficient, and a custom implementation that does not store results will do better.
```
% gprolog --consult-file change.pl
| ?- bagof(R, change_set(100, R), B), length(B, N).

N = 292

(9ms) yes
```
