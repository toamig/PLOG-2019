membro(X,[H|T]):-
    X =:= H,
    !.
membro(X,[H|T]):-
    membro(X,T).

membro_append(X,L):-
    append(_,[X|_],L).

last(L,X):-
    append(_,[X],L).

n-element(1,[X|_],X).

n-element(N,[_|T],X):-
    N > 1,
    N1 is N - 1,
    n-element(N1,T,X).

    