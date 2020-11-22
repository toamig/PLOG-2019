ligado(a,b). ligado(f,i). ligado(a,c). ligado(f,j). ligado(b,d). ligado(f,k). ligado(b,e). ligado(g,l). ligado(b,f). ligado(g,m). ligado(c,g). ligado(k,n). ligado(d,h). ligado(l,o). ligado(d,i). ligado(i,f). 

membro(X, [X|_]):- !. 
membro(X, [_|Y]):- membro(X,Y). 

concatena([], L, L). 
concatena([X|Y], L, [X|Lista]):- concatena(Y, L, Lista). 

inverte([X], [X]). 
inverte([X|Y], Lista):- inverte(Y, Lista1), concatena(Lista1, [X], Lista).

%%devolve uma lista
resolva_prof(NoInicial,NoMeta,Solucao):-


profundidade(Lista,NoMeta,NoMeta,[NoMeta|Caminho]).
profundidade(Caminho, No, NoMeta, Sol):-       
    ligado(No, No1),            
    not membro(No1, Caminho),            
    % previne ciclos       
    profundidade([No|Caminho], No1, NoMeta, Sol).