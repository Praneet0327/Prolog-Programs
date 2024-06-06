travel(e,w).
travel(w,e). 
 
%% Possible moves.
 
move([X,X,Goat,Cabbage],wolf,[Y,Y,Goat,Cabbage]) :- travel(X,Y).
move([X,Wolf,X,Cabbage],goat,[Y,Wolf,Y,Cabbage]) :- travel(X,Y).
move([X,Wolf,Goat,X],cabbage,[Y,Wolf,Goat,Y]) :- travel(X,Y).
move([X,Wolf,Goat,Cabbage],nothing,[Y,Wolf,Goat,Cabbage]) :- travel(X,Y).

safe([X,_,X,_]). % Goat is on the same bank as farmer.
safe([X,X,_,X]). % Wolf and cabbage are on the same bank as farmer
 
solve([e,e,e,e],[]).
solve(State,[FirstMove|OtherMoves]) :- 
move(State, FirstMove, NextState), safe(NextState), solve(NextState, OtherMoves).

