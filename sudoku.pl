:- use_module(library(clpfd)).
:- use_module(library(lists)).

sudoku(Linhas):-
    length(Linhas, 9),
    maplist(same_length(Linhas), Linhas),
    Linhas = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
    transpose(Linhas, Colunas),
    append(Linhas,Colunas),
    domain(Vars,1,9),
    maplist(all_distinct,Linhas),
    maplist(all_distinct,Colunas),
    quadrante(As,Bs,Cs),quadrante(Ds,Es,Fs),quadrante(Gs,Hs,Is),
    labeling([], Vars),
    maplist(pprint_row,Linhas).
    
    
    
    
    
    