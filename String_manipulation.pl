%To find sum using recursion in prolog
%sumlist([],0).
%sumlist([H|T],N) :- sumlist(T,N1),N is N1+H.


%To find number of elements in a list
%count([],0).
%count([H|T],N) :- count(T,N1),N is N1+1.


%To find whether the given number is present in the list or not
%search(X,[X|_]).
%search(X,[_|T]) :- search(X,T).


%To append list
%append( [], X, X).
%append( [X | Y], Z, [X | W]) :- append( Y, Z, W).


%To check given list is sorted or not
%is_sorted([]).
%is_sorted([_]).
%is_sorted([X,Y|T]):- X=<Y , is_sorted([Y|T]).