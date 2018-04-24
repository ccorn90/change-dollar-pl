## Dependancies
Requires `gprolog`, which is available through a few different providers:
* On OSX, recommend Homebrew – `brew install gnu-prolog`

## Demonstration

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

Prolog will continue to generate solutions as long as `;` is entered.
