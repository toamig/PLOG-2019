ask_for_move(Board,Player,NewBoard,_CPU1,_CPU2):- %HUMAN PART
    valid_moves(Board,Player,_),
    either(Player,0,1),
    get_input('Start X',StartX),
    get_input('Start Y',StartY),
    get_piece(Board,StartX,StartY,Piece),
    ((Player == 0,
    Piece == 'i');
    (Player == 1,
    Piece == 'b')),
    get_input('Steps ',Steps),
    move([StartX,StartY,Steps],Board,NewBoard).

ask_for_move(Board,Player,Board,_CPU1,_CPU2):- %HUMAN PART
    \+(valid_moves(Board,Player,_)).

ask_for_move(Board,Player,NewBoard,CPU1,CPU2):- %CPU PART
    either(Player,2,3),
    ((Player == 2,
    choose_move(Board,Player,CPU1,NewBoard));
    (Player == 3,
    choose_move(Board,Player,CPU2,NewBoard))).


ask_for_move(Board,_,Board):-
    write('Please choose a correct piece!'),
    nl,
    nl,
    fail.

game_loop(Board, Player, Mode,CPU1,CPU2):-
    game_over(Board, Winner)
    ;
    value(Board,[Ice,Black]),
    nl,
    format('Ice Score: ~w  |  Black Score: ~w',[Ice,Black]),nl,nl,
    print_board(Board),
    greet_player(Player),
    ask_for_move(Board,Player,NewBoard,CPU1,CPU2),
    change_player(Player,Mode,AuxPlayer),
    !,
    game_loop(NewBoard, AuxPlayer, Mode,CPU1,CPU2).

%IN CASE OF INVALID MOVE RETURN THE SAME VARIABLES
game_loop(Board, Player, Mode,_CPU1,_CPU2):-
    game_loop(Board, Player, Mode,_CPU1,_CPU2).