inverter(L1,L2):-
    rev(L1,[],L2).
rev([],InvList,InvList).
rev([Beg|Rest],S,R):-
    rev(Rest,[Beg|S],R).