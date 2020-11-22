pilot('Lamb').
pilot('Besenyei').
pilot('Chambliss').
pilot('MacLean').
pilot('Mangold').
pilot('Jones').
pilot('Bonhomme').

team('Breitling','Lamb').
team('Red Bull','Besenyei').
team('Red Bull','Chambliss').
team('Mediterranean Racing Team','MacLean').
team('Cobra','Mangold').
team('Matador','Jones').
team('Matador','Bonhomme').

plane('MX2','Lamb').
plane('Edge540','Besenyei').
plane('Edge540','Chambliss').
plane('Edge540','MacLean').
plane('Edge540','Mangold').
plane('Edge540','Jones').
plane('Edge540','Bonhomme').

circuit('Istanbul').
circuit('Budapest').
circuit('Porto').

person_win('Porto','Jones').
person_win('Budapest','Mangold').
person_win('Istanbul','Mangold').

gates('Istanbul',9).
gates('Budapest',6).
gates('Porto',5).

team_win(Team,Circuit):-
    team(Team,Pilot),
    person_win(Circuit,Pilot).


