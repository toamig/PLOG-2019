das([],L,L). % Base case
das([X|L1],L2,[X|L]):-
    das(L1,L2,L).

