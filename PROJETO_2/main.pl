:- use_module(library(clpfd)).
:- use_module(library(lists)).

%% n x n board
%% k symbols
% 1 - triangles
% 2 - squares
% 3 - circles

%level0([[2,1,0],[0,0,1],[2,0,0]]).

%level1([[1,0,2,0],[3,0,0,3],[0,0,3,0],[0,0,2,0]]).


%%level3([[0,0,1,0,0,0],[0,2,0,2,3,0],[3,0,0,0,1,0],[0,2,3,0,1,0],[0,0,2,1,0,3],[0,0,0,2,0,0]]). 

level000([[0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0]]). 


level00([[0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0]]). 

level01([[0,0,0,1,2],
        [0,0,0,2,0],
        [3,3,3,0,3],
        [0,1,1,0,3],
        [0,0,2,0,0]]).  

level02([[0,0,0,0,0],
        [1,0,2,0,0],
        [1,1,1,1,0],
        [0,0,0,2,3],
        [0,0,3,0,3]]). 

level03([[0,0,0,0,0],
        [3,2,0,0,0],
        [0,2,1,0,3],
        [2,0,3,1,0],
        [0,0,0,2,0]]). 

level04([[1,1,0,0,0],
        [2,0,0,0,0],
        [0,3,3,2,0],
        [0,0,1,0,0],
        [0,0,1,3,0]]). 

level05([[0,0,0,3,0],
        [3,3,0,0,0],
        [0,0,0,0,1],
        [2,1,3,0,0],
        [0,0,2,0,0]]). 

replaceZeros([],A,A).
replaceZeros([0|List],Aux,NewList):-
    append(Aux,[_],Al),
    !,
    replaceZeros(List,Al,NewList).
    
replaceZeros([Val|List],Aux,NewList):-
    append(Aux,[Val],Al),
    !,
    replaceZeros(List,Al,NewList).

replaceList([],NewListOfLists,NewListOfLists).

replaceList([Head|Tail],AuxListOfLists,NewListOfLists):-
    replaceZeros(Head,[],NewEntry),
    append(AuxListOfLists,[NewEntry],TempListOfLists),
    replaceList(Tail,TempListOfLists,NewListOfLists).


findMaxValue([],MaxVal,MaxVal).

findMaxValue([Element|List],AuxVal,MaxVal):-
    Element > AuxVal,
    !,
    findMaxValue(List,Element,MaxVal).

findMaxValue([Element|List],AuxVal,MaxVal):-
    !,
    findMaxValue(List,AuxVal,MaxVal).

maxLists([],TrueMax,TrueMax).

maxLists([List|Lists],AuxVal,MaxVal):-
    findMaxValue(List,AuxVal,TempVal),
    maxLists(Lists,TempVal,MaxVal).

pow(_,0,1).

pow(X,Y,Z) :- 
    Y #>= 0,
    Y1 #= Y - 1,
    pow(X,Y1,Z1), 
    Z #= Z1*X.


lineSum([],0,_K).
lineSum([Elem|Line],Sum,K):-
    lineSum(Line,AuxSum,K),
    pow(K,Elem,Aux),
    Sum #= (AuxSum + Elem) * Aux.

lineAnalizer(K,Line):-
    reverse(Line, ReversedLine),
    lineSum(Line,Sum,K),
    lineSum(ReversedLine,AuxSum,K),
    Sum #= AuxSum.

    




main(Board,SolutionBoard):-
    maxLists(Board,0,MaxVal),
    replaceList(Board,[],WorkingBoard),
    reset_timer,
    transpose(WorkingBoard, TransposeBoard),
    append(WorkingBoard, SolutionBoard),
    domain(SolutionBoard,0,MaxVal),
    print_time('PostingConstraints: '),
    maplist(lineAnalizer(MaxVal), WorkingBoard),
    maplist(lineAnalizer(MaxVal), TransposeBoard),
    labeling(['min'], SolutionBoard),
    print_time('LabelingTime: '),
    fd_statistics,
    statistics.
    

% main(Board, K,Variables):-
%     NewK is K + 1,
%     transpose(Board, TransposeBoard),
%     append(Board, Variables),
%     domain(Variables,0,K),
%     maplist(lineAnalizer(K), Board),
%     maplist(lineAnalizer(K), TransposeBoard),
%     labeling([], Variables).
    

reset_timer:-
    statistics(total_runtime, _).
print_time(Msg):- 
    statistics(total_runtime,[_,T]),
    TS is ((T//10)*10)/1000, nl,
    write(Msg), 
    write(TS), 
    write('s'), 
    nl, 
    nl.




    
