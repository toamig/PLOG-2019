e_primo(2).
e_primo(3).
e_primo(P):-
    P > 3,
    P mod 2 =\= 0,
    \+is_composite(P,3).

is_composite(P,Div):-
    P mod Div =:= 0.
is_composite(P,Div):-
    Div * Div < P,
    Div_aux is Div + 2,
    is_composite(P,Div_aux).